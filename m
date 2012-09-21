From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 08:21:23 -0300
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C4C17.2000701@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
Message-ID: <505C4DB3.8000008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 08:14, Arnout Vandecappelle wrote:

>> Makefile:CPPFLAGS += $(shell pkg-config --cflags fuse)
>> Makefile:LIB = $(shell pkg-config --libs fuse)
>>
>> As long as there's one on PATH it'll just work.
> 
>  No, unless libfuse-dev is installed on the autobuilders. 
> /usr/bin/pkg-config
> doesn't look in $(STAGING_DIR)...

Also on that Makefile expression the result will fail with an error
message passing by (missing pkg-config or fuse.pc) but won't make make
(sic) bailout, try it...
Regards.
