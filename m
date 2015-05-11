From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 May 2015 17:07:31 +0200
Subject: [Buildroot] [PATCH] package/gcc: backport PR56780 patches
In-Reply-To: <1431284486-4996-1-git-send-email-romain.naour@openwide.fr>
References: <1431284486-4996-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150511170731.003c9663@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 10 May 2015 21:01:26 +0200, Romain Naour wrote:
> --disable-install-libiberty configure option is broken
> in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.
> 
> This library broke the host-gdb build due to a fpic/fPIC issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/28f/28f3074e99a35f4321dad2fa6c5abdad14d2d2c6/
> 
> And many more.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/gcc/4.8.4/851-PR-other-56780.patch | 244 +++++++++++++++++++++++++++++
>  1 file changed, 244 insertions(+)
>  create mode 100644 package/gcc/4.8.4/851-PR-other-56780.patch

We also need this on other gcc versions:
http://autobuild.buildroot.org/results/408/4089d707339291073f48187466817dd17198a3b2/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
