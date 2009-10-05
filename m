From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Oct 2009 11:10:01 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: adjust make environment for
	pkg-config call
In-Reply-To: <1254733230.5772.7.camel@sven> (Sven Neumann's message of "Mon\,
	05 Oct 2009 11\:00\:30 +0200")
References: <1254731431-8430-1-git-send-email-s.neumann@raumfeld.com>
	<87y6nq44bp.fsf@macbook.be.48ers.dk> <1254733230.5772.7.camel@sven>
Message-ID: <87tyye436e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> Won't this pick up /usr/bin/pkg-config instead of the one in HOST_DIR? I
 >> would prefer to simply use TARGET_CONFIGURE_OPTS here so the path gets
 >> set and we only have the pkgconfig magic one place.

 Sven> The PATH is already set. Here's the relevant line from our log (with
 Sven> this change applied):

 Sven> PATH="/tmp/build/build/toolchain_build_arm/bin:/tmp/build/build/build_arm/host_dir/bin:/tmp/build/build/build_arm/host_dir/usr/bin:/tmp/build/build/build_arm/staging_dir/bin:/tmp/build/build/build_arm/staging_dir/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games" PKG_CONFIG_SYSROOT_DIR="/tmp/build/build/build_arm/staging_dir" PKG_CONFIG_PATH="/tmp/build/build/build_arm/staging_dir/usr/lib/pkgconfig" /usr/bin/make -j4  -C /tmp/build/build/build_arm/wpa_supplicant-0.6.9/wpa_supplicant

Ahh yes, Makefile.autotools.in has:

PATH=$(TARGET_PATH) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_MAKE_OPT)
-C $(@D)/$($(PKG)_SUBDIR)

 Sven> But if you can come up with a cleaner solution, then please go ahead and
 Sven> commit it instead of my patch.

No - With that out of the way, then I think your patch is fine.

-- 
Bye, Peter Korsgaard
