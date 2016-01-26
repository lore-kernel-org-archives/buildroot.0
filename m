From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Jan 2016 22:48:17 +0100
Subject: [Buildroot] [PATCH] bind: rename ptrsize to ptr_size in the code
In-Reply-To: <1453462861-32484-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Jan 2016 08:41:01 -0300")
References: <1453462861-32484-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877fiwqafy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > uClibc in commit 70a04a28 #defined ptrsize globally in bits/setjmp.h for
 > mips. However this is a common variable name and causes build failure
 > for at least bind.
 > So rename ptrsize to ptr_size in bind to avoid this. Fixes:
 > http://autobuild.buildroot.net/results/a92/a92fa5dc5d9d6742d61d4d293f7eac97c5355dfe/

:/

Committed, thanks.

What bind version is this patch against? It applies both before and
after the security bump, both with an offset:

Applying 0003-Rename-ptrsize-to-ptr_size.patch using patch: 
patching file lib/dns/rbt.c
Hunk #2 succeeded at 480 (offset -37 lines).
Hunk #3 succeeded at 865 (offset -37 lines).
patching file lib/dns/rbtdb.c
Hunk #2 succeeded at 7536 (offset -57 lines).

-- 
Bye, Peter Korsgaard
