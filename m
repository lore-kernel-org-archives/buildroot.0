From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Mar 2015 16:15:54 +0100
Subject: [Buildroot] [PATCH 4/4] package/powertop: Fix download problems
In-Reply-To: <1427543281-11901-4-git-send-email-bernd.kuhls@t-online.de>
References: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
 <1427543281-11901-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150328161554.36e131b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 28 Mar 2015 12:48:01 +0100, Bernd Kuhls wrote:

>  POWERTOP_VERSION = 2.7
>  POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
> -POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
> +POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf host-wget

This cannot work, because <pkg>_DEPENDENCIES are only guaranteed to be
built and installed before the configure step of <pkg>. And here, you
need host-wget before powertop gets downloaded.

So another solution is needed. Not sure which one, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
