From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2011 10:52:33 +0100
Subject: [Buildroot] QT support for Buildroot RFS.
In-Reply-To: <1F383CDA589639468828C7E2B75EDE9D0602B149@POCITMSEXMB02.LntUniverse.com>
References: <1F383CDA589639468828C7E2B75EDE9D06029498@POCITMSEXMB02.LntUniverse.com>
 <1F383CDA589639468828C7E2B75EDE9D0602B149@POCITMSEXMB02.LntUniverse.com>
Message-ID: <20111107105233.5ab808b1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 7 Nov 2011 08:16:52 +0000,
Mahanteshwari Hiremath <Mahanteshwari.Hiremath@lnties.com> a ?crit :

>           I am trying to buid buildroot RFS with QT supprt.
> I have enabled C++ support in toolchain and Qt support in package
> selection --> Graphic libraries --> Qt. after 'make'  I can see qmake
> getting installed in staging/usr/bin.
> 
> What are the necessary changes(settings) i have to do inorder to get
> qmake installed in target/bin and libraries in target/lib(nothing but
> RFS).

qmake is installed in output/host/usr/bin, not inside the staging
directory.

We only support cross-compilation of Qt application: qmake is not
installed on the target. Just use the qmake in output/host/usr/bin to
cross-compile your Qt application from your host machine.

The Qt libraries are already installed in output/target/usr/lib if you
have enabled Qt in the configuration.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
