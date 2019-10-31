From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:33:24 +0100
Subject: [Buildroot] [git commit] package/gpsd: Fix systemd service
 installation and paths
In-Reply-To: <20191027192032.5BF7B8A52C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 27 Oct 2019 20:27:03 +0100")
References: <20191027192032.5BF7B8A52C@busybox.osuosl.org>
Message-ID: <871rutx9vv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=690222d239c951c14844c9de4f8ce485af287f9f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix several issues with systemd service file installation for gpsd:

 > - systemd support in the gpsd build was defaulting to enabled or not
 > based on whether the host system had systemd directories present. Set
 > this explicitly based on whether BR2_INIT_SYSTEMD is set.

 > - The installed systemd service files referenced paths in /usr/local when
 > the actual binaries are installed in /usr. Replace /usr/local with /usr
 > in the installed service files.

 > - When BR2_PACKAGE_HAS_UDEV was enabled, all of the binaries were
 > re-installed again, along with the udev rules, as part of the
 > post-install hooks. This overwrites the service files that were just
 > fixed up. Since udev-install implies install, we can just call
 > udev-install.

 > Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
