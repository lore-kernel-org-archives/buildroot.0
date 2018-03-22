From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 00:01:29 +0100
Subject: [Buildroot] [PATCH 5/6] tpm2-tools: propagate dependencies of
 selected packages
In-Reply-To: <20180322202752.2562-6-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 22 Mar 2018 17:27:51 -0300")
References: <20180322202752.2562-1-casantos@datacom.ind.br>
 <20180322202752.2562-6-casantos@datacom.ind.br>
Message-ID: <87a7uz4svq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > - C++ (tpm2-tss)
 > - MMU (dbus, libglib)
 > - threads (libglib)
 > - wchar (libglib -> gettext)

 > Fixes (libglib):
 >   http://autobuild.buildroot.net/results/786859fccc477de1519d85d8a180626bb8ebe062
 >   http://autobuild.buildroot.net/results/df6518f331c16b477c6e934914d0e56dc102c228

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/tpm2-tools/Config.in | 8 ++++++++
 >  1 file changed, 8 insertions(+)

 > diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
 > index 6429b24531..5992cc1174 100644
 > --- a/package/tpm2-tools/Config.in
 > +++ b/package/tpm2-tools/Config.in
 > @@ -1,5 +1,8 @@
 >  config BR2_PACKAGE_TPM2_TOOLS
 >  	bool "tpm2-tools"
 > +	depends on BR2_USE_MMU # dbus, libglib
 > +	depends on BR2_USE_WCHAR # libglib -> gettext
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib

You forgot BR2_INSTALL_LIBSTDCPP. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
