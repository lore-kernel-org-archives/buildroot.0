From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 00:20:07 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/openpowerlink: do not
 override CMAKE_SYSTEM_PROCESSOR
In-Reply-To: <1418246696-27658-2-git-send-email-romain.naour@openwide.fr>
References: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>
 <1418246696-27658-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141211002007.48079438@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 10 Dec 2014 22:24:55 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> 
> This commit must be applied after "pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR"
> http://patchwork.ozlabs.org/patch/411789/
> 
> v2: rework the regex (Samuel Martin)
> ---
>  ...a-better-regex-for-cmake-system-processor.patch | 89 ++++++++++++++++++++++

Can you submit this upstream?


> ++ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")

I think many other values than "arm" and "armv7l" are possible.
Actually arm* indicates it's ARM.

But since this package is anyway only selectable on x86 and x86-64 in
Buildroot, I applied the patch nonetheless.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
