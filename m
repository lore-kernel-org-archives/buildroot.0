From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Mar 2017 08:20:54 +0100
Subject: [Buildroot] [PATCH] fs/iso9660: doesn't support (grub2) EFI
In-Reply-To: <20170301215400.5f184cac@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 1 Mar 2017 21:54:00 +0100")
References: <73760f82-95af-ba23-7f23-3e2e79136ca4@mind.be>
 <20170301200542.19418-1-arnout@mind.be>
 <20170301215400.5f184cac@free-electrons.com>
Message-ID: <87bmtkgn55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 1 Mar 2017 21:05:42 +0100, Arnout Vandecappelle
 > (Essensium/Mind) wrote:
 >> The iso9660 generation for grub2 assumes that grub-eltorito.img is
 >> available. However, this image is only available for the i386-pc target
 >> (i.e. legacy BIOS). An EFI-bootable iso9660 requires a different layout.
 >> 
 >> Since we currently can't generate the EFI-bootable iso9660 layout,
 >> require the i386-pc target to be selected in grub.
 >> 
 >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> Reported-by: arnaud.miche at orange.com
 >> ---
 >> fs/iso9660/Config.in | 8 ++++----
 >> 1 file changed, 4 insertions(+), 4 deletions(-)

 > Applied to master, thanks. Peter, I believe this one qualifies for the
 > LTS branch.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
