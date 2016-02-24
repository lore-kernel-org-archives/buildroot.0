From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 21:51:51 +0100
Subject: [Buildroot] [PATCH 6/9] olimex_a20_olinuxino_micro: update to
	use genimage
In-Reply-To: <1456187073-2876-7-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 23 Feb 2016 01:24:30 +0100")
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
 <1456187073-2876-7-git-send-email-luca@lucaceresoli.net>
Message-ID: <87fuwh25nc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 >  board/olimex/a20_olinuxino/genimage.cfg      | 16 ++++++++++++++++
 >  board/olimex/a20_olinuxino/post-image.sh     | 16 ++++++++++++++++
 >  board/olimex/a20_olinuxino/readme.txt        | 17 +++++++++++++++--
 >  configs/olimex_a20_olinuxino_micro_defconfig |  2 ++
 >  4 files changed, 49 insertions(+), 2 deletions(-)
 >  create mode 100644 board/olimex/a20_olinuxino/genimage.cfg
 >  create mode 100755 board/olimex/a20_olinuxino/post-image.sh

 > diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
 > new file mode 100644
 > index 000000000000..8ea24ccab8f3
 > --- /dev/null
 > +++ b/board/olimex/a20_olinuxino/genimage.cfg
 > @@ -0,0 +1,16 @@
 > +image sdcard.img {
 > +	hdimage {
 > +	}
 > +
 > +	partition u-boot {
 > +		in-partition-table = "no"
 > +		image = "u-boot-sunxi-with-spl.bin"
 > +		offset = 8192
 > +	}
 > +
 > +	partition rootfs {
 > +		partition-type = 0x83
 > +		image = "rootfs.ext4"
 > +		size = 512M
 > +	}
 > +}

What about the dtb file? The other Allwinner based boards store this in
a first vfat partition.

-- 
Bye, Peter Korsgaard
