From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 19:53:31 +0100
Subject: [Buildroot] [PATCH v2] gnupg2: fix linking with intl
In-Reply-To: <1418299611-50833-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418299611-50833-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141211195331.48f6f7c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 11 Dec 2014 12:06:51 +0000, Vicente Olivert Riera wrote:

> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +GNUPG2_DEPENDENCIES += gettext
> +GNUPG2_CONF_ENV += LIBS=-lintl

Are you sure we need this LIBS part when glibc is used?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
