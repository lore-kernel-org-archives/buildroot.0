From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 23:16:31 +0100
Subject: [Buildroot] [PATCH 2/4] libcap: add patch to fix build issue
	with old kernel headers
In-Reply-To: <1458159611-5613-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 16 Mar 2016 21:20:09 +0100")
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8737rq83wg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Old kernels (before 2.6.36) were defining XATTR_NAME_CAPS in
 > <linux/capability.h>, but using XATTR_SECURITY_PREFIX and
 > XATTR_CAPS_SUFFIX which were defined in the kernel-only part of
 > <linux/xattr.h>.

gcc10 (which uses 2.6.32 headers) has XATTR_CAPS_SUFFIX in
linux/capability.h:

#define XATTR_CAPS_SUFFIX "capability"
#define XATTR_NAME_CAPS XATTR_SECURITY_PREFIX XATTR_CAPS_SUFFIX

So this doesn't seem 100% correct, but the fix looks fine to me - So
committed, thanks!

-- 
Bye, Peter Korsgaard
