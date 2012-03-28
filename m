From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Mar 2012 08:28:57 +0200
Subject: [Buildroot] [PATCH 1/2] microperl: fix
	MICROPERL_INSTALL_TARGET_CMDS
In-Reply-To: <38a56718290b5bc37564e53fa9a6c06271024ce4.1332831974.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 27 Mar 2012 09:06:17 +0200")
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <38a56718290b5bc37564e53fa9a6c06271024ce4.1332831974.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k425b5na.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The MICROPERL_INSTALL_TARGET_CMDS used the following construct in a
 Thomas> for loop:

 Thomas> 		[ -d $(@D)/lib/$$j ] && cp -af $(@D)/lib/$$j \
 Thomas> 			$(TARGET_DIR)/$(MICROPERL_MODS_DIR) ; \
 Thomas> 		[ -f $(@D)/lib/$$i ] && $(INSTALL) -m 0644 -D $(@D)/lib/$$i \
 Thomas> 			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \

Committed, thanks.

-- 
Bye, Peter Korsgaard
