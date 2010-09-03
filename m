From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 3 Sep 2010 15:56:57 +1000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <29591683.post@talk.nabble.com>
References: <29591683.post@talk.nabble.com>
Message-ID: <AANLkTinkKu2UKogqR2fRE7Mk-ojEFkXy2MPqPHhW_jZC@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 1, 2010 at 7:35 PM, JNY <jny0@hotmail.com> wrote:
>
> (which is a flash
> drive, and the only storage device on the system)

Out of curiosity, a USB flash device, or CF, or NAND flash, or ?

> or should I just do so mounted?

If you have to do it when the FS is mounted, you may want to remount
it as read-write before you do the fsck:

  mount -o remount,ro /

Then after the fsck, reboot.

> I don't have a file called rootfs.ext2.  I have the following files:
> rootfs.i486.tar
> rootfs.i486.tar.bz2

Which of these files are you transferring to the flash device, and how?

Mitch.
