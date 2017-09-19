From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Sep 2017 12:51:01 +0300
Subject: [Buildroot] BUILDROOT : Iconv issue
In-Reply-To: <B0E42342CF573846B53369E0E3AD66A8E7C07864C1@THSONEA01CMS12P.one.grp>
References: <B0E42342CF573846B53369E0E3AD66A8E7C07864C1@THSONEA01CMS12P.one.grp>
Message-ID: <20170919095101.iz4sa7kkkdfbhzig@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi MAVINDI Dimitri,

On Tue, Sep 19, 2017 at 11:42:01AM +0200, MAVINDI Dimitri wrote:
> I would like to make libiconv part of our buildroot.
> How to make sure that this package part of the result knowing that I have 
> setup BR2_ENABLE_LOCALE =y .

The package/libiconv/libiconv.mk file contains this comment:

  # Configurations where the toolchain supports locales and the libiconv
  # package is enabled are incorrect, because the toolchain already
  # provides libiconv functionality, and having both confuses packages.

What do you need libiconv for?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
