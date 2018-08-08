From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Aug 2018 16:26:29 +0200
Subject: [Buildroot] [PATCH] cryptsetup: fix build with old host kernel
 headers
In-Reply-To: <0e566b4ae187c5bff93ce09cd73132ace0545664.1533639888.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 7 Aug 2018 14:04:48 +0300")
References: <0e566b4ae187c5bff93ce09cd73132ace0545664.1533639888.git.baruch@tkos.co.il>
Message-ID: <877el1gciy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > By default cryptsetup configure fails when the if_alg.h kernel header is
 > not available. Kernels older than 2.6.38, like the one in RHEL 6 hosts,
 > do not provide this header. Since we don't need the kernel crypto
 > feature for host tools, just disable this feature to allow successful
 > completion of the configure script.

 > While at it, fix a typo in the --with-crypto_backend option (hyphen ->
 > underscore).

 > Should fix:
 > http://autobuild.buildroot.net/results/ffd/ffda2579b215b53161025b7bc703091cb30ef95d/
 > http://autobuild.buildroot.net/results/c48/c48015f76b13fec38f650f66824e7b986eb28572/
 > http://autobuild.buildroot.net/results/be6/be621f71bf9da8719bf7fc943eccc9b4dc2cc43e/

 > Cc: Martin Hicks <mort@bork.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
