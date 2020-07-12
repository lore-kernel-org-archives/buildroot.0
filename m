From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 16:10:29 +0200
Subject: [Buildroot] [PATCH v3] package/bitwise: new package
In-Reply-To: <20200706093743.2176995-1-rfried.dev@gmail.com>
References: <20200706093743.2176995-1-rfried.dev@gmail.com>
Message-ID: <20200712161029.34a9d83b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shalom Ramon,

On Mon,  6 Jul 2020 12:37:43 +0300
Ramon Fried <rfried.dev@gmail.com> wrote:

> Bitwise is multi base interactive calculator supporting dynamic
> base conversion and bit manipulation.
> It's a handy tool for low level hackers,
> kernel developers and device drivers developers.
> 
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>

I was not totally sure of the value of this for the target system, this
is not normally where you would need a tool like this. But OK, that's a
simple package, so why not. I've applied after doing some changes, see
below.

> diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
> new file mode 100644
> index 0000000000..b31b640ecd
> --- /dev/null
> +++ b/package/bitwise/bitwise.hash
> @@ -0,0 +1,2 @@

We normally put a comment that says where the hash comes from. When it
was simply calculated locally, we add:

# Locally calculated

so I just did this.

> +sha256  33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
> new file mode 100644
> index 0000000000..2ef183c1a0
> --- /dev/null
> +++ b/package/bitwise/bitwise.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# bitwise
> +#
> +################################################################################
> +
> +BITWISE_VERSION = 0.41
> +BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
> +BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
> +BITWISE_DEPENDENCIES = ncurses readline
> +BITWISE_LICENSE = GPL-2.0

Well, this is your project, and your COPYING file says it's under
GPL-3.0, so I changed this value as well.

Applied with those two changes. Toda!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
