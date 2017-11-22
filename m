From: FOURES Philippe <philippe.foures@thalesgroup.com>
Date: Wed, 22 Nov 2017 12:08:35 +0100
Subject: [Buildroot] Package link issue with Buildroot 2017.02
Message-ID: <884FE859A7028649AB59C40AF813419C0A78DE2900@THSONEA01CMS10P.one.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

When I generate roots including specific package, I got followig error during package link

cc LinuxMain.o DriverFuncs.o Config.o ../FtdiAccess.o ../FtdiMilan.o  -lrt -lftdi -lstdc++ -L"/home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib" -o AESCDriver
Ajout du processus fils 0xc28150 (AESCDriver) PID 6073 ? la cha?ne.
Processus fils actif 0xc28150 (AESCDriver) PID 6073
/usr/bin/ld : escamotage incompatible /home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib/libftdi.so lors de la recherche de -lftdi
/usr/bin/ld : ne peut trouver -lftdi
/usr/bin/ld : escamotage incompatible /home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib/libstdc++.so lors de la recherche de -lstdc++
/usr/bin/ld : escamotage incompatible /home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib/libgcc_s.so lors de la recherche de -lgcc_s
collect2: error: ld returned 1 exit status
R?colte du processus fils perdant 0xc28150 PID 6073
makefile:51 : la recette pour la cible ? AESCDriver ? a ?chou?e
make[2]: *** [AESCDriver] Erreur 1
Retrait du processus fils 0xc28150 PID 6073 de la cha?ne.
R?colte du processus fils perdant 0x5c52c20 PID 6072
package/pkg-generic.mk:216 : la recette pour la cible ? /home/largo/BR17LTS/buildroot-2017.02.7/output/build/paylink-4-1-12-6/.stamp_built ? a ?chou?e
make[1]: *** [/home/largo/BR17LTS/buildroot-2017.02.7/output/build/paylink-4-1-12-6/.stamp_built] Erreur 2
Retrait du processus fils 0x5c52c20 PID 6072 de la cha?ne.
R?colte du processus fils perdant 0x20715b0 PID 5855
Makefile:79 : la recette pour la cible ? _all ? a ?chou?e
make: *** [_all] Erreur 2
Retrait du processus fils 0x20715b0 PID 5855 de la cha?ne.



/home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib content is

lrwxrwxrwx 1 largo largo    17 nov.  20 20:50 output/target/usr/lib/libftdi.so -> libftdi.so.1.20.0
lrwxrwxrwx 1 largo largo    17 nov.  20 20:50 output/target/usr/lib/libftdi.so.1 -> libftdi.so.1.20.0
-rwxr-xr-x 1 largo largo 27388 nov.  20 22:29 output/target/usr/lib/libftdi.so.1.20.0

Everything seems to be here


Attached to the mai,l the makefile


Note: this package compilation is working fine with buildroot 2016.02


Thank you for your support


Philippe Four?s

Customer support department

[cid:image001.jpg at 01D3638A.9F8979E0]

Thales Communications & Security
Rue de la Mare aux Joncs - Z.I. des Bordes - BP 57 - 91229 Le-Plessis-P?t? Cedex
tel : +33 (0)1 69 88 59 11 / mob : +33 (0)6 73 27 96 25
email : philippe.foures at thalesgroup.com<mailto:philippe.foures@thalesgroup.com>

[@@ THALES GROUP INTERNAL @@]

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171122/3ab8212a/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.jpg
Type: image/jpeg
Size: 1179 bytes
Desc: image001.jpg
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171122/3ab8212a/attachment.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makefile
Type: application/octet-stream
Size: 1936 bytes
Desc: makefile
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171122/3ab8212a/attachment.obj>
