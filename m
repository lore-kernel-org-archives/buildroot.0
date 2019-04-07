From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:11:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Do not install
 headers
In-Reply-To: <20190407084624.25271-1-vadim4j@gmail.com>
References: <20190407084624.25271-1-vadim4j@gmail.com>
Message-ID: <20190407151112.23532895@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Apr 2019 11:46:24 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Since:
> 
>     https://github.com/sabotage-linux/gettext-tiny/commit/58187329ad9f00eb8c39379e7ee0b608dd14bab8
> 
> gettext macrosesss are used by default (if no LIBINTL_NO_MACROS is
> included in CPPFLAGS). It causes such packages like libglib2 fail
> with argument format error because in case of error the formatted
> string is passed as argument.
> 
> Fix it by prevent installation of libintl.h header from gettext-tiny
> by passing LIBINTL=NONE, because each kind of toolchain already provides
> gettext stubs. Also with this change the following patch is not needed:
> 
> 	0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/89fcc4e80ea8c031c1abb350362c19c57eb80e7c/
> 	http://autobuild.buildroot.net/results/84f3eb70fc1c58986dfa7c79d45aaabdf4c011cf/
> 
> and a lot other autobuild reports.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  ...-format-not-a-string-literal-error-for-gc.patch | 55 ----------------------
>  package/gettext-tiny/gettext-tiny.mk               |  5 +-
>  2 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
