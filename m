From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:27:02 +0200
Subject: [Buildroot] [git commit] board/technologic/ts7680: fix bogus
 size in genimage.cfg
In-Reply-To: <20180812142424.66B348C589@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Aug 2018 16:29:15 +0200")
References: <20180812142424.66B348C589@busybox.osuosl.org>
Message-ID: <87k1ogkw4p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f1bdb63ff4fddc53cdb43ad670dbf6f3401c19ca
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > 512B is not a correct size to express "512 bytes", and causes a
 > genimage failure:

 >   ERROR: Invalid size suffix 'B' in '512B'

 > To express "512 bytes", using just "512" is sufficient. With this
 > commit, genimage works fine, and we indeed have a 512 bytes unused
 > partition:

 > $ fdisk -l output/images/sdcard.img
 > Disk output/images/sdcard.img: 60 MiB, 62915584 bytes, 122882 sectors
 > Units: sectors of 1 * 512 = 512 bytes
 > Sector size (logical/physical): 512 bytes / 512 bytes
 > I/O size (minimum/optimal): 512 bytes / 512 bytes
 > Disklabel type: dos
 > Disk identifier: 0x00000000

 > Device                    Boot Start    End Sectors  Size Id Type
 > output/images/sdcard.img1          1      1       1  512B  0 Empty
 > output/images/sdcard.img2          2 524289  524288  256M 83 Linux

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/88314963

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
