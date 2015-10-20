From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:18:33 +0200
Subject: [Buildroot] [PATCH 1/3] dhcpdump: add $(TARGET_MAKE_ENV) before
	$(MAKE)
In-Reply-To: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 20 Oct 2015 15:05:52 +0100")
References: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87pp09jnty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

A more detailed commit message would be good. Is this just for
consistency or does it fix anything? (E.G. does the build system execute
anything from HOST_DIR)?

> ---
 >  package/dhcpdump/dhcpdump.mk |    4 ++--
 >  1 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
 > index 6b677a6..3584f4f 100644
 > --- a/package/dhcpdump/dhcpdump.mk
 > +++ b/package/dhcpdump/dhcpdump.mk
 > @@ -16,8 +16,8 @@ DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 >  endif
 
 >  define DHCPDUMP_BUILD_CMDS
 > -	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) -D_GNU_SOURCE" \
 > -		LIBS="$(DHCPDUMP_LIBS)"
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) \
 > +		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)"
 >  endef
 
 >  define DHCPDUMP_INSTALL_TARGET_CMDS
 > -- 
 > 1.7.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
