From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Nov 2020 19:09:07 +0200
Subject: [Buildroot] [PATCH] package/openntpd: needs host-bison
In-Reply-To: <87a6vh5l6m.fsf@dell.be.48ers.dk>
References: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
 <87a6vh5l6m.fsf@dell.be.48ers.dk>
Message-ID: <878sb1qle4.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

+Yann.

On Mon, Nov 16 2020, Peter Korsgaard wrote:
>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>
>  > Build fails when no yacc alternative is installed.
>  > Fixes:
>  > http://autobuild.buildroot.net/results/1ba8e339cbb5646663d0bf4e158d89e54433b242/
>  > http://autobuild.buildroot.net/results/a00a53d6635c64e72c50d4841658155de5380110/
>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/openntpd/openntpd.mk | 1 +
>  >  1 file changed, 1 insertion(+)
>
>  > diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
>  > index f2eaee7efd46..9076f3ddda4e 100644
>  > --- a/package/openntpd/openntpd.mk
>  > +++ b/package/openntpd/openntpd.mk
>  > @@ -8,6 +8,7 @@ OPENNTPD_VERSION = 6.2p3
>  >  OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
>  >  OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
>  >  OPENNTPD_LICENSE_FILES = COPYING
>  > +OPENNTPD_DEPENDENCIES = host-bison
>
> Can we not use $(BR2_BISON_HOST_DEPENDENCY) instead?

We surly can. But for some reason no other package under package/ uses
BR2_BISON_HOST_DEPENDENCY. Plain host-bison is used there instead. Only
Barebox, U-Boot and the kernel use it. Why is that?

Commit b01100cc901a83 ("linux: kconfig may need host-{flex, bison} to
build the configurators") mentions kconfig. Is that related?

I guess that BR2_BISON_HOST_DEPENDENCY is more susceptible to
incompatibility due to different host installed bison versions (and same
for flex).

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
