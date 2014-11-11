From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 12:32:09 +0100
Subject: [Buildroot] [PATCH v3 2/2] elfutils: bump version to 0.160
In-Reply-To: <1415703637-11831-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1415703637-11831-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415703637-11831-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141111113209.GC4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-11 11:00 +0000, Vicente Olivert Riera spake thusly:
> - Bump version to 0.160
> - Add a hash file
> - Adapt patches to the new version
> - Add a new patch to really make -Werror conditional to BUILD_WERROR
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/elfutils/0001-disable-progs.patch          |   54 +++++-----
>  package/elfutils/0002-argp-support.patch           |  120 ++++++++++----------
>  package/elfutils/0003-memcpy-def.patch             |   15 ++-
>  package/elfutils/0004-fts.patch                    |   69 ++++++------
>  package/elfutils/0005-disable-po.patch             |   25 ++--
>  ...y-make-werror-conditional-to-build-werror.patch |   24 ++++
>  package/elfutils/elfutils.hash                     |    3 +
>  package/elfutils/elfutils.mk                       |    6 +-
>  8 files changed, 170 insertions(+), 146 deletions(-)
>  create mode 100644 package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
>  create mode 100644 package/elfutils/elfutils.hash
> 
> diff --git a/package/elfutils/0001-disable-progs.patch b/package/elfutils/0001-disable-progs.patch
> index 462de89..b66252d 100644
> --- a/package/elfutils/0001-disable-progs.patch
> +++ b/package/elfutils/0001-disable-progs.patch
> @@ -7,35 +7,17 @@ useful because the programs are often not needed, and also because
>  building the programs against uClibc causes several issues (lack of
>  obstack_printf() in uClibc for example).
>  
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: b/Makefile.am
> -===================================================================
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -22,9 +22,13 @@
> - 
> - pkginclude_HEADERS = version.h
> - 
> -+if ENABLE_PROGS
> -+PROGS_SUBDIR = src
> -+endif
> -+
> - # Add doc back when we have some real content.
> - SUBDIRS = config m4 lib libelf libebl libdwfl libdw libcpu libasm backends \
> --	  src po tests
> -+	  $(PROGS_SUBDIR) po tests
> - 
> - EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
> - 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
> -Index: b/configure.ac
> -===================================================================
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -263,6 +263,12 @@
> +Based on the former patch by Thomas Petazzoni.

Since you based that patch on Thomas' previous patch (and this is in
fact just a refresh), you should keep his SoB-line. The SoB-line is here
to represent the chain in which the patch was handled, so it is very
important to keep them.

Ditto for the other patches.

> diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
> new file mode 100644
> index 0000000..f0f4598
> --- /dev/null
> +++ b/package/elfutils/elfutils.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
> +sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch

Both hashes validated with: make elfutils-source

Looks good. With the SoB lines fixed, you can add my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141111/df033f38/attachment.asc>
