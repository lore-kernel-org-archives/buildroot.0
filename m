From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 12:55:52 +0200
Subject: [Buildroot] Issue with your autobuilder
Message-ID: <20160810125552.52e92db3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

It seems like your autobuilder instances has some issues:

http://autobuild.buildroot.net/results/b73/b73eb345a00bffae45acbfe51587adaa85207e79/build-end.log
shows:

  /bin/sh: 1: Cannot fork

http://autobuild.buildroot.net/results/6e4/6e4a877050342cf82ae764f5ceaea87a63afe2f1/build-end.log
shows the same.

http://autobuild.buildroot.net/results/066/0668fbb569bb37251c3e4dcb145345f5da77e4fb/build-end.log
shows no error at all, but the build failed, and it's the only
host-bison failure we ever had with this bison version (see
http://autobuild.buildroot.net/?reason=host-bison-3.0.4).

http://autobuild.buildroot.net/results/54d/54daef04d12891908f80a72d5c976d94ea2ec1f5/build-end.log
has some other weird errors:

/home/dawncrow/buildroot-test/scripts/instance-0/output/build/busybox-1.25.0/scripts/gen_build_files.sh: Cannot fork

Could you either fix the problem, or stop your autobuilder instance?
We're trying to reduce the number of build failures, so getting
spurious build failures really doesn't help.

See http://autobuild.buildroot.net/?submitter=Andre+Hentschel for all
the results from your autobuilders. Many of them are bogus build
failures.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
