From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:28:35 +0200
Subject: [Buildroot] [PATCH] glibc: add upstream security patches fixing
	CVE-2017-1000366 (stack clash)
In-Reply-To: <20170627064209.29481-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 27 Jun 2017 08:42:09 +0200")
References: <20170627064209.29481-1-peter@korsgaard.com>
Message-ID: <87zicrdcos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > glibc contains a vulnerability that allows specially crafted LD_LIBRARY_PATH
 > values to manipulate the heap/stack, causing them to alias, potentially
 > resulting in arbitrary code execution.  Please note that additional
 > hardening changes have been made to glibc to prevent manipulation of stack
 > and heap memory but these issues are not directly exploitable, as such they
 > have not been given a CVE.

 > https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt

 > Patches are identical to upstream, except that the ChangeLog modifications
 > have been stripped.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
