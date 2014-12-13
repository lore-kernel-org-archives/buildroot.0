From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Dec 2014 14:24:25 +0100
Subject: [Buildroot] [PATCH] package/opkg: disable tests and man
In-Reply-To: <1418476997-12905-1-git-send-email-yann.morin.1998@free.fr>
References: <1418476997-12905-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141213132425.GB4198@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-12-13 14:23 +0100, Yann E. MORIN spake thusly:
> Changeset f1d3e09 (Build shared libraries only as the default) broke the
> opkg package.
> 
> opkg wants to link its testsuite statically with the internal libopkg.
> But in a shared-only build, there is no static library.
> 
> Since for Buildroot we do not care about tests, just disable them.

Forget this patch, I was too quick at sending it. I forgot to add a
patch description...

Sorry for the noise. :-(

Regards,
Yann E. MORIN.

> Fixes numerous build failures;
>     http://autobuild.buildroot.net/results/ddf/ddf4b38c1df73b00b76be71db3f1eb8b1d932c55/
>     http://autobuild.buildroot.net/results/c1c/c1c9a21b6583c9ef3ddd32681bb13cf91a218e8c/
>     http://autobuild.buildroot.net/results/284/284bf7d6f9cebf8633143ca1ce15154de941805f/
>     ...
> 
> Disable manpages at the same time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> ---
> Note: we could also easily patch the Makefiles to not require a static
> build, and that works quite well, too. But upstream has changed quite a
> lot in this respect, so that change would not be upstreamable. Better
> jsut disable tests as we do not use them anyway.
> ---
>  package/opkg/0001-no-tests-no-man.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/opkg/0001-no-tests-no-man.patch
> 
> diff --git a/package/opkg/0001-no-tests-no-man.patch b/package/opkg/0001-no-tests-no-man.patch
> new file mode 100644
> index 0000000..dad97ea
> --- /dev/null
> +++ b/package/opkg/0001-no-tests-no-man.patch
> @@ -0,0 +1,11 @@
> +diff -durN opkg-v0.2.2.orig/Makefile.am opkg-v0.2.2/Makefile.am
> +--- opkg-v0.2.2.orig/Makefile.am	2014-04-01 22:31:59.000000000 +0200
> ++++ opkg-v0.2.2/Makefile.am	2014-12-13 14:13:49.684618796 +0100
> +@@ -1,6 +1,6 @@
> + ACLOCAL_AMFLAGS = -I shave
> + 
> +-SUBDIRS = libbb libopkg src tests utils man
> ++SUBDIRS = libbb libopkg src utils
> + 
> + 
> + HOST_CPU=@host_cpu@
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
