From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Jun 2014 14:26:52 +0300
Subject: [Buildroot] [PATCH] lzo: security bump to version 2.07
In-Reply-To: <87wqc2lif0.fsf@dell.be.48ers.dk>
References: <b7658f620fcbca547e5aa330bec28c862e8d59b2.1403843549.git.baruch@tkos.co.il>
 <87wqc2lif0.fsf@dell.be.48ers.dk>
Message-ID: <20140627112652.GC4155@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Jun 27, 2014 at 01:07:47PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Fixes CVE-2014-4607.
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/lzo/lzo.mk | 4 +++-
>  >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
>  > diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
>  > index 10107fea3be3..bf85e84e9a71 100644
>  > --- a/package/lzo/lzo.mk
>  > +++ b/package/lzo/lzo.mk
>  > @@ -4,11 +4,13 @@
>  >  #
>  >  ################################################################################
>  
>  > -LZO_VERSION = 2.06
>  > +LZO_VERSION = 2.07
>  >  LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
>  >  LZO_LICENSE = GPLv2+
>  >  LZO_LICENSE_FILES = COPYING
>  >  LZO_INSTALL_STAGING = YES
>  > +# Make libtool patch apply
>  > +LZO_AUTORECONF = YES
> 
> Why? Please explain.

Otherwise libtool patching fails:

>>> lzo 2.07 Patching libtool

Applying buildroot-libtool-v2.4.patch using patch: patching file ltmain.sh
Hunk #1 FAILED at 1416.
Hunk #2 FAILED at 2962.
Hunk #3 succeeded at 7964 with fuzz 2 (offset 1281 lines).
Hunk #4 succeeded at 10554 (offset 1297 lines).
2 out of 4 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool-v2.4.patch!

Should I rephrase the comment?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
