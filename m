From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:21:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: fix
 build with host-gettext-tiny
In-Reply-To: <20190402203237.14733-1-fontaine.fabrice@gmail.com>
References: <20190402203237.14733-1-fontaine.fabrice@gmail.com>
Message-ID: <20190404222124.0ed5b312@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Giulio and Vadim in Cc.

On Tue,  2 Apr 2019 22:32:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Don't build and intall i18n if BR2_SYSTEM_ENABLE_NLS is not set
> otherwise build will fail with host-gettext-tiny on:
> 
> msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
> fopen: No such file or directory

This looked a lot like the msgfmt issue that was causing build issues
with rygel, and that got fixed by upgrading gettext-tiny.
Unfortunately, I tried it, and even with the new gettext-tiny version,
I still get those failures.

However, I believe the right course of action is to fix the issue in
gettext-tiny itself. Could someone report the bug to upstream
gettext-tiny ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
