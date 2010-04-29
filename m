From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 09:52:06 +0300
Subject: [Buildroot] [PATCH 09/19] uClibc: add UCLIBC_HAS_NFTW to
	default configuration
In-Reply-To: <e82324c6cae0bbdc5c05e693c878505f6523a9ec.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<e82324c6cae0bbdc5c05e693c878505f6523a9ec.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <v2qbadfd5ba1004282352x3324b525y64f0c033cb299acf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2010 at 12:40 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> UCLIBC_HAS_NFTW is a new knob in 0.9.31, which allows the obsolete and
> deprecated ftw() to be compiled-out separatly from nftw(), which is
> part of POSIX. nftw() should probably be enabled by default in uClibc,
> and a bug has been opened about this on uClibc bug tracker
> (https://bugs.busybox.net/show_bug.cgi?id=1597).
>
> nftw() is, for example, used in Gtk+.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

> ---
> ?toolchain/uClibc/uClibc-0.9.31.config | ? ?2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
> index 091f179..d2e54ad 100644
> --- a/toolchain/uClibc/uClibc-0.9.31.config
> +++ b/toolchain/uClibc/uClibc-0.9.31.config
> @@ -191,7 +191,7 @@ UCLIBC_HAS_REGEX=y
> ?UCLIBC_HAS_FNMATCH=y
> ?# UCLIBC_HAS_FNMATCH_OLD is not set
> ?# UCLIBC_HAS_WORDEXP is not set
> -# UCLIBC_HAS_NFTW is not set
> +UCLIBC_HAS_NFTW=y
> ?UCLIBC_HAS_FTW=y
> ?UCLIBC_HAS_GLOB=y
> ?UCLIBC_HAS_GNU_GLOB=y
> --
> 1.6.3.3
>
