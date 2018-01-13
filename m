From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jan 2018 00:11:58 +0100
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
Message-ID: <uagqiexfnk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 14 Jan 2018 00:26:51 +0200 schrieb Stefan Fr?berg:

> Unbound: validating, recursive & caching DNS resolver with
> DNSSEC, QNAME minimisation, DNSCrypt and DNS-over-TLS support.
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Hi,

when testing your package with this defconfig stored in ./test-unbound

$ cat ./test-unbound 
BR2_PACKAGE_UNBOUND=y
BR2_PACKAGE_UNBOUND_DNSCRYPT=y

$ utils/test-pkg -c test-unbound $HOME/test-unbound

it fails on some platforms:

                   br-arm-cortex-m4-full [ 8/47]: FAILED
                      br-arm-full-static [11/47]: FAILED
                            br-bfin-full [12/47]: FAILED
                       br-m68k-5208-full [15/47]: FAILED

I stopped the test at this point, maybe you can have a look at the 
failures? I did not do that at this time (CET) of day ;)

Regards, Bernd
