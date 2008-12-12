From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Dec 2008 11:06:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
In-Reply-To: <20081212092938.291973C2E4@busybox.net> (egtvedt@uclibc.org's
	message of "Fri\, 12 Dec 2008 01\:29\:38 -0800 \(PST\)")
References: <20081212092938.291973C2E4@busybox.net>
Message-ID: <87iqppr9lp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "egtvedt" == egtvedt  <egtvedt@uclibc.org> writes:

Hi,

 egtvedt> Author: egtvedt
 egtvedt> Date: 2008-12-12 01:29:37 -0800 (Fri, 12 Dec 2008)
 egtvedt> New Revision: 24390

 egtvedt> Log:
 egtvedt> samba: make proto first to allow parallel build afterwards

 egtvedt> This patch fixes parallel build of Samba. The trick is to make proto before
 egtvedt> executing a full make.
 
 egtvedt>  $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
 egtvedt> -	$(MAKE1) -C $(SAMBA_DIR)
 egtvedt> +	$(MAKE) -C $(SAMBA_DIR) proto

Shouldn't this then be $(MAKE1) ?

 egtvedt> +	$(MAKE) -C $(SAMBA_DIR)

-- 
Bye, Peter Korsgaard
