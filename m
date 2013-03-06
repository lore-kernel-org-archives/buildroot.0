From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 21:06:00 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362599417.20183.159.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
Message-ID: <20130306210600.1840511f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Wed, 06 Mar 2013 11:50:17 -0800, John Stile wrote:

> I think I have addressed the problem with the make file, but it still
> silently does not build.  I am attaching a complete patch.

Are you sure you didn't forget to enable the package in menuconfig?
I've applied your patch as is, enabled the dhcpcd package in
menuconfig, and it starts building (sorry for the messages in French
below):

>>> dhcpcd 5.6.7 Downloading
--2013-03-06 20:59:38--  http://roy.marples.name/downloads/dhcpcd//dhcpcd-5.6.7.tar.bz2
R?solution de roy.marples.name (roy.marples.name)... 77.75.106.61, 2a01:348:31:2:209:5bff:fe84:887d
Connexion vers roy.marples.name (roy.marples.name)|77.75.106.61|:80... connect?.
requ?te HTTP transmise, en attente de la r?ponse... 200 OK
Longueur: 85983 (84K) [application/octet-stream]
Sauvegarde en : ?/opt/dl/dhcpcd-5.6.7.tar.bz2.tmp?

100%[========================================================================================================================================================>] 85 983      98,1K/s   ds 0,9s    

2013-03-06 20:59:39 (98,1 KB/s) - ?/opt/dl/dhcpcd-5.6.7.tar.bz2.tmp? sauvegard? [85983/85983]

>>> dhcpcd 5.6.7 Extracting
bzcat /opt/dl/dhcpcd-5.6.7.tar.bz2 | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/dhcpcd-5.6.7  -xf -
>>> dhcpcd 5.6.7 Patching package//dhcpcd
>>> dhcpcd 5.6.7 Configuring
>>> dhcpcd 5.6.7 Building
/usr/bin/make -j8 -C /home/thomas/projets/buildroot/output/build/dhcpcd-5.6.7 all
make[1]: entrant dans le r?pertoire ? /home/thomas/projets/buildroot/output/build/dhcpcd-5.6.7 ?
Makefile:11: config.mk: Aucun fichier ou dossier de ce type
make[1]: *** Pas de r?gle pour fabriquer la cible ? config.mk ?. Arr?t.
make[1]: quittant le r?pertoire ? /home/thomas/projets/buildroot/output/build/dhcpcd-5.6.7 ?
make: *** [/home/thomas/projets/buildroot/output/build/dhcpcd-5.6.7/.stamp_built] Erreur 2

So the build starts, but fails. However, the configure step is not
done, because you use DHCPD_CONFIGURE_CMDS and not
DHCPCD_CONFIGURE_CMDS (maybe it was wrong in the e-mail I sent to you,
but basically, all variables have to start with the package name, in
upper-case letters).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
