From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 23:22:17 +0100
Subject: [Buildroot] [RFC] python-lxml: add target package variant
In-Reply-To: <1421619459-26270-1-git-send-email-yegorslists@googlemail.com>
References: <1421619459-26270-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150118222217.GE16593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2015-01-18 23:17 +0100, Yegor Yefremov spake thusly:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[--SNIP--]
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index 758ce87..292031b 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -20,6 +20,8 @@ PYTHON_LXML_LICENSE_FILES = \
>  # So, we use setuptools.
>  PYTHON_LXML_SETUP_TYPE = setuptools
>  
> -PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
> +PYTHON_LXML_DEPENDENCIES = libxml2 libxslt host-libxslt

Why does it need the host variant of libxslt?

Anyway, I'll cary it in my branch. Thanks! :-)

Regards,
Yann E. MORIN.

> +
> +$(eval $(python-package))
>  $(eval $(host-python-package))
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
