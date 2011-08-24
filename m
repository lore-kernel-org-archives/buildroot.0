From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2011 09:53:22 +0200
Subject: [Buildroot] [git commit] initramfs: fix boot with dynamic /dev
In-Reply-To: <20110720150418.E95188B391@busybox.osuosl.org>
References: <20110720150418.E95188B391@busybox.osuosl.org>
Message-ID: <201108240953.23168.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 20 July 2011 16:30:14, Peter Korsgaard wrote:
> Devtmpfs (which is used by devtmpfs/mdev/udev options) doesn't get
> automounted by the kernel when an initramfs is used, causing boot
> failures when a dynamic /dev is used.

 [Reviving an old issue]

 I now switched to a cpio that I use as an initrd and of course I encounter 
the same issue...  So we can do the same thing for cpio archives.  Then I have 
two issues:

 - Are cpio archives used for something else than initrd?  In that case, we 
shouldn't use this /init.  OTOH, /init is never used if it's not an initrd so 
it shouldn't really make a difference.

 - Clearly this should be refactored so we don't duplicate the same stuff in 
initramfs.mk and cpio.mk.

 Given that /init is only used in initramfs situations, why don't we create it 
unconditionally as part of the .root skeleton?  OK, it adds 4K to the ext2fs 
but that shouldn't be the issue, right?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110824/7aff7e70/attachment.html>
