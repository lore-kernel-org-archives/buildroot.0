From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:21:41 +0200
Subject: [Buildroot] User question UTF-8
In-Reply-To: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
References: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
Message-ID: <20150915232141.306098f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Calfee,

On Tue, 15 Sep 2015 10:11:56 -0700, Steve Calfee wrote:

> I am trying to port a python application to buildroot/busybox. It
> needs to read disk files from removable drives. The filenames may
> contain utf-8 chars.

Are you actually sure they are UTF-8 encoded? I don't think characters
in FAT16/32 filesystems are typically encoded as UTF-8, but rather some
weird Windows-specific code page encoding.

According to
https://msdn.microsoft.com/en-us/library/windows/desktop/dd317748(v=vs.85).aspx:

"""
NTFS stores file names in Unicode. In contrast, the older FAT12, FAT16,
and FAT32 file systems use the OEM character set. For more information,
see Code Pages.
"""

> Currently ls from busybox prints ? for the utf-8 non-ascii chars. Both
> from console on minicom and from ssh (which should handle utf-8).

Can you instead try if a UTF-8 encoded text file prints correctly? If
it does, then the problem is really more of a filesystem character
encoding issue than a problem in the UTF-8 support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
