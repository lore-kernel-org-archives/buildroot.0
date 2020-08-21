From: Christian Stewart <christian@paral.in>
Date: Fri, 21 Aug 2020 14:31:34 -0700
Subject: [Buildroot] [PATCH 1/2] package/python-rpi-gpio: fix gcc-10
 compatibility patch
In-Reply-To: <194d16369082b685f29eec6974e967ee4b5009a8.1598027701.git.yann.morin.1998@free.fr>
References: <cover.1598027701.git.yann.morin.1998@free.fr>
 <194d16369082b685f29eec6974e967ee4b5009a8.1598027701.git.yann.morin.1998@free.fr>
Message-ID: <CA+h8R2pfx-_K_W7jDTBPWaSqh0cDrP=vnfPf6xHC1BwM5sL1sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for the fix.

On Fri, Aug 21, 2020 at 9:35 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Although the patch makes the package build OK, it fails at runtime
> when the module is imported, because of missing symbols:
>
>     ImportError: /usr/lib/python3.8/site-packages/RPi/_GPIO.cpython-38-aarch64-linux-gnu.so: undefined symbol: high
>
> Fix that by making sure the symbols are declared once, but only once.
>
> Fixes: #13166
>
> Reported-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Tested-by: Christian Stewart <christian@paral.in>

Best,
Christian
