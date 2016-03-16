From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 23:34:20 +0100
Subject: [Buildroot] [PATCH 2/4] libcap: add patch to fix build issue
 with old kernel headers
In-Reply-To: <8737rq83wg.fsf@dell.be.48ers.dk>
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <8737rq83wg.fsf@dell.be.48ers.dk>
Message-ID: <20160316233420.2b5f2d47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 16 Mar 2016 23:16:31 +0100, Peter Korsgaard wrote:

>  > Old kernels (before 2.6.36) were defining XATTR_NAME_CAPS in
>  > <linux/capability.h>, but using XATTR_SECURITY_PREFIX and
>  > XATTR_CAPS_SUFFIX which were defined in the kernel-only part of
>  > <linux/xattr.h>.
> 
> gcc10 (which uses 2.6.32 headers) has XATTR_CAPS_SUFFIX in
> linux/capability.h:
> 
> #define XATTR_CAPS_SUFFIX "capability"
> #define XATTR_NAME_CAPS XATTR_SECURITY_PREFIX XATTR_CAPS_SUFFIX

My commit log is talking about XATTR_SECURITY_PREFIX, not
XATTR_CAPS_SUFFIX.

Do you have XATTR_SECURITY_PREFIX defined ?

I do have XATTR_CAPS_SUFFIX like you, but not XATTR_SECURITY_PREFIX.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
