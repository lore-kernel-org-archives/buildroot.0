From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 18:23:38 +0100
Subject: [Buildroot] [PATCH] package/libssh: security bump to version
 0.9.3
In-Reply-To: <20191219080151.14616-1-peter@korsgaard.com>
References: <20191219080151.14616-1-peter@korsgaard.com>
Message-ID: <20191219172338.GJ26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-12-19 09:01 +0100, Peter Korsgaard spake thusly:
> Fixes the following security vulnerabilities:
> 
> - CVE-2019-14889: Unsanitized location in scp could lead to unwanted command
>   execution.
> 
> And adds various hardening improvements.  For details, see the announcement:
> 
> https://www.libssh.org/2019/12/10/libssh-0-9-3-and-libssh-0-8-8-security-release/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libssh/libssh.hash | 4 ++--
>  package/libssh/libssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
> index 2f5708ddac..ca296701bf 100644
> --- a/package/libssh/libssh.hash
> +++ b/package/libssh/libssh.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://www.libssh.org/files/0.9/libssh-0.9.0.tar.xz.asc
> +# https://www.libssh.org/files/0.9/libssh-0.9.3.tar.xz.asc
>  # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> -sha256 25303c2995e663cd169fdd902bae88106f48242d7e96311d74f812023482c7a5  libssh-0.9.0.tar.xz
> +sha256 2c8b5f894dced58b3d629f16f3afa6562c20b4bdc894639163cf657833688f0c  libssh-0.9.3.tar.xz
>  sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index b8464ed2bf..161040b346 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBSSH_VERSION_MAJOR = 0.9
> -LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
> +LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
>  LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
>  LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
>  LIBSSH_LICENSE = LGPL-2.1
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
