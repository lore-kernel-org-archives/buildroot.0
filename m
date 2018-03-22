From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:51:13 +0100
Subject: [Buildroot] [PATCH 1/6] tpm2-tss: declare dependency on a
 toolchain with C++
In-Reply-To: <20180322202752.2562-2-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 22 Mar 2018 17:27:47 -0300")
References: <20180322202752.2562-1-casantos@datacom.ind.br>
 <20180322202752.2562-2-casantos@datacom.ind.br>
Message-ID: <87tvt74tcu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Version 1.4.0 still contains some C++ code. This has already changed on
 > upstream, so future versions will drop the dependency on a C++ compiler.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/tpm2-tss/Config.in | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
 > index ebf0fd262d..f1a9920700 100644
 > --- a/package/tpm2-tss/Config.in
 > +++ b/package/tpm2-tss/Config.in
 > @@ -29,3 +29,6 @@ config BR2_PACKAGE_TPM2_TSS
 >  	    Microsoft software TPM2 simulator.
 
 >  	  https://github.com/tpm2-software/tpm2-tss
 > +
 > +comment "tpm2-tss needs a toolchain w/ C++"
 > +        depends on !BR2_INSTALL_LIBSTDCPP

This should have been indented with a <tab> and the BR2_PACKAGE_TPM2_TSS
option should also have the C++ dependency.

Consider running utils/check-package on your patches.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
