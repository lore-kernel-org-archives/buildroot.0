From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:54:59 +0200
Subject: [Buildroot] [PATCH 4/6] gutenprint: ensure target and host
	variant have the same patch hooks
In-Reply-To: <1369695664-5670-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 01:01:02 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874ndkz1ik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In preparation for the out-of-tree support, it is important that all
 Thomas> packages have the same patch hooks for the host variant and the target
 Thomas> variant (because the source tree will be shared between host and
 Thomas> target variants when doing out-of-tree build).

 Thomas> In the case of gutenprint, the patch hook executed for the target just
 Thomas> creates one directory which is needed for autoreconf to work, and the
 Thomas> host variant is not autoreconf'ed. So there is no harm in also
 Thomas> applying this patch hook to the host variant.

Committed to next with HOST_GUTENPRINT_AUTORECONF = YES as pointed out
by Arnout, thanks.

-- 
Bye, Peter Korsgaard
