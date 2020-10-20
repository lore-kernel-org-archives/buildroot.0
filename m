From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 20 Oct 2020 18:43:19 +0300
Subject: [Buildroot] [PATCH 0/2] package/wpewebkit: build fixes for CPUs
 which need CLoop
Message-ID: <20201020154321.3491904-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Recently it has come to my attention that the JavaScriptCore JIT support for
ARMv5 and ARMv6 has biytrotted and has not received fixes lately, due to a
bug reported [1] against Cog.

This patch set fixes the build with ENABLE_C_LOOP set, and adds both ARMv5
and ARMv6 to the list of target CPUs that need to use it.

Cheers,
?Adri?n

---
[1] https://github.com/Igalia/cog/issues/210


Adrian Perez de Castro (2):
  package/wpewebkit: fix build with ENABLE_C_LOOP=ON
  package/wpewebkit: disable JIT for ARMv5 and ARMv6

 package/wpewebkit/wpewebkit.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.28.0
