From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 12:09:11 +0200
Subject: [Buildroot] [PATCH v3 03/10] musl: build broken on Thumb,
	use ARM mode
In-Reply-To: <1459450815-6494-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 31 Mar 2016 21:00:08 +0200")
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r3egpg3c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Building the musl C library on Thumb (Thumb1, not Thumb2), fails with:
 >  {standard input}:20: Error: only lo regs allowed with immediate -- `mov fp,#0'
 >  {standard input}:21: Error: only lo regs allowed with immediate -- `mov lr,#0'
 >  {standard input}:25: Error: unshifted register required -- `and ip,a1,#-16'

 > Since there are no cores that we support that are Thumb1 only, use the
 > same solution as the one used by glibc: build the C library in ARM
 > mode.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
