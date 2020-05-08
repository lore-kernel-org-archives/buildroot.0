From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 10:14:49 +0200
Subject: [Buildroot] [PATCH 1/5] package/apparmor: replace deprecated
 egrep with grep -E
In-Reply-To: <20200508015956.3270405-1-aduskett@gmail.com>
References: <20200508015956.3270405-1-aduskett@gmail.com>
Message-ID: <20200508081449.GK12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-05-07 18:59 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Upstream commit: 5f46dedd6e8109d845af118b36039a5d7dd05af9
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Patches 1-4 applied to master, thanks. See a few replies to patch 2 and 4.

I've not (yet) applied patch 5, because it is sitting somewhere between
being a feature-patch and being a fix. If is a feature-patch because it
allows building systemnd with apparmor support, while it is a fix
because it guarantees build ordering now... So saying I'm torn onthat
one is a bit strong, but still I am not sure either...

Regards,
Yann E. MORIN.

> ---
>  ...replace-deprecated-egrep-with-grep-e.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
> 
> diff --git a/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
> new file mode 100644
> index 0000000000..4caefe447b
> --- /dev/null
> +++ b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
> @@ -0,0 +1,28 @@
> +From 5f46dedd6e8109d845af118b36039a5d7dd05af9 Mon Sep 17 00:00:00 2001
> +From: Christian Boltz <apparmor@cboltz.de>
> +Date: Mon, 18 Mar 2019 19:17:16 +0100
> +Subject: [PATCH] replace deprecated egrep with grep -e
> +
> +(cherry picked from commit 5f46dedd6e8109d845af118b36039a5d7dd05af9)
> +Signed-off-by: Christian Boltz <apparmor@cboltz.de>
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + parser/rc.apparmor.functions | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
> +index 22e8367..f3108f8 100644
> +--- a/parser/rc.apparmor.functions
> ++++ b/parser/rc.apparmor.functions
> +@@ -129,7 +129,7 @@ skip_profile() {
> + 	     "${profile%.pacnew}" != "${profile}" ] ; then
> + 		return 2
> + 	fi
> +-	if echo "${profile}" | egrep -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
> ++	if echo "${profile}" | grep -E -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
> + 		return 2
> + 	fi
> + 
> +-- 
> +2.26.2
> +
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
