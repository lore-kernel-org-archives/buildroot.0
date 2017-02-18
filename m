From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Feb 2017 22:25:16 +0100
Subject: [Buildroot] package/sngrep: add missing ncurses dependencies
In-Reply-To: <D8DCF0E7-A90B-41CE-A5D4-AB7707C14C39@abelbeck.com>
References: <D8DCF0E7-A90B-41CE-A5D4-AB7707C14C39@abelbeck.com>
Message-ID: <b130a614-511a-fdcd-357b-05ae36935d00@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lonnie,

Please keep the mailing list in Cc

Le 18/02/2017 ? 20:58, Lonnie Abelbeck a ?crit :
> Romain,
> 
> You also need to select ...
> 
> +	select BR2_PACKAGE_NCURSES_TARGET_MENU
> 
> All three are needed as a runtime dependency.

Actually it's checked by the configure script:

AC_CHECK_LIB([menu], [new_item], [], [
AC_MSG_ERROR([ You need to have ncurses menu library installed to compile sngrep.])
])

I missed it because it was already selected by the config I used... I'll fix it.

Thanks for review!

Best regards,
Romain

> 
> Lonnie
> 
