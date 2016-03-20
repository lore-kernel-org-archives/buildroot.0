From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:38:23 +0100
Subject: [Buildroot] [PATCH V2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <CAGduivzd_HebHnm54y4wbvZGvTZL6Nhwz_q4ufFT74Uf=HAPwg@mail.gmail.com>
References: <1457312709-6191-1-git-send-email-cyrilbur@gmail.com>
 <CAGduivzd_HebHnm54y4wbvZGvTZL6Nhwz_q4ufFT74Uf=HAPwg@mail.gmail.com>
Message-ID: <20160320233823.06fa0c78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Mar 2016 21:28:05 +0100, Maxime Hadjinlian wrote:

> >         ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
> > -               $(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> > +               $(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
> > +       if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
> > +       then \
> > +               $(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
> > +       fi
> >  endef
> >  endif
> >
> > --
> > 2.7.2
> >
> 
> I don't think it's a problem for getty, but still worth noting
> somewhere, this will replace '115200' (without the quotes) by say
> "9600" (with the quotes) because the quotes are present in
> system/Config.in (maybe they could be removed ? There's no type for
> that sort of things in Kconfig as far as I know (which is not much) ?

I'm not sure to understand what you meant. Did you mean that he should
be calling qstrip on the variable?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
