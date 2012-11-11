From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:12:52 +0100
Subject: [Buildroot] [PATCH] group file: define groups expected by udev
In-Reply-To: <1352603315-1731-1-git-send-email-danomimanchego123@gmail.com>
References: <1352603315-1731-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <50A022E4.20604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/12 04:08, Danomi Manchego wrote:
> udev-182 requires several groups to be resolvable at udev startup,
> including disk, cdrom, floppy, tape, audio, video, lp, tty, dialout,
> and kmem.  Only some of these are in the default skeleton's group
> file, So let's add the missing groups, and plugdev too.
>
> This avoids getting these logs in /var/logs/messages:
>
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'dialout' unknown
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'kmem' unknown
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'video' unknown
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'lp' unknown
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'floppy' unknown
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'cdrom' unknown
> Jan  1 00:00:08 buildroot daemon.err udevd[37]: specified group 'tape' unknown
>
> Signed-off-by: Danomi Manchego<danomimanchego123@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Not tested or anything, but I agree with the principle and the patch looks
good.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
