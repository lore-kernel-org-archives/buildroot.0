From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Sep 2012 13:23:06 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C4DB3.8000008@zacarias.com.ar>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar>
Message-ID: <505C4E1A.7000809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 13:21, Gustavo Zacarias wrote:
> On 09/21/12 08:14, Arnout Vandecappelle wrote:
>
>>> Makefile:CPPFLAGS += $(shell pkg-config --cflags fuse)
>>> Makefile:LIB = $(shell pkg-config --libs fuse)
>>>
>>> As long as there's one on PATH it'll just work.
>>
>>   No, unless libfuse-dev is installed on the autobuilders.
>> /usr/bin/pkg-config
>> doesn't look in $(STAGING_DIR)...
>
> Also on that Makefile expression the result will fail with an error
> message passing by (missing pkg-config or fuse.pc) but won't make make
> (sic) bailout, try it...

  But the final link will fail because of undefined fuse_xxx symbols,
because there is no -lfuse added by pkg-config.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
