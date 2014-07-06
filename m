From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jul 2014 22:26:31 +0200
Subject: [Buildroot] [PATCH] pkg-infra: do the package install before
	installing init files
In-Reply-To: <1404654347-1261-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 6 Jul 2014 15:45:47 +0200")
References: <1404654347-1261-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fvie2pzc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The init hooks may reference files installed by the package. For
 > example, when a package installs systemd unit files, and wants them
 > enabled/disabled by default, the init hokk may move/symlink/rename the
 > unit files.

 > Currently, the init hooks are called before the package is installed,
 > thus breaking the use-case above.

 > Just inverse the install orderr, so that a package is installed before
 > its init hooks are called.

 > Fixes: http://autobuild.buildroot.net/results/5b03174318d8a6dc3112053ff141b70a90869c20/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Makes sense - Committed, thanks.

-- 
Bye, Peter Korsgaard
