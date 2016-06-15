From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Wed, 15 Jun 2016 23:32:11 +0200
Subject: [Buildroot] [PATCH 2/5] readline: fix installed libraries
	permission
In-Reply-To: <87oa73v7wc.fsf@dell.be.48ers.dk>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-2-git-send-email-gilles.chanteperdrix@xenomai.org>
 <87oa73v7wc.fsf@dell.be.48ers.dk>
Message-ID: <20160615213211.GB23680@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 14, 2016 at 10:21:23PM +0200, Peter Korsgaard wrote:
> >>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:
> 
>  > In order to avoid strip failing to strip the library.
>  > Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> Thanks, but we already have logic in readline.mk to fix this:

Ok, I guess I made the original patch before you included that patch
in readline.mk.

> 
> ifneq ($(BR2_STATIC_LIBS),y)
> # libraries get installed read only, so strip fails
> define READLINE_INSTALL_FIXUPS_SHARED
> 	chmod +w $(addprefix $(TARGET_DIR)/usr/lib/,libhistory.so.* libreadline.so.*)
> endef
> READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_FIXUPS_SHARED
> endif
> 
> So why this patch instead? It would be good if we could get rid of both,
> have you tried sending it upstream?

No, and I will not.

-- 
					    Gilles.
https://click-hack.org
