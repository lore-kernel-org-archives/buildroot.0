From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 5 Nov 2020 09:21:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: fix build
 without xsltproc
In-Reply-To: <20201105074739.325141-1-fontaine.fabrice@gmail.com>
References: <20201105074739.325141-1-fontaine.fabrice@gmail.com>
Message-ID: <CAAP7ucJ=1RbirSk+3_BNNiuQ8nmPqAq-83uaNu_r2vLj1WzZCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

>
> xsltproc is used to generate ModemManager-names.h since, at least,
> version 0.7.990 and
> https://github.com/freedesktop/ModemManager/commit/365b906a3e1bda05af10f92451a6b6ae60f8b879
> However, this file is already available in the official tarball so drop
> this unneeded dependency and set ac_cv_prog_XSLTPROC_CHECK to yes
>

Yes, this is true. xsltproc would only be needed when building from
git, the same as autoconf-archive.

>  MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
> +MODEM_MANAGER_CONF_ENV = ac_cv_prog_XSLTPROC_CHECK=yes
>

This is extremely ugly, but I understand it's the only way forward for
now. I've created an upstream Issue to fix this in ModemManager
itself:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/issues/276

Acked-by: Aleksander Morgado <aleksander@aleksander.es>

-- 
Aleksander
https://aleksander.es
