From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 09:08:28 +0200
Subject: [Buildroot] [PATCH 18/23] Remove BR2_HAVE_DEVFILES
In-Reply-To: <1372620553-11416-19-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:08 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-19-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppuyn6oj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This finally removes the BR2_HAVE_DEVFILES option, that was used to
 Thomas> install/keep development files on target. With the recent migration of
 Thomas> the internal backend to the package infrastructure, we had anyway lost
 Thomas> the ability to build gcc for the target, and install the uClibc
 Thomas> development files on the target.

 
 Thomas>  target-finalize:
 Thomas> -ifeq ($(BR2_HAVE_DEVFILES),y)
 Thomas> -	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )

We can also get rid of this script completely now. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
