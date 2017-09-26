From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Sep 2017 18:56:57 +0200
Subject: [Buildroot] [PATCH] openntpd: fix build with musl
References: <cd1a6a1cfa3a72fab2856192ffb16dee2dc9acc5.1506429455.git.baruch@tkos.co.il>
Message-ID: <pfdq9ex9k8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 26 Sep 2017 15:37:35 +0300 schrieb Baruch Siach:

> The recent version bump added a local sys/cdefs.h header that overrides
> the internal libc provided one. But since musl does not use this header,
> the __dead definition in this file is missing. Add a patch that moves
> the __dead definition to sys/types.h.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ build-tested using http://autobuild.buildroot.net/
results/2b1/2b14b7012b93f0f2bfaf9e61435dd8826217d481/ ]
