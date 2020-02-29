From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 17:36:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: annotate _IGNORE_CVES
 for CVE-2009-3654
In-Reply-To: <20200229094609.2451566-1-fontaine.fabrice@gmail.com>
References: <20200229094609.2451566-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229163608.GO8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 10:46 +0100, Fabrice Fontaine spake thusly:
> Unspecified vulnerability in Boost before 6.x-1.03, a module for Drupal,
> allows remote attackers to create new webroot directories via unknown
> attack vectors.

Yes, good to know, but the interesting bit is why we are not affected,
which your commit log fails to specify.

Also, the comment should say so as well. Maybe just something like:

    # Module for Drupal, not installed in Buildroot
    BOOST_IGNORE_CVES +=...

Care to respin with explanations, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 322429a10c..c9e80266e0 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -11,6 +11,9 @@ BOOST_INSTALL_STAGING = YES
>  BOOST_LICENSE = BSL-1.0
>  BOOST_LICENSE_FILES = LICENSE_1_0.txt
>  
> +# module for Drupal
> +BOOST_IGNORE_CVES += CVE-2009-3654
> +
>  # keep host variant as minimal as possible
>  HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
>  	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
> -- 
> 2.25.0
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
