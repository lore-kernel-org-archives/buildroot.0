From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 10:37:27 +0200
Subject: [Buildroot] [PATCH 23/41] autoconf: added AUTOHEADER variable
In-Reply-To: <87zl16fnv5.fsf@macbook.be.48ers.dk>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-24-git-send-email-llandwerlin@gmail.com>
	<87zl16fnv5.fsf@macbook.be.48ers.dk>
Message-ID: <l2u4d28d4b51004140137l4f0c31cft5fd36f8f17cc93a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 14, 2010 at 10:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "llandwerlin" == llandwerlin ?<llandwerlin@gmail.com> writes:
>
> ?llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
> ?llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ?llandwerlin> ---
> ?llandwerlin> ?package/autoconf/autoconf.mk | ? ?3 ++-
> ?llandwerlin> ?1 files changed, 2 insertions(+), 1 deletions(-)
>
> ?llandwerlin> diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
> ?llandwerlin> index d82c2c5..81233a5 100644
> ?llandwerlin> --- a/package/autoconf/autoconf.mk
> ?llandwerlin> +++ b/package/autoconf/autoconf.mk
> ?llandwerlin> @@ -17,7 +17,7 @@ AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
> ?llandwerlin> ?AUTOCONF_DEPENDENCIES = microperl host-m4
>
> ?llandwerlin> ?HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
> ?llandwerlin> - ? ? ? ? ? ? ? ? ? ? ? ? ?ac_cv_prog_gnu_m4_gnu=no
> ?llandwerlin> + ? ? ? ? ? ? ? ? ac_cv_prog_gnu_m4_gnu=no
>
> ?llandwerlin> ?HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
>
> ?llandwerlin> @@ -26,4 +26,5 @@ $(eval $(call AUTOTARGETS,package,autoconf,host))
>
> ?llandwerlin> ?# variables used by other packages
> ?llandwerlin> ?AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
> ?llandwerlin> +AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
>
> Why? What uses it?
>

autoreconf uses it, otherwise it will use the system's one.
