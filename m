From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Nov 2013 17:52:19 +0100
Subject: [Buildroot] [PATCH] nano: fix build breakage with libmagic
In-Reply-To: <1384447812-2546-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384447812-2546-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131114175219.467162c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 14 Nov 2013 13:50:12 -0300, Gustavo Zacarias wrote:

> +ifeq ($(BR2_PACKAGE_FILE),y)
> +	NANO_DEPENDENCIES += file
> +else
> +	NANO_CONF_OPT += ac_cv_lib_magic_magic_open=no

We usually pass these variables in <pkg>_CONF_ENV, no? Though I know
it's legit to pass them as options to configure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
