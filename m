From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Mar 2016 11:14:19 +0200
Subject: [Buildroot] [PATCH] linknx: fix static build with mysql client
In-Reply-To: <87io0m6dbj.fsf@dell.be.48ers.dk>
References: <672e8ac38f0595514d34b0fd06ef32e6c6e7697c.1458047028.git.baruch@tkos.co.il>
 <87io0m6dbj.fsf@dell.be.48ers.dk>
Message-ID: <20160316091419.GT5528@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Mar 16, 2016 at 09:23:44AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Add a patch correcting the libraries order in the link command to fix static
>  > mysql libraries link.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/2df/2dfcbd30079d13997de37e2d1c4643653e200be6/
>  > http://autobuild.buildroot.net/results/4cc/4cc9c8bd223d1c9d604322ba04060dd35fc8aa45/
>  > http://autobuild.buildroot.net/results/4bd/4bd04b7a3ca0092b50ad5c5212830d8935f54d48/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> This unfortunately causes some new build issues:
> 
> http://autobuild.buildroot.net/?reason=linknx-0.0.1.32
> 
> It looks like something is missing from the autoreconf:
> 
> ./configure: line 5623: syntax error near unexpected token `yes,'
> ./configure: line 5623: `LIBCURL_CHECK_CONFIG(yes, 7.14.0)'
> 
> Care to take a look?

It fails for me here even earlier:

configure.ac:33: error: possibly undefined macro: AC_DEFINE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:88: error: possibly undefined macro: AC_MSG_RESULT
configure.ac:114: error: possibly undefined macro: AC_SUBST

I wonder how it worked before. I'll look into it later.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
