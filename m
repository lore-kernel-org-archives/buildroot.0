From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:53:13 +0200
Subject: [Buildroot] [PATCH 05/15 v5] package/eudev: bump to 1.10
In-Reply-To: <c609d379d02a9d21286707a654b296687b28cd00.1409578332.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 1 Sep 2014 15:38:17 +0200")
References: <cover.1409578332.git.yann.morin.1998@free.fr>
 <c609d379d02a9d21286707a654b296687b28cd00.1409578332.git.yann.morin.1998@free.fr>
Message-ID: <8738at3es6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Now requires Linux kernel headers >= 3.9.
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/eudev/Config.in | 8 ++++++--
 >  package/eudev/eudev.mk  | 2 +-
 >  system/Config.in        | 6 ++++--
 >  3 files changed, 11 insertions(+), 5 deletions(-)

 > diff --git a/package/eudev/Config.in b/package/eudev/Config.in
 > index fa28a9f..7aaa540 100644
 > --- a/package/eudev/Config.in
 > +++ b/package/eudev/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_EUDEV
 >  	bool "eudev"
 > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9

When respinning this series, please also adjust the eudev help text as
it currently says 2.6.34:

          eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
          and inotify.

-- 
Bye, Peter Korsgaard
