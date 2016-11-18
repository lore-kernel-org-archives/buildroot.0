From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 14:46:21 +0100
Subject: [Buildroot] [PATCH v2 02/15] reproducible: fix DATE/TIME macros
 in toolchain-wrapper
In-Reply-To: <20161118123704.00772557@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-3-git-send-email-jezz@sysmic.org>
 <20161118123704.00772557@free-electrons.com>
Message-ID: <73a11231172bc9ed95ce28032f53f6bf@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-18 12:37, Thomas Petazzoni wrote:
> On Fri, 18 Nov 2016 10:10:11 +0100, J?r?me Pouiller wrote:
> 
>> +ifeq ($(BR2_REPRODUCIBLE),y)
>> +TOOLCHAIN_WRAPPER_ARGS += -DBR_REPRODUCIBLE_TIME="\"\\\"`date -d 
>> @$(SOURCE_DATE_EPOCH) "+%T"`\\\"\""
>> +TOOLCHAIN_WRAPPER_ARGS += -DBR_REPRODUCIBLE_DATE="\"\\\"`date -d 
>> @$(SOURCE_DATE_EPOCH) "+%b %e %Y"`\\\"\""
>> +endif
> 
> Do we need to encode the dates in the wrapper, or should we have the
> wrapper read at runtime the SOURCE_DATE_EPOCH environment variable?
> 
> I believe the latter is simpler, and matches better what future gcc
> versions will do.
> 
> The only drawback is that people using the toolchain (through the
> wrapper) outside of Buildroot will not benefit from the "fixed" date,
> unless they define SOURCE_DATE_EPOCH in their environment. But I
> believe this is OK, because this is anyway the behavior that they would
> get by using the newest gcc versions that have this feature.

Agreed.

--
J?r?me Pouiller
