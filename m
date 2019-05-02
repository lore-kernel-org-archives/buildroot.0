From: yann.morin at orange.com <yann.morin@orange.com>
Date: Thu, 2 May 2019 12:21:03 +0200
Subject: [Buildroot] make source not working for host-ldd crosstool-ng
In-Reply-To: <cdf1cac9-9fb4-06ee-1d3f-44907d67dc51@ginzinger.com>
References: <cdf1cac9-9fb4-06ee-1d3f-44907d67dc51@ginzinger.com>
Message-ID: <3116_1556792466_5CCAC492_3116_470_1_20190502102103.GB3431@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2019-05-02 11:50 +0200, Martin Kepplinger spake thusly:
> There seems to be a bug in the host-ldd crosstool-ng package. It
> unconditionally tries to download "gpl.txt", even after running make
> source. It should check if it's already available. See the error below,
> when running "make" disconnected.
> 
> Who's responsible here?

Probably you, because there is no such package in the official Buildroot
tree, so either you patched it yourself (and hence are responsible), or
it is in your br2-external tree (hence you are responsible), or you are
using a fork of Buildroot (hence you should talk to the ones you got
your fork from).

Regards,
Yann E. MORIN.

> thanks
> 
>                                  martin
> 
> 
> $ make
> >>> host-ldd crosstool-ng-1.23.0 Extracting
> 
> cp /home/gelin/gelin_build/buildroot-2019.02.1/dl/ldd/xldd.in
> /home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/
> chmod a+rx
> /home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/xldd.in
> wget -O
> /home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/gpl.txt
> https://raw.githubusercontent.com/crosstool-ng/crosstool-ng/crosstool-ng-1.23.0/licenses.d/gpl.txt
> --2019-05-02 11:39:05--
> https://raw.githubusercontent.com/crosstool-ng/crosstool-ng/crosstool-ng-1.23.0/licenses.d/gpl.txt
> Resolving raw.githubusercontent.com (raw.githubusercontent.com)...
> failed: Temporary failure in name resolution.
> wget: unable to resolve host address 'raw.githubusercontent.com'
> 
> package/pkg-generic.mk:168: recipe for target
> '/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/.stamp_extracted'
> failed
> make: ***
> [/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/.stamp_extracted]
> Error 4
> 



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


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
