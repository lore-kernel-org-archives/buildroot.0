From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Nov 2011 12:31:59 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: fix ct-ng as external rsync
	issues
In-Reply-To: <1318522731-29400-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 13 Oct 2011 13:18:51 -0300")
References: <1318522731-29400-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lirylpzk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> When using a CT-NG toolchain as external toolchain (not with
 Gustavo> the integration) and said toolchain has u-w directories rsync
 Gustavo> fails.  So instruct rsync to chmod u+w directories in the
 Gustavo> target copy to avoid the issue.

This is actually a workaround for a bug in rsync 3.0.8 (earlier/later
versions not affected), but it seems safe to add - So committed, thanks.

-- 
Bye, Peter Korsgaard
