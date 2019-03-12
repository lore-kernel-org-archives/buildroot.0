From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 07:06:32 +0100
Subject: [Buildroot] [PATCH 1/4] toolchain: set the ssp gcc option in
 kconfig
In-Reply-To: <309c4824-97d8-e946-79b2-7e4c722ed601@mind.be>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_92_1_1b5ea6bb-0d36-4857-888c-c65dd93bff8b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <309c4824-97d8-e946-79b2-7e4c722ed601@mind.be>
Message-ID: <27512_1552370795_5C874C6B_27512_48_1_20190312060632.GA4924@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 01:02 +0100, Arnout Vandecappelle spake thusly:
> On 11/03/2019 07:48, yann.morin at orange.com wrote:
> [snip]
[--SNIP--]
> > +ifneq ($(BR2_SSP_OPTION),)
> > +TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_OPTION='$(BR2_SSP_OPTION)'
> >  endif
>  I'd really like to use the BR_ADDITIONAL_CFLAGS instead, by changing the
> definition in the .mk file to something like:
> 
> TOOLCHAIN_WRAPPER_OPTS = \
>         $(call qstrip,$(BR2_TARGET_OPTIMIZATION)) \
> 	$(call qstrip,$(BR2_SSP_OPTION))
> 
> TOOLCHAIN_WRAPPER_ARGS += \
>  	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TOOLCHAIN_WRAPPER_OPTS),"$(f)"$(comma))'

OK, will do.

> (note that I preferred the qstrip instead of the ifdef here, and adding quotes
> explicitly in the foreach, but you may want to implement it differently).

Yeah, I tried to avoid the qstriop-then-strip-anyway dance, but it is
indeed nicer the way you wrote it.

Thanks!

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
