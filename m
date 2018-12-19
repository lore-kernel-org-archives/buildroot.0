From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 19 Dec 2018 15:24:48 -0800
Subject: [Buildroot] [PATCH v2 2/4] skeleton: use
 BR2_SYSTEM_DEFAULT_PATH as default PATH
In-Reply-To: <20181219213430.GP24194@scaer>
References: <20181219210455.14754-1-mmayer@broadcom.com>
 <20181219210455.14754-3-mmayer@broadcom.com>
 <20181219213430.GP24194@scaer>
Message-ID: <CAGt4E5uL_ygcie-O8A9CBHy4sG5JSaPYMc4L210WBdiiMv94BQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, 19 Dec 2018 at 13:34, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> > diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> > index e8a052205268..866273bbd7ee 100644
> > --- a/package/skeleton-init-common/skeleton-init-common.mk
> > +++ b/package/skeleton-init-common/skeleton-init-common.mk
> > @@ -22,6 +22,7 @@ define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
> >       $(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
> >       $(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> >               $(TARGET_DIR_WARNING_FILE)
> > +     $(SED) 's, at PATH@,$(BR2_SYSTEM_DEFAULT_PATH),' $(TARGET_DIR)/etc/profile
>
> I think we should keep the warning file the last command executed.

I am not sure I am following. I am not doing anything to target-dir-warning.txt.

> Otherwise:
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.

Thanks,
-Markus
