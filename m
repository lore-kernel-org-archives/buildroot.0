From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 00:22:26 +0200
Subject: [Buildroot] [PATCH v2] omniorb: cleanup autobuild failure,
	CFLAGS issue
In-Reply-To: <1380659659-886-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Tue, 1 Oct 2013 15:34:19 -0500")
References: <1380659659-886-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87txgznwil.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 Matt> Fixed:
 Matt> http://autobuild.buildroot.net/results/a08baf8821e3ee1fb9c36c8f74c4ced466af167b/
 Matt> http://autobuild.buildroot.net/results/f0c7379c1f405385d3a64c0349c3d9565065e8a7/
 Matt> http://autobuild.buildroot.net/results/c3de25ca52fdb8ffda7472cf9f7b64514954cbb1/

 Matt> Change Log:
 Matt> The target CFLAGS were getting mixed in during a manual build of some
 Matt> omniorb pkg tools that could be viewed as host tools.
 Matt> This manual build was a dirty workaround and created some bad
 Matt> cornercases. So I converted the package over to actually using the
 Matt> host pkg build and removed the need for a patch and custom mods in the build.

 Matt> Also there wasn't a dependency on the target having python, just
 Matt> host-python for performing the initial build.  So depends were adjusted
 Matt> accordingly. If python bindings are required, they can be found in a different
 Matt> package called omniORBpy.  The omniORB package only uses python for
 Matt> the build process.

 Matt> Fixed a bug with long double support.  Currently leaving it
 Matt> disabled as most targets won't use it.  This allows greater
 Matt> toolchain compatibility.

Committed, thanks.

-- 
Bye, Peter Korsgaard
