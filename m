From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 May 2018 15:17:04 +0300
Subject: [Buildroot] [PATCH] glibc: security bump to latest 2.27 branch
In-Reply-To: <87o9gy7jv1.fsf@dell.be.48ers.dk>
References: <523a06db874603a862a275a9aa8c493233bae775.1527593123.git.baruch@tkos.co.il>
 <87o9gy7jv1.fsf@dell.be.48ers.dk>
Message-ID: <20180529121704.c4s4es7god7jtidt@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, May 29, 2018 at 01:59:46PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Fixed issues are listed in the 2.27 branch NEWS file:
>  >   CVE-2017-18269: An SSE2-based memmove implementation for the i386
>  >   architecture could corrupt memory.  Reported by Max Horn.
> 
>  >   CVE-2018-11236: Very long pathname arguments to realpath function could
>  >   result in an integer overflow and buffer overflow.  Reported by Alexey
>  >   Izbyshev.
> 
>  >   CVE-2018-11237: The mempcpy implementation for the Intel Xeon Phi
>  >   architecture could write beyond the target buffer, resulting in a buffer
>  >   overflow.  Reported by Andreas Schwab.
> 
> Thanks, that was still on my todo list. Do we need a similar update for
> the 2.26 branch for 2018.02.x?

Yes. All these fixes were backported to the 2.26 branch.

>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/glibc/glibc.hash | 2 +-
>  >  package/glibc/glibc.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
>  > index f19fa92af4cd..035ee810c7d7 100644
>  > --- a/package/glibc/glibc.hash
>  > +++ b/package/glibc/glibc.hash
>  > @@ -1,5 +1,5 @@
>  >  # Locally calculated (fetched from Github)
>  > -sha256  a74489d14f4017bee6a6c6fe76f1de0dbf7d66c8695116de5aadd141c4757892     glibc-glibc-2.27.tar.gz
>  > +sha256  33189b3f10c88730a1f686fac794bc01f31765f12ffd75bc5e8a0f2a690d217a     glibc-6c99e37f6fb640a50a3113b2dbee5d5389843c1e.tar.gz
>  >  # Locally calculated (fetched from Github)
>  >  sha256  ddc63360393ab88ab6a4a0c81d33481f34c5a9ebd758eec2e6bb35385058b4cb     glibc-arc-2018.03-rc2.tar.gz
>  
>  > diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
>  > index 717182b05256..e026c08d16f4 100644
>  > --- a/package/glibc/glibc.mk
>  > +++ b/package/glibc/glibc.mk
>  > @@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
>  >  else
>  >  # Generate version string using:
>  >  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
>  > -GLIBC_VERSION = glibc-2.27
>  > +GLIBC_VERSION = 6c99e37f6fb640a50a3113b2dbee5d5389843c1e
> 
> Can you use the format as described in the comment just above?
> 
> git describe --match 'glibc-*' --abbrev=40 origin/release/2.27/master
> glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e

OK. I'll update the patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
