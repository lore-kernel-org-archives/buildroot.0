From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 00:02:33 +0100
Subject: [Buildroot] [PATCH 6/6] tpm2-tools: allow building without
 stack smashing protection (SSP)
In-Reply-To: <20180322202752.2562-7-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 22 Mar 2018 17:27:52 -0300")
References: <20180322202752.2562-1-casantos@datacom.ind.br>
 <20180322202752.2562-7-casantos@datacom.ind.br>
Message-ID: <87605n4sty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Disable SSP if the toolchain does not support it. This must be done
 > explicitly because configure enables hardening by default but doesn't
 > contain a link test, so it doesn't detect when libssp is missing.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/tpm2-tools/tpm2-tools.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
 > index 0697900d2d..8d2cfa2cb2 100644
 > --- a/package/tpm2-tools/tpm2-tools.mk
 > +++ b/package/tpm2-tools/tpm2-tools.mk
 > @@ -10,4 +10,8 @@ TPM2_TOOLS_LICENSE = BSD-2-Clause
 >  TPM2_TOOLS_LICENSE_FILES = LICENSE
 >  TPM2_TOOLS_DEPENDENCIES = dbus libcurl libglib2 openssl tpm2-tss host-pkgconf
 
 > +# configure.ac doesn't contain a link test, so it doesn't detect when 

A trailing space here. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
