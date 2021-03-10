From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Mar 2021 22:24:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix tarball hash
In-Reply-To: <20210310191802.264463-1-fontaine.fabrice@gmail.com>
References: <20210310191802.264463-1-fontaine.fabrice@gmail.com>
Message-ID: <20210310212437.GR2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-10 20:18 +0100, Fabrice Fontaine spake thusly:
> tarball hash is broken since commit
> 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/712167620d46ed0175da89dfe77a8db2534b925d

Up[dating a hash file should be accompanied by explanations why it has
to be updated. If you look the commit log for 03fa36df7e6, you will
notice that there is an explicit mention about the hash.

So we have an issue, because that hash is what I computed when I applied
03fa36df7e6, and it is still what I get here on my machine right now.

This means that, once again, the svn download backend does not easily
allow generating reproducible archives... :-(

The issue happens on my autobuilder, so I will be able to investigate.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/avrdude/avrdude.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
> index c7b4bf85bc..e0f11f8e73 100644
> --- a/package/avrdude/avrdude.hash
> +++ b/package/avrdude/avrdude.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  a74532a61d07e43fc598ade4202e9a8c8697bce3e6031c5be6f51da651595f99  avrdude-r1450-br1.tar.gz
> +sha256  28887d8cdd31c3090f5d49c297abd859a845eafc36104185e7584dbef0920a19  avrdude-r1450-br1.tar.gz
>  sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
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
