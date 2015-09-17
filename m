From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 17 Sep 2015 08:30:15 -0500
Subject: [Buildroot] [PATCH v3 1/5] package/cups: Un-deprecate,
 and update CUPS to 2.1.0
In-Reply-To: <1442492616-12626-2-git-send-email-olivier.schonken@gmail.com>
References: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
 <1442492616-12626-2-git-send-email-olivier.schonken@gmail.com>
Message-ID: <CAMQcK5+fqZ1UGBVpHkeCXv9r0-GKpCFeEm27ChpoWuSuqKL_YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier,

On Thu, Sep 17, 2015 at 7:23 AM, Olivier Schonken
<olivier.schonken@gmail.com> wrote:

[..]

> diff --git a/package/cups/0001-Remove-building-html-from-man-makefile.patch b/package/cups/0001-Remove-building-html-from-man-makefile.patch
> new file mode 100644
> index 0000000..5468c92
> --- /dev/null
> +++ b/package/cups/0001-Remove-building-html-from-man-makefile.patch
> @@ -0,0 +1,27 @@
> +From da960a1384625d2550ffbf5765a10fe9b3aa5a51 Mon Sep 17 00:00:00 2001
> +From: Olivier Schonken <olivier.schonken@gmail.com>
> +Date: Wed, 18 Mar 2015 20:30:39 +0200
> +Subject: [PATCH] Remove building html from man makefile
> +
> +Building and using mantohtml causes problems for cross-compiling
> +
> +Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> +---
> + man/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)

Would it make more sense to just disable the build of the
documentation all together?

Usually it has been the practice to disable the building of man pages
or any documentation since they are stripped from the target anyways.
I'm not sure if this is possible or not from a conf option because I
haven't look around on the package.

> +diff --git a/man/Makefile b/man/Makefile
> +index dc1a8c0..0ad42a1 100644
> +--- a/man/Makefile
> ++++ b/man/Makefile
> +@@ -73,7 +73,7 @@ MAN8 =       cupsaccept.$(MAN8EXT) \
> + # Make everything...
> + #
> +
> +-all:  $(MAN1) $(MAN5) $(MAN7) $(MAN8) html
> ++all:  $(MAN1) $(MAN5) $(MAN7) $(MAN8)
> +
> +
> + #
> +--
> +1.9.1

[..]

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
