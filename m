From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 19 Jun 2008 05:30:24 +0200
Subject: [Buildroot] relocate working buildroot
References: <4859C935.9030800@ripnet.com>
Message-ID: <007c01c8d1bd$cb502330$010514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mike sander wrote:
> Hi All,
> 
> Is anyone able to comment on how best to relocate and/or copy a
> working buildroot?
> 
> I have tried it (relocate to new location on same box) and did a "make
> clean" followed by "make".   Very soon I got failures due to not being
> able to delete some files at the original location.
> 
> With a bit of grepping I discovered that the original configuration
> full path is in numerous (i.e. too many to fix manually) locations
> throughout buildroot related files.
> 
> Are there some specific (maybe hidden) buildroot files that could be
> deleted to force the configuration stage to pick up the new path?
> 

I don't think you can.
I think you need to delete it all and rebuild

build_<arch>
project_build_<arch>
toolchain_build_<arch>

needs to go.

If you want to move to another machine, then you 
could try symlinking.

> Thanks in advance,
> 
> Mike Sander
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Best Regards
Ulf Samuelsson
