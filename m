From: yann.morin at orange.com <yann.morin@orange.com>
Date: Thu, 2 May 2019 10:01:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/mfgtools: bump to version 1.2.91
In-Reply-To: <4bf9c494-f6dc-e1a8-abad-3d87cbf1e051@mind.be>
References: <20190430201121.15634-1-joerg.krause@embedded.rocks>
 <20190430201121.15634-2-joerg.krause@embedded.rocks>
 <880fdc14-d19f-020b-9735-9e0077e6be76@mind.be>
 <7552b9cbd58edcd667f52531ed75e3fe57cd705c.camel@embedded.rocks>
 <4bf9c494-f6dc-e1a8-abad-3d87cbf1e051@mind.be>
Message-ID: <15946_1556784081_5CCAA3D1_15946_377_1_20190502080119.GA3431@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-05-02 09:52 +0200, Arnout Vandecappelle spake thusly:
> On 02/05/2019 08:51, J?rg Krause wrote:
> >>> The
> >>> problem is, that git provides the version information of Buildroot.
> >>  Is it that much of a problem if the Buildroot version is used?
> > mfgtools saves the version string in generated runtime scripts. So this
> > is a problem.
> 
>  Yes, I understand that. But the effect is that `uuu --version` will print
> 2019.02 instead of 1.2.91, right? So my question is: is it that much of a
> problem that this happens?
> 
>  I'm asking because I'm sure there are other packages that have that behaviour.
> Are we going to try to find and fix all of them? Or just live with the fact that
> some packages report the wrong version?

I think the real issue is that, for out-of-tree builds, there might be
no git tree available, and thus those packages would FTBFS. This means
we would eventually cactch such packages.

Furthermore, it would be pretty surprising for unsuspecting users to end
up with Buildroot's version instead of that package's version.

As such, your proposal to replace the version script is good idea.

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
