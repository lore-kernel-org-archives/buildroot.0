From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 24 Jun 2016 19:57:05 +0200
Subject: [Buildroot] [git commit] package/gtest: add and install a .pc
 file
In-Reply-To: <20160624160016.5DA6181EB2@busybox.osuosl.org>
References: <20160624160016.5DA6181EB2@busybox.osuosl.org>
Message-ID: <746084fe-a270-38bf-d817-28ee2538d8dc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 24/06/2016 ? 18:00, Thomas Petazzoni a ?crit :
> commit: https://git.buildroot.net/buildroot/commit/?id=e9c4497c92cfe2f2792664cdc6e8a70a191a9b6d
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Signed-off-by: Cedric Chedaleux <cedric.chedaleux@orange.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gtest/gtest.mk |  2 ++
>  package/gtest/gtest.pc | 11 +++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index da08621..a4ef45b 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -31,6 +31,8 @@ define GTEST_INSTALL_STAGING_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
>  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
>  	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
> +	$(INSTALL) -D -m 0644 packages/gtest/gtest.pc \
                                    ^^
s/packages/package/

Best regards,
Romain
> +		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
>  	# Generate the gtest-config script manually, since the CMake
>  	# build system is not doing it.
>  	sed 's%@PACKAGE_TARNAME@%gtest%;\
> diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
> new file mode 100644
> index 0000000..b7a8aa4
> --- /dev/null
> +++ b/package/gtest/gtest.pc
> @@ -0,0 +1,11 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=${prefix}/lib/
> +includedir=${prefix}/include
> +
> +Name: gtest
> +Description: Google C++ Testing Framework
> +Version: 1.7.0
> +Libs: -L${libdir} -lgtest
> +Libs.private: -lpthread
> +Cflags: -I${includedir}
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
