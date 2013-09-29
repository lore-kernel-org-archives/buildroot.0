From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Sep 2013 18:20:21 +0200
Subject: [Buildroot] [PATCH 1/1] gnupg: option to include RSA support.
In-Reply-To: <1380398533-12094-1-git-send-email-psanford@nearbuysystems.com>
References: <1380398533-12094-1-git-send-email-psanford@nearbuysystems.com>
Message-ID: <20130929182021.1417b3e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Sanford,

Thanks! Some comments below.

On Sat, 28 Sep 2013 13:02:13 -0700, Peter Sanford wrote:

> +config BR2_PACKAGE_GNUPG_RSA
> +  bool "RSA support"
> +  help
> +    Support for RSA public key algorithm

The indentation here is not good: it should be one tab before "bool"
and "help", and one tab+two spaces before the help text. See the
Buildroot manual and other examples throughout the Buildroot tree.

> +ifeq ($(BR2_PACKAGE_GNUPG_RSA),y)
> +GNUPG_CONF_OPT += --enable-rsa
> +endif

We generally like to have an "else" clause that explicitly disables the
option when not enabled, i.e:

else
GNUPG_CONF_OPT += --disable-rsa
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
