From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 11:25:34 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
In-Reply-To: <877ibwvpxk.fsf@macbook.be.48ers.dk>
References: <20080708054144.507E03C67C@busybox.net>
	<877ibwvpxk.fsf@macbook.be.48ers.dk>
Message-ID: <4873328E.5050001@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-07-07 22:41:44 -0700 (Mon, 07 Jul 2008)
>  ulf> New Revision: 22682
> 
>  ulf> Log:
>  ulf> Add glib2.0 specific include/pkconfig paths in 'docker'
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/package/docker/docker.mk
> 
> ..
> 
>  ulf>  DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
>  ulf> -					CFLAGS="-I$(STAGING_DIR)/usr/include" \
>  ulf> +					CFLAGS="-I$(STAGING_DIR)/usr/include \
>  ulf> +						-I$(STAGING_DIR)/usr/include/glib-2.0 \
>  ulf> +						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
>  ulf>  					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
>  ulf>  					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
>  ulf> -					PKG_CONFIG_SYSROOT="$(STAGING_DIR)"
>  ulf> +					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
>  ulf> +					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>  
> 
> Is all of this needed? And shouldn't it be PKG_CONFIG_SYSROOT_DIR
> instead? We don't use the pkgconfig wrapper anymore.
> 
I tried building both ARM and AVR32 and without this,
and both are broken.
docker will use host pkgconfigs instead of target pkgconfigs.

BR
Ulf Samuelsson

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIczKNAyRRH5cXxqwRAkgNAJ9anH30+ChAJ0V+tTsDpKVvkp0jUACgsVW5
ia76vWQIpFptlHw8IckC7qg=
=YPLd
-----END PGP SIGNATURE-----
