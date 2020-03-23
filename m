From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2020 22:07:45 +0100
Subject: [Buildroot] [PATCH] package/quagga: install quagga to staging
In-Reply-To: <20200323204918.53596-1-graham.rhodes@rockwellcollins.com>
References: <20200323204918.53596-1-graham.rhodes@rockwellcollins.com>
Message-ID: <20200323210745.GL22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Graham, All,

On 2020-03-23 15:49 -0500, Graham Rhodes spake thusly:
> ---
>  package/quagga/quagga.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index 96a971104b..0b352aa367 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -6,6 +6,7 @@
>  
>  QUAGGA_VERSION = 1.2.4
>  QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
> +QUAGGA_INSTALL_STAGING = YES

Thanks for this change, but you have to explain why you need it in
staging.

A commit log should provide explanations for why the change is neeed.

Also, your commit log should end up with your Signed-off-by )SoB) line.
The SoB line is an attestation by yourself that your are allowed to
contribute the change: https://developercertificate.org/

For example, here is a totally hypotetical commit log:

    package/quagga: install to staging

    quagga installs a library that can be used by other applications to
    quaggaize the World, which turns the World into a giant party (this
    is a good thing).

    So, install it to staging.

    Signed-off-by: You NAME <your-email>

Regards,
Yann E. MORIN.

>  QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
>  QUAGGA_LICENSE = GPL-2.0+
>  QUAGGA_LICENSE_FILES = COPYING
> -- 
> 2.23.0
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
