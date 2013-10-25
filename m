From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Oct 2013 09:21:12 +0200
Subject: [Buildroot] [PATCH] ebtables: install ethertypes
In-Reply-To: <1382631237-1826-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 24 Oct 2013 13:13:57 -0300")
References: <1382631237-1826-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3h17r4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It's handy and closes bug #6608.
 > Thanks to Cassiano Martin <cassiano@idbinfo.com.br> for pointing it out.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/ebtables/ebtables.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
 > index 116012c..c401f30 100644
 > --- a/package/ebtables/ebtables.mk
 > +++ b/package/ebtables/ebtables.mk
 > @@ -31,6 +31,7 @@ define EBTABLES_INSTALL_TARGET_CMDS
 >  	done
 >  	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
 >  		$(TARGET_DIR)/sbin/ebtables
 > +	cp -f $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes

I've changed this to use $(INSTALL) and committed, thanks.

-- 
Bye, Peter Korsgaard
