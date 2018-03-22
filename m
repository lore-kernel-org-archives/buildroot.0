From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:57:28 +0100
Subject: [Buildroot] [PATCH 3/6] tpm2-abrmd: declare dependency on a
 toolchain with C++
In-Reply-To: <20180322202752.2562-4-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 22 Mar 2018 17:27:49 -0300")
References: <20180322202752.2562-1-casantos@datacom.ind.br>
 <20180322202752.2562-4-casantos@datacom.ind.br>
Message-ID: <87lgej4t2f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > It depends on tpm2-tss, whose current version contains C++ code.
 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/tpm2-abrmd/Config.in | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
 > index 31c5ae7d6b..5c236d1d5c 100644
 > --- a/package/tpm2-abrmd/Config.in
 > +++ b/package/tpm2-abrmd/Config.in
 > @@ -20,6 +20,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 >  	  https://github.com/tpm2-software/tpm2-abrmd
 
 > -comment "tpm2-abrmd needs a toolchain w/ wchar, threads"
 > +comment "tpm2-abrmd needs a toolchain w/ C++, wchar, threads"

You again forgot to add the dependency to the config symbol itself.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
