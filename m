From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 Apr 2009 16:51:49 +0200
Subject: [Buildroot] [NEWBIE] Disable U-Boot
In-Reply-To: <39f1c8d30904030716u38c3b238jb62178d41184a9c8@mail.gmail.com>
	(Roger Varley's message of "Fri\, 3 Apr 2009 17\:16\:08 +0300")
References: <39f1c8d30904030431m793edfc1md570b73135cbe941@mail.gmail.com>
	<87wsa152ny.fsf@macbook.be.48ers.dk>
	<39f1c8d30904030716u38c3b238jb62178d41184a9c8@mail.gmail.com>
Message-ID: <87myax4woq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roger" == Roger Varley <roger.varley@googlemail.com> writes:

Hi,

 Roger> Thanks for your response - that was the problem. Now I'm getting a
 Roger> failure later in the "make" process.

 Roger> In file included from .stdint.h:87
 Roger>                      from <long path name
 to> /build_i486/staging_dir/usr/include/stdlib.h:860
 Roger>                      from ./stdlib.h:44
 Roger>                      from allocsa.h:24
 Roger>                      from allocsa.h:22
 Roger> ./wchar.h:41:12: error: empty filename in #include

What package is this from? Coreutils?

 Roger> This happens whether I've selected wchar support or not
 Roger> through menuconfig.

You have to do a complete rebuild (rm -rf *build_*; make) after you
change something to the toolchain config.

-- 
Bye, Peter Korsgaard
