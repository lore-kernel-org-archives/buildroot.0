From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 23:49:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/git: Fix build without libiconv
In-Reply-To: <20170116212417.30415-1-bernd.kuhls@t-online.de>
References: <20170116212417.30415-1-bernd.kuhls@t-online.de>
Message-ID: <20170326234921.34b89017@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Jan 2017 22:24:16 +0100, Bernd Kuhls wrote:

> +++ b/package/git/0001-configure.ac-fix-old-iconv-check.patch
> @@ -0,0 +1,42 @@
> +From 3c170355aeba39bb310d8b9192c9623b380d5eae Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Mon, 16 Jan 2017 20:14:10 +0100
> +Subject: [PATCH 1/2] configure.ac: fix old iconv check
> +
> +According to
> +https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Running-the-Compiler.html
> +the parameter syntax of AC_COMPILE_IFELSE is
> +
> +(input, [action-if-true], [action-if-false])
> +
> +Displaying "no" when the test was positive and enabling support for old
> +iconv implementations by OLD_ICONV=UnfortunatelyYes when the test fails
> +it obviously wrong. This patch switches the actions to fix the problem.
> +
> +Patch sent upstream:
> +https://public-inbox.org/git/20170116195638.3713-1-bernd.kuhls at writeme.com/T/#t

Seems like the feedback from upstream about this patch was that it
wasn't correct. Have you had the chance to look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
