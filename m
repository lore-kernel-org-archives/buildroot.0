From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 17:14:32 +0100
Subject: [Buildroot] [PATCH] package/skeleton: remove legacy mkdir
In-Reply-To: <1483477263-15610-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 3 Jan 2017 22:01:03 +0100")
References: <1483477263-15610-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fuky245z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We've had this mkdir, in various forms, for aeons. It dates back to
 > the inception of Buildroot, at the dawn of ages, when the toolchain
 > support was still nascent. Evolution had it morph from /include, to
 > a tuple-prefixed directory and a symlink there-to, then back to the
 > /include directory, to the final /usr/include directory we've had
 > for the last 9 years.

 > Anything that wants to install headers is supposed to be creating
 > that directory beforehand; we don't need this legacy mkdir now.

But how is that different from the {lib,bin,sbin} directories we also
create?

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > OK, we can keep it, just for nostalgia; I just felt like writing some
 > prose tonight. ;-)
 > ---
 >  package/skeleton/skeleton.mk | 1 -
 >  1 file changed, 1 deletion(-)

 > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
 > index 1000161..e65ef61 100644
 > --- a/package/skeleton/skeleton.mk
 > +++ b/package/skeleton/skeleton.mk
 > @@ -107,7 +107,6 @@ define SKELETON_INSTALL_STAGING_CMDS
 >  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
 >  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
 >  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
 > -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 >  	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
 >  	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
 >  	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
