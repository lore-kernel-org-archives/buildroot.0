From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:10:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/spice: depend on libglib2
In-Reply-To: <20160221220552.GF3456@free.fr>
References: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
 <20160221211249.723daeb6@free-electrons.com>
 <20160221220552.GF3456@free.fr>
Message-ID: <20160221231059.4491f666@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 21 Feb 2016 23:05:52 +0100, Yann E. MORIN wrote:

>     $ git grep -E '\<glib.h\>'
>     server/reds.c:#include <glib.h>
> 
> The server is not optional (only the client is), and reds.c is not
> conditoinal in server/Makefile.am.

Aaah, I missed the PKG_CHECK_MODULES([GLIB2], [glib-2.0 >= 2.22]) line.

Since I believe Bernd's patch was pointing to:

SPICE_REQUIRES+=" glib-2.0 >= 2.22"

I thought he was referring to this line as the justification for the
glib dependency.

But OK, it really needs glib. I'll apply Bernd's patch. Thanks for
confirming!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
