From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:28:12 +0200
Subject: [Buildroot] [PATCH] micropython: Add upstream patch to fix
 64-bit builds
In-Reply-To: <1442738675-5141-1-git-send-email-judge.packham@gmail.com>
References: <1442738675-5141-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20150920142812.115fa071@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Sun, 20 Sep 2015 20:44:35 +1200, Chris Packham wrote:
> Fixes the following error when building for a 64-bit target
> 
>   ../py/objint_mpz.c:54:5: error: right shift count >= width of type [-Werror]
>        (MP_SSIZE_MAX >> MPZ_DIG_SIZE * 4) & DIG_MASK,
>        ^
>   ../py/objint_mpz.c:54:5: error: initializer element is not constant
>   ../py/objint_mpz.c:54:5: error: (near initialization for 'maxsize_dig[4]')
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> So this is the upstream patch that fixes the build problem and replaces
> http://lists.busybox.net/pipermail/buildroot/2015-September/139826.html

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
