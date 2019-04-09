From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 9 Apr 2019 12:31:51 +0200
Subject: [Buildroot] systemd 241 build after second start make
In-Reply-To: <CAOqJNTfVnFqzvX01aQPgFTJTtodJVLyUQRV3KOi11G31AsuZ7Q@mail.gmail.com>
References: <CAOqJNTfVnFqzvX01aQPgFTJTtodJVLyUQRV3KOi11G31AsuZ7Q@mail.gmail.com>
Message-ID: <7001_1554805914_5CAC749A_7001_280_1_20190409103151.GA2496@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serhii, All,

On 2019-04-09 11:02 +0300, Serhii Sakhno spake thusly:
> hile first build< i got error:
> 
> In file included from ../src/core/dbus-manager.c:10:0:
> ../src/basic/build.h:4:10: fatal error: version.h: No such file or directory
>  #include "version.h"
>           ^~~~~~~~~~~

I think you'll need to backport this upstream commit:
    https://github.com/systemd/systemd/commit/60722ad778d005790231038eecc4ba3034c1a0fc#diff-a1eb3fcba76cd79cb88135af249fc98d

Please send a patch to Buildroot to that effect.

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
