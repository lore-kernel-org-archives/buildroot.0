From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Jan 2014 21:28:13 +0100
Subject: [Buildroot] [PATCH 04/10] pkg-cmake.mk: build shared library
	when !BR2_PREFER_STATIC_LIB
In-Reply-To: <1390073027-14239-5-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 18 Jan 2014 20:23:41 +0100")
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-5-git-send-email-s.martin49@gmail.com>
Message-ID: <87fvojn2ci.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/pkg-cmake.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
 > index 463cd63..aedd1fc 100644
 > --- a/package/pkg-cmake.mk
 > +++ b/package/pkg-cmake.mk
 > @@ -64,6 +64,7 @@ define $(2)_CONFIGURE_CMDS
 >  	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 >  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 >  		-DCMAKE_INSTALL_PREFIX="/usr" \
 > +		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \

I don't know much about cmake, but what exact problem does this fix and
with how many packages did you test this?

 >  		$$($$(PKG)_CONF_OPT) \
 >  	)
 >  endef
 > -- 
 > 1.8.5.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
