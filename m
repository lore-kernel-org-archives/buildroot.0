From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Oct 2015 10:24:46 +0200
Subject: [Buildroot] [PATCH 1/1] feh: install in /usr
In-Reply-To: <87io5yk2aq.fsf@dell.be.48ers.dk>
References: <1445540750-4312-1-git-send-email-james.knight@rockwellcollins.com>
 <87io5yk2aq.fsf@dell.be.48ers.dk>
Message-ID: <20151023102446.5004cafe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

Your e-mail below as a reply to James is empty. I guess you wanted to
say that you applied the patch, since it's visible at
http://git.buildroot.net/buildroot/commit/?id=948e4837d32e7c708427864551090ee1935ea0ef.

Best regards,

Thomas

On Thu, 22 Oct 2015 23:42:53 +0200, Peter Korsgaard wrote:
> >>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:
> 
>  > By default, feh installs into /usr/local. Adjusting the prefix to point
>  > to a system distribution path.
> 
>  > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> 
> 
> > ---
>  >  package/feh/feh.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/package/feh/feh.mk b/package/feh/feh.mk
>  > index 03435dc..7381e25 100644
>  > --- a/package/feh/feh.mk
>  > +++ b/package/feh/feh.mk
>  > @@ -18,7 +18,7 @@ endef
>  
>  >  define FEH_INSTALL_TARGET_CMDS
>  >  	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
>  > -		DESTDIR=$(TARGET_DIR) -C $(@D) install
>  > +		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
>  >  endef
>  
>  >  $(eval $(generic-package))
>  > -- 
>  > 1.9.5.msysgit.1
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
