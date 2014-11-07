From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 7 Nov 2014 10:16:29 -0300
Subject: [Buildroot] [PATCH v2 5/5] package: linux-fusion: use install
 instead of cp
In-Reply-To: <CANxTyt6nKbvrcRFtds8CxBBuEk-Su-LL5hzqOY=-m1BT2a_v+A@mail.gmail.com>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-6-git-send-email-guido@vanguardiasur.com.ar>
 <CANxTyt6nKbvrcRFtds8CxBBuEk-Su-LL5hzqOY=-m1BT2a_v+A@mail.gmail.com>
Message-ID: <20141107131629.GA2620@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi

On Fri, Nov 07, 2014 at 07:44:50AM -0500, Danomi Manchego wrote:
> Guido
> 
> On Thu, Nov 6, 2014 at 10:50 PM, Guido Mart?nez
> <guido@vanguardiasur.com.ar> wrote:
> > in order to not depend on the previous permissions of the file
> >
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > ---
> >  package/linux-fusion/linux-fusion.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
> > index c5e7976..81ecd8a 100644
> > --- a/package/linux-fusion/linux-fusion.mk
> > +++ b/package/linux-fusion/linux-fusion.mk
> > @@ -37,7 +37,7 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
> >                 INSTALL_MOD_PATH=$(TARGET_DIR) \
> >                 -C $(@D) install
> >         mkdir -p $(LINUX_FUSION_ETC_DIR)
> > -       cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
> > +       install -m 644 package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
> 
> 
> How about also dropping the mkdir and doing:
> 
>        install -D -m 644 package/linux-fusion/40-fusion.rules
> $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
Ah yes, that's better. Will do for v3.

Thanks!

> 
> Danomi -
> 
> 
> >  endef
> >
> >  $(eval $(generic-package))
> > --
> > 2.1.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
