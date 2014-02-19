From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 16:12:15 +0100
Subject: [Buildroot] [PATCH v7 1/4] sdl: add host version
In-Reply-To: <1392680233-24585-2-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Tue, 18 Feb 2014 00:37:10 +0100")
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <878ut716i8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Host version is needed to build xbmc
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v6 -> v7:
 >   - Add one empty line for clarity
 > Changes v5 -> v6:
 >   - None
 > Changes v4 -> v5:
 >   - None
 > Changes v3 -> v4:
 >   - None
 > Changes v2 -> v3:
 >   - None
 > Changes v1 -> v2:
 >   - None
 > ---
 >  package/sdl/sdl.mk | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
 > index ba5fbca..bc48d35 100644
 > --- a/package/sdl/sdl.mk
 > +++ b/package/sdl/sdl.mk
 > @@ -18,8 +18,9 @@ define SDL_RUN_AUTOGEN
 >  endef
 
 >  SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
 > -SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 > +HOST_SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
 
Committed to next with this fixed up to use PRE_CONFIGURE_HOOKS instead,
thanks.

-- 
Bye, Peter Korsgaard
