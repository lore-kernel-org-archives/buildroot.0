From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 16:50:50 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/vala/vala-wrapper: fix
 wrapper
In-Reply-To: <20200327183000.1005676-1-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
Message-ID: <20200329145050.GF22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-27 11:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Add double quotes around the $@ variable to prevent globbing.

s/globbing/word splitting/

Applied to master with that fixed (and a small tweak to the titile too).
I also added yself as Reported-by, while at it. ;-)

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/vala/vala-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/vala/vala-wrapper b/package/vala/vala-wrapper
> index ae2f7ca671..84fc905b9f 100644
> --- a/package/vala/vala-wrapper
> +++ b/package/vala/vala-wrapper
> @@ -1,2 +1,2 @@
>  #!/bin/sh
> -$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 $@
> +$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 "$@"
> -- 
> 2.25.1
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
