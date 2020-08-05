From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:52:47 +0200
Subject: [Buildroot] [PATCH 4/5] package/systemd: remove util-linux
 nologin dependency
In-Reply-To: <20200731215345.19212-5-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
 <20200731215345.19212-5-nolange79@gmail.com>
Message-ID: <20200805155247.0d39b511@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:53:44 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
> +SYSTEMD_CONF_OPTS += -Dnologin-path=/usr/sbin/nologin

nologin is in fact installed in /sbin in a non-merged /usr
configuration. I know in the case of systemd, merged /usr is always
enabled so that is not a big deal, but I nevertheless changed to
/sbin/nologin since it seems to be the canonical location for nologin.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
