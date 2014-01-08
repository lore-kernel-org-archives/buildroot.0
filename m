From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 8 Jan 2014 09:12:45 -0600
Subject: [Buildroot] [PATCH] cryptsetup: Link against -lrt for
	clock_gettime
In-Reply-To: <1389115451-4096-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1389115451-4096-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <OF00B93CC6.8A6EB2A8-ON86257C5A.0052E7B2-86257C5A.00538718@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent,

buildroot-bounces at busybox.net wrote on 01/07/2014 11:24:11 AM:

> Applying an upstream patch to fix clock_gettime undefined reference
> errors.
> 
> Upstream patch URL:
>    https://code.google.com/p/cryptsetup/source/detail?
> r=3ba95a822f70ff1e8141230bc2830ae46346486b
> 
> Fixes:
>    http://autobuild.buildroot.net/results/bed/
> bed37fac9bc54d3dbe956e4af632a044a5829acd/
> 

I tried your patch but the build errored with the following lines.

Making install in po
/home/test/outputs/b5e/b5ef439aed8bce6c43381daa69bce690131d2934/output/target/usr/share
make[3]: execvp: 
/home/test/outputs/b5e/b5ef439aed8bce6c43381daa69bce690131d2934/output/target/usr/share: 
Permission denied
make[3]: *** [install-data-yes] Error 127
make[2]: *** [install-recursive] Error 1
make[1]: *** 
[/home/test/outputs/b5e/b5ef439aed8bce6c43381daa69bce690131d2934/output/build/cryptsetup-1.6.3/.stamp_target_installed] 
Error 2
make: *** [_all] Error 2

This seems to be the same error that Axel Lin reported on 12/19 but I am 
not sure how to fix it. The issue is related to MKDIR_P not being defined 
properly (should be defined as "/bin/mkdir -p")when the install step is 
called for the po folder. The MKDIR_P variable is being found properly 
accoring to the config.log. I did a little digging but I was unable to 
find a solution. I am not an autoconf expert by any means but there may be 
someone else who has seen this issue before.

Thanks,
Clayton
