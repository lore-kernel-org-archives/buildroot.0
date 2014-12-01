From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:42:47 +0100
Subject: [Buildroot] [PATCHv3 07/74] portmap: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:17:55 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4qrdp2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > We also switch to using a full destination path as the second argument
 > of $(INSTALL).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/portmap/portmap.mk | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
 > index 0189597..dd60809 100644
 > --- a/package/portmap/portmap.mk
 > +++ b/package/portmap/portmap.mk
 > @@ -30,8 +30,10 @@ define PORTMAP_INSTALL_TARGET_CMDS
 >  		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
 >  	$(INSTALL) -D $(@D)/pmap_set.8 \
 >  		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
 > -	$(INSTALL) -m 0755 package/portmap/S13portmap \
 > -		$(TARGET_DIR)/etc/init.d
 > +endef
 > +
 > +define PORTMAP_INSTALL_INIT_SYSV
 > +	$(INSTALL) -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d/S13portmap
 >  endef

Committed with the -D option added, thanks.

-- 
Bye, Peter Korsgaard
