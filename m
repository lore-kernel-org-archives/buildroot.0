From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 22:40:44 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/ima-evm-utils: fix build on
 musl
In-Reply-To: <20200723200457.3996-1-petr.vorel@gmail.com>
References: <20200723200457.3996-1-petr.vorel@gmail.com>
Message-ID: <20200723224044.3dc2fefe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Jul 2020 22:04:55 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Fixes:
>                    br-arm-cortex-a9-musl [ 7/44]: FAILED
>                 br-i386-pentium-mmx-musl [12/44]: FAILED
>                           br-x86-64-musl [34/44]: FAILED
>                           linaro-aarch64 [36/44]: FAILED
> 
> Fix will be released in future release (after 1.3), but was needed since
> initial release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Why don't we have autobuilder failures ?

If you look at:

  http://autobuild.buildroot.net/index.php?libc=musl&symbols%5BBR2_PACKAGE_IMA_EVM_UTILS%5D=y

you will see that we have plenty of builds that succeed, with
BR2_PACKAGE_IMA_EVM_UTILS=y, with musl toolchains.

Notes:

 - There are failures above, but none of them are due to ima-evm-utils.
   You can also look at
   http://autobuild.buildroot.net/?reason=ima-evm-utils% which shows we
   never had a single build failure caused by this package (it seems).

 - The above URL is slow to load, please give it some time, the SQL
   query is slow!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
