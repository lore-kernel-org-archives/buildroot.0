From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2014 23:07:57 +0200
Subject: [Buildroot] [PATCH 1/5] python-pygame: Remove wildcards in
	macros
In-Reply-To: <1396979109-10691-1-git-send-email-paul@crapouillou.net> (Paul
 Cercueil's message of "Tue, 8 Apr 2014 19:45:05 +0200")
References: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
Message-ID: <87txa06ggi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 > ---
 >  package/python-pygame/python-pygame.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
 > index d9219b9..b6381a3 100644
 > --- a/package/python-pygame/python-pygame.mk
 > +++ b/package/python-pygame/python-pygame.mk
 > @@ -83,13 +83,13 @@ define PYTHON_PYGAME_CONFIGURE_CMDS
 >  endef
 
 >  define PYTHON_PYGAME_REMOVE_DOC
 > -	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
 > +	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/pygame/docs

What's the advantage of this? If pygame starts supporting python3.x then
this breaks.

-- 
Bye, Peter Korsgaard
