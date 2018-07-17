From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 23:29:45 +0200
Subject: [Buildroot] [PATCH 2/3] gnu-efi: add host variant
In-Reply-To: <1530887774-19479-3-git-send-email-celso.neto.cwi@datacom.com.br>
 (Celso Varella's message of "Fri, 6 Jul 2018 11:36:13 -0300")
References: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
 <1530887774-19479-3-git-send-email-celso.neto.cwi@datacom.com.br>
Message-ID: <87601dk0ty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Celso" == Celso Varella <celso.neto.cwi@datacom.com.br> writes:

 > It will be required by host-sbsigntools (forthcoming package).
 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 >  package/gnu-efi/gnu-efi.mk | 20 ++++++++++++++++++++
 >  1 file changed, 20 insertions(+)

 > diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
 > index d55e027..b106010 100644
 > --- a/package/gnu-efi/gnu-efi.mk
 > +++ b/package/gnu-efi/gnu-efi.mk
 > @@ -26,6 +26,12 @@ else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 >  GNU_EFI_PLATFORM = aarch64
 >  endif
 
 > +ifeq ($(HOSTARCH),x86)
 > +HOST_GNU_EFI_PLATFORM = ia32
 > +else
 > +HOST_GNU_EFI_PLATFORM = $(HOSTARCH)
 > +endif

While host-gnu-efi shouldn't be a user visible config option, it would
still be nice to add a Config.in.host with hidden
BR2_PACKAGE_HOST_GNU_EFI_ARCH_SUPPORTS option depending on the supported
host architectures, so E.G. host-sbsigntools can depend on it.

-- 
Bye, Peter Korsgaard
