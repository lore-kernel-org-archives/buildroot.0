From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 14 Dec 2009 18:49:35 +0800
Subject: [Buildroot] [PATCH] mtd-utils: bump version number
In-Reply-To: <87ljh5sx5r.fsf@macbook.be.48ers.dk>
References: <1260575109-7459-1-git-send-email-daniel@caiaq.de>
	<1260575725-7764-1-git-send-email-daniel@caiaq.de>
	<87ljh5sx5r.fsf@macbook.be.48ers.dk>
Message-ID: <20091214104935.GA28375@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 14, 2009 at 10:49:20AM +0100, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
>  Daniel> The upstream git commit used by mtd.mk is not valid anymore,
>  Daniel> for unclear reasons. Use the current HEAD as new anchor.
> 
> Hmm, it works here:
> 
> wget --passive-ftp -nd   -O /var/lib/downloads/mtd-utils-fcb52ccc99679460640386c297023f852b108f68.tar.gz "http://git.infradead.org/mtd-utils.git?a=snapshot;h=fcb52ccc99679460640386c297023f852b108f68;sf=tgz"
> --2009-12-14 10:35:29--  http://git.infradead.org/mtd-utils.git?a=snapshot;h=fcb52ccc99679460640386c297023f852b108f68;sf=tgz
> Resolving git.infradead.org... 18.85.46.34, 2001:4830:2446:ff00:214:51ff:fe65:c65c
> 
> ls -lah mtd-utils-fcb52ccc99679460640386c297023f852b108f68.tar.gz
> -rw-r--r-- 1 peko peko 323K 2009-12-14 10:35 mtd-utils-fcb52ccc99679460640386c297023f852b108f68.tar.gz

Ok, the master branch moved forward and I recognized that too late,
hence the two patches.

> But the directory name has indeed changed.
> 
>  Daniel>  #############################################################
>  Daniel> -MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
>  Daniel> +MTD_VERSION:=a4e502d99129da8ebba6d40b373a4422a175e9af
>  Daniel>  MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
>  Daniel>  MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
>  Daniel>  MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd-utils-$(MTD_VERSION)
>  Daniel>  MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
>  Daniel>  MTD_CAT:=$(ZCAT)
>  Daniel> -MTD_NAME:=mtd-utils
>  Daniel> +MTD_NAME:=mtd-utils-a4e502d
> 
> It would be nice if the shortname could be computed from MTD_VERSION so
> things don't break when someone goes and changes the git id. GNU make
> unfortunately doesn't have a substring function, so the easiest solution
> is probably cut, E.G.:

I though about that too, but I wasn't sure whether the substring of the
SHA1 ID would always be 7 characters long. I fear that is choses to be
as short as possible but as long as necessary to be unique. Which would
then mean that it changes again at an aribitrary point.

Best thing woulod be if the mtd people would just tag a commit with a
new release number. I'll write them and see if I can make them do that
:)

Daniel
