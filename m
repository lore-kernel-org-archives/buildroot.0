From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Feb 2016 11:36:14 +0100
Subject: [Buildroot] [PATCH 1/1] fix host-openssl binary installation
In-Reply-To: <CAJjDOTkbynNqt_19U_W+Nmn7iDHL9t9GuCREzo8ak6R6HaO_vg@mail.gmail.com>
 (matthew amlogic shyu's message of "Fri, 19 Feb 2016 18:33:44 +0800")
References: <1455705686-20822-1-git-send-email-matthew.shyu.amlogic@gmail.com>
 <8737sr1ise.fsf@dell.be.48ers.dk>
 <CAJjDOTnPLk-zo4+fxFtrbfUCWo+q9fcHcPE3fRQxUscXHkfjKA@mail.gmail.com>
 <87k2m1huky.fsf@dell.be.48ers.dk>
 <CAJjDOTkbynNqt_19U_W+Nmn7iDHL9t9GuCREzo8ak6R6HaO_vg@mail.gmail.com>
Message-ID: <87fuwphtr5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "matthew" == matthew amlogic shyu <matthew.shyu.amlogic@gmail.com> writes:

Hi,

 >> But we only pass INSTALL_PREFIX=$(STAGING_DIR)/usr during the
 >> make-install-to-staging step, and not when we configure/build/install
 >> the host variant:
 >> 
 >> define OPENSSL_INSTALL_STAGING_CMDS
 >> $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 >> endef
 >> 
 >> define HOST_OPENSSL_INSTALL_CMDS
 >> $(MAKE) -C $(@D) install
 >> endef
 >> 
 >> define OPENSSL_INSTALL_TARGET_CMDS
 >> $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 >> rm -rf $(TARGET_DIR)/usr/lib/ssl
 >> rm -f $(TARGET_DIR)/usr/bin/c_rehash
 >> endef
 >> 
 >> So I'm still not sure what you are trying to solve?

 > Ha, you're right!
 > I found that I have a stupid package inside my Buildroot tree that's
 > exporting INSTALL_PREFIX during the build and thus messing up my
 > environment.
 > There's nothing wrong with host-openssl package.

Ahh, that explains it ;)

> My bad. Sorry.

No problem. I've marked you patch as rejected in patchwork.

-- 
Venlig hilsen,
Peter Korsgaard 
