From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 09:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/qextserialport: remove the
	default value of the _INSTALL_STAGING variable
In-Reply-To: <1483717318-15930-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Fri, 6 Jan 2017 16:41:58 +0100")
References: <1483717318-15930-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87h958pqbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > ---
 >  package/qextserialport/qextserialport.mk | 4 +---
 >  1 file changed, 1 insertion(+), 3 deletions(-)

 > diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
 > index 1100946..44ed6a3 100644
 > --- a/package/qextserialport/qextserialport.mk
 > +++ b/package/qextserialport/qextserialport.mk
 > @@ -34,9 +34,7 @@ define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 >  endef
 
 > -ifeq ($(BR2_STATIC_LIBS),y)
 > -QEXTSERIALPORT_INSTALL_STAGING = NO
 > -else
 > +ifeq ($(BR2_STATIC_LIBS),)
 >  define QEXTSERIALPORT_INSTALL_TARGET_CMDS
 >  	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
 >  endef

I believe this was just a typo and Arnout instead wanted to do
QEXTSERIALPORT_INSTALL_TARGET = NO. We haven't noticed as it is purely
cosmetical (as  QEXTSERIALPORT_INSTALL_TARGET_CMDS only gets defined for
!static).

I have instead pushed a commit changing it to
QEXTSERIALPORT_INSTALL_TARGET, thanks.

-- 
Bye, Peter Korsgaard
