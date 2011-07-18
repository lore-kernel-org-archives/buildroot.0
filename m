From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jul 2011 23:14:07 +0200
Subject: [Buildroot] [PATCH 2/3] gvfs: drop dbus-glib dependency
In-Reply-To: <1310576089-9207-2-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 13 Jul 2011 18:54:48 +0200")
References: <1310576089-9207-1-git-send-email-s.neumann@raumfeld.com>
 <1310576089-9207-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <8762mz5m1s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Drop the dbus-glib dependency as gvfs uses dbus directly.
 Sven> Also change dependency on the XML parser for dbus to be more
 Sven> in sync with the dbus package.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/gvfs/Config.in |    6 ++++--
 Sven>  package/gvfs/gvfs.mk   |    2 +-
 Sven>  2 files changed, 5 insertions(+), 3 deletions(-)

 Sven> diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
 Sven> index 04fce93..38eb093 100644
 Sven> --- a/package/gvfs/Config.in
 Sven> +++ b/package/gvfs/Config.in
 Sven> @@ -2,10 +2,9 @@ config BR2_PACKAGE_GVFS
 Sven>  	bool "gvfs"
 Sven>  	depends on BR2_LARGEFILE
 Sven>  	depends on BR2_USE_WCHAR # glib2
 Sven> +	depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2 # dbus
 Sven>  	select BR2_PACKAGE_LIBGLIB2
 Sven> -	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
 Sven>  	select BR2_PACKAGE_DBUS
 Sven> -	select BR2_PACKAGE_DBUS_GLIB
 Sven>  	select BR2_PACKAGE_SHARED_MIME_INFO

mconf unfortunately complains about recursive dependencies because of
libxml2, bus as shared-mime-info already selects libxml2 we can drop the
expat || libxml2 and simply select dbus instead.

Committed, thanks.

-- 
Bye, Peter Korsgaard
