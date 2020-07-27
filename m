From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 13:31:47 +0200
Subject: [Buildroot] [PATCH v3, 1/1] package/zbar: bump to version 0.23.1
In-Reply-To: <20200725221016.1064129-1-fontaine.fabrice@gmail.com>
References: <20200725221016.1064129-1-fontaine.fabrice@gmail.com>
Message-ID: <20200727113147.GU19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-26 00:10 +0200, Fabrice Fontaine spake thusly:
> - Add new NLS dependency as well as a patch to fix a build failure
>   without it: https://github.com/mchehab/zbar/issues/90
> - Drop host-gettext (not needed since autoreconf was dropped with
>   8729c4ef881b02ff85b7645b0ad309d6ae44fccf)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> +diff --git a/zbar/gettext.h b/zbar/gettext.h
> +new file mode 100644
> +index 0000000..bd8e87d
> +--- /dev/null
> ++++ b/zbar/gettext.h
> +@@ -0,0 +1,294 @@
> ++/* Convenience header for conditional use of GNU <libintl.h>.
> ++   Copyright (C) 1995-1998, 2000-2002, 2004-2006, 2009-2018 Free Software
> ++   Foundation, Inc.
> ++
> ++   This program is free software: you can redistribute it and/or modify
> ++   it under the terms of the GNU General Public License as published by
> ++   the Free Software Foundation; either version 3 of the License, or
> ++   (at your option) any later version.

Whoa, no no...

zbar is LGP-2.1+, and this header makes it de-facto GPL-3+

This is fishy, please fix that with upstream before we can update.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
