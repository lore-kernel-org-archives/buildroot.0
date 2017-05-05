From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 May 2017 21:57:22 +0200
Subject: [Buildroot] [PATCH] package/kyua: fix unmet dependencies
In-Reply-To: <20170505190826.11902-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 5 May 2017 21:08:26 +0200")
References: <20170505190826.11902-1-yann.morin.1998@free.fr>
Message-ID: <8760hfrs9p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > lutok is a lua module, so it depends on ! static libs. However, the
 > dependency is implicit, being done because the lua modules are sourced
 > globally under an if-block, and thus it is not easy to find that
 > dependency.

 > Propagate that dependency to kyua, which was missing it (because it is
 > not a lua module, so was missing the dependency).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
 > ---
 >  package/kyua/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/kyua/Config.in b/package/kyua/Config.in
 > index 4f887b0e0a..6444b8c9e0 100644
 > --- a/package/kyua/Config.in
 > +++ b/package/kyua/Config.in
 > @@ -3,6 +3,7 @@ config BR2_PACKAGE_KYUA
 >  	depends on BR2_INSTALL_LIBSTDCPP
 >  	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
 >  	depends on !BR2_PACKAGE_LUAJIT # lutok
 > +	depends on !BR2_STATIC_LIBS # lutok
 >  	depends on BR2_USE_MMU # atf
 >  	select BR2_PACKAGE_ATF
 >  	select BR2_PACKAGE_LUTOK

Committed after propagating this dependency to the toolchain comment as
well, thanks.

-- 
Bye, Peter Korsgaard
