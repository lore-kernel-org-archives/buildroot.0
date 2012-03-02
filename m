From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Mar 2012 22:41:55 +0000
Subject: [Buildroot] adding a new machine configuration
In-Reply-To: <4F50F97E.3070203@gmail.com>
References: <4F4F74A4.2060909@gmail.com> <20120301143934.073f50a0@skate>
 <4F50F97E.3070203@gmail.com>
Message-ID: <201203022241.55940.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 02 March 2012 16:46:54 Roland wrote:
> Which is better version...   I'm specifically interested in the IF 
> section where BR2_TARGET_ROOTFS_UBI_ALIGNMENT_DEFINED is used.

 Option 3 :-)

 Remove the vol_alignment=1 from ubinize.cfg, and do the 
'echo vol_alignment=...' unconditionally.  Make sure that in Config.in,
the BR2_TARGET_ROOTFS_UBI_ALIGNMENT defaults to 1 and you get exactly
the same behaviour by default.

 By the way, when you send your patches, please use git send-email
(see the man page for how to set it up with GMail).  GMail destroys
the formatting of the patch, so it won't apply.  And we prefer not
to get them as attachments because that makes them difficult to review.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
