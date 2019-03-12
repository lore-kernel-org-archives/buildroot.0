From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 10:11:46 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain: check the SSP option is known
In-Reply-To: <7df764e1-1b90-2026-238f-d493c027c389@mind.be>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_93_1_836f3203-3172-44de-a772-1825aafd915d@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <f8725159-1dae-da34-de01-dbf681de2169@mind.be>
 <20190312061810.GB4924@r-lnx-nyma7486-2>
 <29010_1552372901_5C8754A5_29010_303_1_20190312064139.GD4924@r-lnx-nyma7486-2>
 <7df764e1-1b90-2026-238f-d493c027c389@mind.be>
Message-ID: <3484_1552381908_5C8777D4_3484_482_1_20190312091146.GE4924@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 09:49 +0100, Arnout Vandecappelle spake thusly:
> On 12/03/2019 07:41, yann.morin at orange.com wrote:
> > Arnout, All,
> > 
> > On 2019-03-12 07:18 +0100, MORIN Yann TGI/OLS spake thusly:
> >> On 2019-03-12 01:25 +0100, Arnout Vandecappelle spake thusly:
> > [--SNIP--]
> >>>  I notice that in vlc.mk, we have
> >>> ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> >> I'll check what vlc really wants it for (e.g. strong, all, regular?),
> >> fix and send a patch.
> > 
> > So, vlc already depends on gcc >= 4.9 anyway, so there will always have
> > support for fstack-protctor-strong, and this legacy wart can be removed
> > now, I guess.
> 
>  Not at all! gcc >= 4.9 doesn't guarantee SSP availability, only that if SSP is
> available, then -fstack-protector=strong will work. So the check is correct
> because vlc depends on gcc >= 4.9.

Ah, yes, I see now. That's because SSP is a shared feature between the
compiler and the C library, right?

So that check does indeed make sense as it is, even though it is not
really obvious...

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
