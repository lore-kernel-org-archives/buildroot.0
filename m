From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:25:11 +0200
Subject: [Buildroot] [git commit] package/madplay: fix build when NLS is
 enabled
In-Reply-To: <20190417195654.0FAC28DEF1@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 17 Apr 2019 22:00:44 +0200")
References: <20190417195654.0FAC28DEF1@busybox.osuosl.org>
Message-ID: <877ebh3qe0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=00b733a39b0fe3902c96f6734c4f82c310cffc26
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > MKINSTALLDIRS is not automatically called by autotools when
 > autoreconfigured.
 > This leads to the following error during install:

 > `/bin/sh @MKINSTALLDIRS@ /home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
 > /bin/sh: 0: Can't open @MKINSTALLDIRS@`

 > because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.

 > This particular command only gets invoked when NLS is enabled.

 > Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
 > every @MKINSTALLDIRS@ occurence in *.in Makefile.

 > Patch is not sent upstream since upstream is dead.

 > Fixes:
 > http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
