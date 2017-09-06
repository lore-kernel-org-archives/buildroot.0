From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:51:02 +0200
Subject: [Buildroot] [PATCH] expat: bump to version 2.2.4
In-Reply-To: <4e5ee4d92222339d825f51c084a382cd285e52ef.1504543867.git.baruch@tkos.co.il>
References: <4e5ee4d92222339d825f51c084a382cd285e52ef.1504543867.git.baruch@tkos.co.il>
Message-ID: <20170906225102.1c6e526b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 19:51:07 +0300, Baruch Siach wrote:
> Upstream migrated to automake for autotools. Remove the non-existent
> 'installlib' target. DESTDIR override in not needed anymore, the
> standard configure --prefix is enough.

DESTDIR was not overridden at all: we were using the standard
DESTDIR=$(STAGING_DIR) and DESTDIR=$(TARGET_DIR). The only reason why
the staging opts and target opts were overridden is because we wanted
to use the installib target instead of "install".

In addition, the fact that we don't have to pass DESTDIR is not at all
related to --prefix. DESTDIR is still passed by the pkg-autotools
package infrastructure, and is mandatory. --prefix is defined to /usr,
and therefore is not sufficient for autotools to know where we want to
install stuff.

I've applied after fixing the commit log on this topic. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
