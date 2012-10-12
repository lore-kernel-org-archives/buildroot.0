From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 18:39:01 +0200
Subject: [Buildroot] [PATCH v10 10/10] microperl: remove it
In-Reply-To: <1349881591-7062-10-git-send-email-francois.perrad@gadz.org>
References: <1349881591-7062-1-git-send-email-francois.perrad@gadz.org>
 <1349881591-7062-10-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121012183901.5acc6827@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed, 10 Oct 2012 17:06:31 +0200, Francois Perrad wrote:
> replaced by perl
> use BR2_PACKAGE_PERL_CUSTOM_INSTALL if you want a small footprint
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                  |    1 -
>  package/autoconf/Config.in                         |    2 +-
>  package/autoconf/autoconf.mk                       |    7 +-
>  package/automake/Config.in                         |    2 +-
>  package/automake/automake.mk                       |    7 +-
>  package/libxml-parser-perl/libxml-parser-perl.mk   |    6 -
>  package/microperl/Config.in                        |   30 ----
>  .../microperl/microperl-no-signal-handlers.patch   |   22 ---
>  package/microperl/microperl-uudmap.patch           |   47 ------
>  package/microperl/microperl.mk                     |  156 --------------------
>  package/ntp/Config.in                              |    4 +-
>  package/samba/Config.in                            |    4 +-
>  12 files changed, 8 insertions(+), 280 deletions(-)
>  delete mode 100644 package/microperl/Config.in
>  delete mode 100644 package/microperl/microperl-no-signal-handlers.patch
>  delete mode 100644 package/microperl/microperl-uudmap.patch
>  delete mode 100644 package/microperl/microperl.mk

If you change your PATCH 07/10 to switch everybody to just use the new
perl package, then this patch should just become a simple removal of
the microperl package: no other packages should be affected.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
