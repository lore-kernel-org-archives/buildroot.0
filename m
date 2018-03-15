From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Mar 2018 06:56:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-13
In-Reply-To: <20180314070012.E531320731@mail.bootlin.com>
References: <20180314070012.E531320731@mail.bootlin.com>
Message-ID: <20180315045607.sm3dalj4mopi2c3s@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Wed, Mar 14, 2018 at 08:00:12AM +0100, Thomas Petazzoni wrote:
>     mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/31dca90f7cdd0c54f4a9263c21ab72a97de701fc | ORPH
>        nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/fc225cf1797453cb4b9c6ac0781ac58b1f5e5c6b | ORPH
>     mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/ac66577bf0347b7d6a8cea96f889d8ff865372d4 | ORPH
>       xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c9f51546e1af21191d734585e06519e54313dc46 | ORPH
>          arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/00bba3ba2863b6ddb1bd5cab8b82d6293ae838de | ORPH
>        nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/52881052fd2407f3de2d8f84eba792e07cd076e0 | ORPH

make[3]: *** No rule to make target '-lunistring', needed by 'xfs_scrub'.  Stop.

VPATH is empty. Adding VPATH=$(STAGING_DIR) to MAKE_OPTS does not help though. 
Interestingly, this error does not trigger for -lrt from the same link 
command. Maybe because the host librt satisfies the dependency. Removing the 
$(LIBUNISTRING) dependency in scrub/Makefile "fixes" this failure. Link still 
fails on the BR2_STATIC_LIBS case, because there is no static libunistring.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
