From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Tue, 4 Dec 2012 18:19:48 +0100
Subject: [Buildroot] Qt library difference between E.so and just .so
In-Reply-To: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
References: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
Message-ID: <20121204181948.60bfbd4e@eb-e6520>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Santhosh,

Le Sat, 1 Dec 2012 16:27:54 -0600,
Santhosh Ramani <srcoolz@gmail.com> a ?crit :
> I'm using buildroot 2012.08 to create rootfs for AM335x device and would
> like to compile in Qt libraries. I went through make menuconfig and I get
> libraries for Qt 4.8.2. However, when I try and run some of the same
> examples from the TI SDK it complains that it can't find *libQtGuiE.so.4.7.2
> *.
> 
TI'SDK is generated using Yocto/OpenEmbedded which allows the creation
of both Qt Embedded _and_ Qt for Xorg librairies. In order to make
the difference between both libraries which may both be integrated in
the same SDK, the Qt Embedded libraries have the 'E' suffix and the
SDK provides the right config files to make qmake happy.
So if you generate a rootfs using buildroot, you need to compile the
examples with buildroot's toolchain to have a consistent library naming.

Best regards,
Eric
