From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:36:30 +0200
Subject: [Buildroot] [PATCH] package/host-e2fsprogs: explicitly do not
 install udev and systemd files
In-Reply-To: <20200717120654.548833-1-antoine.tenart@bootlin.com> (Antoine
 Tenart's message of "Fri, 17 Jul 2020 14:06:54 +0200")
References: <20200717120654.548833-1-antoine.tenart@bootlin.com>
Message-ID: <87tuxzhjcx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Tenart <antoine.tenart@bootlin.com> writes:

 > Explicitly do not install udev rules and systemd units when installing
 > the host version of e2fsprogs, as we do not need those files when
 > calling host tools provided by e2fsprogs from Buildroot.

 > This fixes a weird issue I encountered: host-e2fsprogs was built and
 > installed without any issue when building an image from scratch. But any
 > attempt to rebuild host-e2fsprogs alone was failing during the
 > installation steps as it tried to install files to the host system.

 > This is because e2fsprogs' build system (autotools) is using the prefix
 > given at configuration time when installing its binaries, configuration
 > files, man pages, etc... but not when installing its systemd units and
 > udev rules.

 > The issue did not arise when building it from scratch, as host-e2fsprogs
 > do not have a dependency on host-udev/systemd, so its configure script
 > did not automatically enable udev/systemd installation steps at first.

 > Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
