From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 22:01:50 +0100
Subject: [Buildroot] Problem generating rootfs for ci20 defconfig
In-Reply-To: <85dd964f-adc4-5c1b-875f-ef3f827925cc@mind.be> (Arnout
 Vandecappelle's message of "Mon, 20 Jan 2020 22:09:35 +0100")
References: <87muaimcqg.fsf@igalia.com>
 <CAJ4jsafbQ9GBLYd=x95B7QZ=AAd2AdLH-+iuPNnEqhkGfKZ1uw@mail.gmail.com>
 <87lfq2mbiz.fsf@igalia.com>
 <CAJ4jsackLicBx5naQiNu+hCWZ45Jbx8cqRCK9sLaSHrDTE1pNg@mail.gmail.com>
 <85dd964f-adc4-5c1b-875f-ef3f827925cc@mind.be>
Message-ID: <87blqwzfpd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> Perhaps we should drop the size parameter for rootts in
 >> board/*/genimage.cfg and let genimage always use the size of the
 >> filesystem image.

 >  That's the case for most genimage.cfg files anyway. I think the few which do
 > have a specified size are just historical accident.

Indeed. For the use case of wanting extra space to add more files are
runtime to a writable file system, it makes more sense to set
BR2_TARGET_ROOTFS_EXT2_SIZE (or similar) to something like 512MB rather
than hardcoding the rootfs partition size to 512MB.

-- 
Bye, Peter Korsgaard
