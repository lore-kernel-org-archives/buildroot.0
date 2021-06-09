From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 22:48:10 +0200
Subject: [Buildroot] [git commit] package/pifmrds: always link with -lm
In-Reply-To: <20210525193010.7159F7FA7C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 25 May 2021 21:29:59 +0200")
References: <20210525193010.7159F7FA7C@busybox.osuosl.org>
Message-ID: <87v96mojcl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8258081602cf0cacf182fccafdf2f437b1c3f5c5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 888546e5273d77d49bec564a515e85d7acee6bdd wrongly removed linking
 > with -lm resulting in the following build failure:

 > /home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-linux-gnueabihf-gcc  -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lsndfile
 > /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: fm_mpx.o: undefined reference to symbol 'cos@@GLIBC_2.4'
 > /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b2a6e6fd77bf9071ce9f75fed1811be9ffe5366d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
