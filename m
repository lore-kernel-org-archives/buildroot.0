From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:59:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: avoid empty -l
In-Reply-To: <20210221175902.3938257-1-fontaine.fabrice@gmail.com>
References: <20210221175902.3938257-1-fontaine.fabrice@gmail.com>
Message-ID: <20210225215926.GN2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-21 18:59 +0100, Fabrice Fontaine spake thusly:
> Add upstream patch to fix upstream commit
> af63fe89228172e5a395f7e6491fae3bfa9da4b1 which was added to buildroot in
> commit d71de4143d7a8554929f2a1e9731f83a4cf85fd3
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/801007860b7787b28b2b2e3611b59350034a3694
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/botan/0002-Avoid-empty-l.patch | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/botan/0002-Avoid-empty-l.patch
> 
> diff --git a/package/botan/0002-Avoid-empty-l.patch b/package/botan/0002-Avoid-empty-l.patch
> new file mode 100644
> index 0000000000..9102360244
> --- /dev/null
> +++ b/package/botan/0002-Avoid-empty-l.patch
> @@ -0,0 +1,25 @@
> +From 4b2225ea54988e09b649768848b3c14b43e064de Mon Sep 17 00:00:00 2001
> +From: Jack Lloyd <jack@randombit.net>
> +Date: Mon, 15 Feb 2021 15:11:12 -0500
> +Subject: [PATCH] Avoid empty -l
> +
> +[Retrieved from:
> +https://github.com/randombit/botan/commit/4b2225ea54988e09b649768848b3c14b43e064de]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.py b/configure.py
> +index 865a6c8e62..a79f672eca 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -2027,7 +2027,7 @@ def extra_libs(libs, cc):
> +         if libs is None:
> +             return ''
> + 
> +-        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',')])
> ++        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',') if lib != ''])
> + 
> +     variables = {
> +         'version_major':  Version.major(),
> -- 
> 2.30.0
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
