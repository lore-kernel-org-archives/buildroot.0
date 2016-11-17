From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Thu, 17 Nov 2016 14:17:41 +0100
Subject: [Buildroot] [PATCH 00/15] Reproducible builds
In-Reply-To: <20161117121341.4a63ed15@free-electrons.com>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
 <20161117121341.4a63ed15@free-electrons.com>
Message-ID: <9798cfe2186532e99707f24481a2a03a@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-17 12:13, Thomas Petazzoni wrote:
> On Thu, 17 Nov 2016 11:00:24 +0100, J?r?me Pouiller wrote:
[...]
>> Other thing known to break reproducibility:
>>   - use of lzop (it unconditionally include timestamps in result)
> 
> I guess we can patch lzop to avoid this issue, right?

I guess also.


>>   - since gcc versions supporting SOURCE_DATE_EPOCH are not widely 
>> available,
>>     external toolchains probably won't work.
> 
> Instead of patching gcc, can we solve the problem in the toolchain
> wrapper? I.e, maybe the toolchain wrapper can set __DATE__ and __TIME__
> by passing -D__DATE__=... -D__TIME__=... to gcc ?

Yes, I can switch to this solution.

-- 
J?r?me Pouiller
