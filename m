From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 23:45:22 +0100
Subject: [Buildroot] [PATCH 2/2] rp-pppoe: install helper scripts
In-Reply-To: <20141203233939.1b8a856a@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 3 Dec 2014 23:39:39 +0100")
References: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
 <1417562463-26561-2-git-send-email-bluemrp9@gmail.com>
 <20141203232625.0ce7b9a5@free-electrons.com>
 <87tx1cwejb.fsf@dell.be.48ers.dk>
 <20141203233832.4499c590@free-electrons.com>
 <20141203233939.1b8a856a@free-electrons.com>
Message-ID: <87ppc0wdx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > On a second thought, we could do:

 > RP_PPPOE_TARGET_FILES = src/foo src/bar scripts/baz scripts/bleh

 > and then do:

 > 	for ff in $(RP_PPPOE_TARGET_FILES); do \
 > 		$(INSTALL) -m 0755 $(@D)/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
 > 	done

Then you whould need to strip the directory part of $$ff for the
destination to not end up in $(TARGET_DIR)/usr/sbin/src/foo.

 > Not sure it matters much, though.

I think keeping it in two loops is a bit more readable.

-- 
Venlig hilsen,
Peter Korsgaard 
