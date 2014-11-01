From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 17:43:16 +0100
Subject: [Buildroot] [PATCH 1/1] xinetd: change to snapshot.debian.org
 and add hash
In-Reply-To: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
References: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141101164316.GB10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-11-01 17:35 +0100, Karoly Kasza spake thusly:
> xinetd.org seems down quite some time, so change to snapshot.debian.org.

Indeed, it's down from here, too... :-(

> Also add hash.

Manually downloaded and verified the two hashes.

> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xinetd/xinetd.hash |    4 ++++
>  package/xinetd/xinetd.mk   |    3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>  create mode 100644 package/xinetd/xinetd.hash
> 
> diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
> new file mode 100644
> index 0000000..f656422
> --- /dev/null
> +++ b/package/xinetd/xinetd.hash
> @@ -0,0 +1,4 @@
> +# From snapshot.debian.org dsc file
> +sha1	168d54aeb181e271e68f4c53847c3e6b2574dba6				xinetd_2.3.15.orig.tar.gz
> +sha256	bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3	xinetd_2.3.15.orig.tar.gz
> +
> diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
> index 1fb91b5..7060f0c 100644
> --- a/package/xinetd/xinetd.mk
> +++ b/package/xinetd/xinetd.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  XINETD_VERSION = 2.3.15
> -XINETD_SITE = http://www.xinetd.org
> +XINETD_SOURCE = xinetd_$(XINETD_VERSION).orig.tar.gz
> +XINETD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/x/xinetd
>  XINETD_LICENSE = xinetd license
>  XINETD_LICENSE_FILES = COPYRIGHT
>  
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141101/266b2e49/attachment.asc>
