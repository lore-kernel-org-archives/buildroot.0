From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Sep 2017 18:35:40 +0200
Subject: [Buildroot] [PATCH 1/2] tbb: new package
References: <20170926203504.22326-1-bradford@density.io>
 <20170926203504.22326-2-bradford@density.io>
 <CAHXCMM+zCdA0wEd+taFp_JOC5bx1k0OR4MOwOTJ5_trEHUsUMA@mail.gmail.com>
 <CAPpUvYjbnmbjUo1Wb-1CR1sHM8YDxS-RW5oCGAcMRdDbYBZ1xg@mail.gmail.com>
Message-ID: <sj0t9exl3e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 27 Sep 2017 11:49:46 -0400 schrieb Bradford Barr:

> I guess I could try to compile TBB for every platform supported by
> buildroot? Is there an easy way to do that?

Hi,

yes:

$ echo "BR2_PACKAGE_TBB=y" > test-tbb
$ utils/test-pkg -c test-tbb -d $HOME/buildroot/test-tbb

Doing so you will see that your package also

	depends on BR2_INSTALL_LIBSTDCPP

because it contains c++ code.

Regards, Bernd
