From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 09:48:25 +0100
Subject: [Buildroot] [PATCH] dnsmasq: create runtime directory
In-Reply-To: <1322822951-31492-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Fri, 2 Dec 2011 11:49:11 +0100")
References: <1322822951-31492-1-git-send-email-zonque@gmail.com>
Message-ID: <8739cyrspy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> $(TARGET_DIR)/var/lib/misc/ is the location where dnsmasq stores its
 Daniel> lease files. Create it to make the daemon work.

Committed, thanks. We should probably make /var/lib/misc a symlink to
/tmp for the default fs skeleton so stuff like this works with readonly
fs, but your patch doesn't hurt.

-- 
Bye, Peter Korsgaard
