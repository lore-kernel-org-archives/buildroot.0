From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:43:57 +0200
Subject: [Buildroot] [PATCH 1/1] dbus: fix dbus symlink removal
In-Reply-To: <1494031878-2982-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Fri, 5 May 2017 20:51:18 -0400")
References: <1494031878-2982-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87h90mlajm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > There was already a post-build hook to delete the /var/lib/dbus symlink
 > created by buildroot after the package's own installation, to prevent
 > a dbus installation error during "make dbus-rebuild".  However, this
 > misses the case for when one might delete the .stamp_target_installed
 > file manually, outside of dbus-rebuild.  This can be fixed by changing
 > the post-build hook to a pre-install hook.  This seems appropriate,
 > since it is really addressing an installation issue, not a build issue.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
