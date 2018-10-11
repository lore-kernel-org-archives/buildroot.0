From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 10:07:03 +0200
Subject: [Buildroot] [PATCH 1/1] nmap: use system liblinear
In-Reply-To: <20181009172217.9386-1-fontaine.fabrice@gmail.com>
References: <20181009172217.9386-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011100703.60d25373@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 19:22:17 +0200, Fabrice Fontaine wrote:
> Use system liblinear instead of using included liblinear.
> liblinear in buildroot is at version 2.20 released on December 2017
> whereas liblinear in nmap has not been updated since 7 years (except for
> liblinear.vcxproj which has been updated 2 years ago)
> 
> Do not use --with-liblinear option as otherwise nmap will forget to add
> -llinear to LIBS due to the following line in configure.ac:
> 
> if test $have_liblinear != yes; then
>   AC_CHECK_HEADERS([linear.h],
>     AC_CHECK_LIB(linear, predict, [have_liblinear=yes; LIBLINEAR_LIBS="-llinear"; break],, [-lm])
> )
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nmap/Config.in | 1 +
>  package/nmap/nmap.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
