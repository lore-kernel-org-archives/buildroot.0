From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jul 2011 10:10:01 +0300
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
	options
In-Reply-To: <87y5zmuauq.fsf@macbook.be.48ers.dk>
References: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
 <87y5zmuauq.fsf@macbook.be.48ers.dk>
Message-ID: <20110725071001.GA13998@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jul 25, 2011 at 08:34:53AM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>  Baruch> Allow the user to specify additional options for the target
>  Baruch> LDFLAGS.  I use this to pass the -te500v2 option to the linker,
>  Baruch> when using the CodeSourcery toolchain for PowerPC. This chooses
>  Baruch> the correct CRT for e500 hard float. Otherwise I get errors
>  Baruch> like
> 
> Committed, thanks.
> 
> What tree did you create this patch against? package/Makefile.in hasn't
> looked like that since April, so I had to apply the patch manually.

I mistakenly based this patch on version 2010.11.

Actually, since I use an external toolchain, the patch of Matias Garcia 
(http://lists.busybox.net/pipermail/buildroot/2011-July/043944.html, not 
merged yet) solves the -te500v2 problem for me without this patch, so I've 
dropped it locally.

>  Baruch> ---
>  Baruch>  package/Makefile.in           |    2 +-
>  Baruch>  toolchain/toolchain-common.in |    5 +++++
>  Baruch>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
>  Baruch> diff --git a/package/Makefile.in b/package/Makefile.in
>  Baruch> index 2ca8c31..a6cee06 100644
>  Baruch> --- a/package/Makefile.in
>  Baruch> +++ b/package/Makefile.in
>  Baruch> @@ -81,7 +81,7 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  Baruch>  TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
>  Baruch>  endif
>  
>  Baruch> -TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
>  Baruch> +TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib $(BR2_TARGET_LDFLAGS)
> 
> You need to use qstrip as otherwise all the flags will be handled as a
> single argument.

Ah, something new learnt. Thanks for noticing and fixing, and thanks again for 
your great work.

(Back to my cross Poco C++ build attempts)

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
