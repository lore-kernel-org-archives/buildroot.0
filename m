From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 10:26:24 +0200
Subject: [Buildroot] [PATCH] wandboard: Use HTTP for accessing Linux
	kernel and U-Boot git repos
In-Reply-To: <1467099927-32036-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Tue, 28 Jun 2016 10:45:27 +0300")
References: <1467099927-32036-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87eg7hpvm7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Quite often these days Git ports are blocked by firewalls
 > [this is especially true in corporate environment] so switching
 > to common HTTP(s) is a safe and pretty convenient move.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Stephan Hoffmann <sho@relinux.de>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Sergio Prado <sergio.prado@e-labworks.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  configs/wandboard_defconfig | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

Committed, thanks.

 > -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"

This is actually just the 2015.07 release:

git describe 33711bdd4a4dce942fb5ae85a68899a8357bdd94
v2015.07

So I've changed it to use the release tarball instead.

-- 
Venlig hilsen,
Peter Korsgaard 
