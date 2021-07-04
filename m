From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:55:09 +0200
Subject: [Buildroot] [PATCH] package/casync: undefine NDEBUG
In-Reply-To: <54a8f6820a221cc3ba2446fedfd57743f742550f.1624512487.git.baruch@tkos.co.il>
References: <54a8f6820a221cc3ba2446fedfd57743f742550f.1624512487.git.baruch@tkos.co.il>
Message-ID: <20210704195509.GH2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2021-06-24 08:28 +0300, Baruch Siach spake thusly:
> The casync code relies on assert() calls being non-empty. Undefine
> NDEBUG to override BR2_ENABLE_RUNTIME_DEBUG not being set.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4c69f45a41462564382f667f5e97b78b49c97759/
> http://autobuild.buildroot.net/results/778a94f63c8e9f805badb5c8ff040dcfc5c193e7/
> http://autobuild.buildroot.net/results/d4c23639747dafcded4e28602ccbe48d102c385b/
> 
> Cc: Yair Ben Avraham <yairba@protonmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

We are now no longer setting NDEBUG in the infra; see a1c7cff1a081.

So this patch is no longer needed; I've marked it as rejected.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/casync/casync.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/casync/casync.mk b/package/casync/casync.mk
> index d74cb1bfe85d..e161c7bbc6d3 100644
> --- a/package/casync/casync.mk
> +++ b/package/casync/casync.mk
> @@ -12,6 +12,9 @@ CASYNC_DEPENDENCIES = acl libcurl openssl
>  
>  CASYNC_CONF_OPTS = -Dman=false -Doss-fuzz=false -Dllvm-fuzz=false
>  
> +# Code relies on assert(false) calls
> +CASYNC_CFLAGS = $(TARGET_CFLAGS) -UNDEBUG
> +
>  ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
>  CASYNC_DEPENDENCIES += bash-completion
>  # The default path is correct, leave it as-is
> -- 
> 2.30.2
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
