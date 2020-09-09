From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 9 Sep 2020 09:45:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.74.0
In-Reply-To: <20200909061618.2053427-1-fido_max@inbox.ru>
References: <20200909061618.2053427-1-fido_max@inbox.ru>
Message-ID: <e349b5f5-adbf-0fc8-fa97-531a0f5f33e0@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxim,

I was just about to submit this bump myself. So I can confirm that it
compiles fine.
Some remarks below.

On 09.09.2020 08:16, Maxim Kochetkov via buildroot wrote:
> bimap broken with C++20 GCC 10 due to allocator changes
> https://github.com/boostorg/bimap/issues/23

From the commits linked in the issue I take this issue was fixed in the
1.74.0.beta1.

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/boost/boost.hash | 4 ++--
>  package/boost/boost.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)


The 0002 patch has a slight offset change.


diff --git a/package/boost/0002-fenv.patch b/package/boost/0002-fenv.patch
index 95c769aea2..9dc7848c93 100644
--- a/package/boost/0002-fenv.patch
+++ b/package/boost/0002-fenv.patch
@@ -18,7 +18,7 @@ Index: b/boost/config/platform/linux.hpp
?===================================================================
?--- a/boost/config/platform/linux.hpp
?+++ b/boost/config/platform/linux.hpp
-@@ -47,6 +47,16 @@
+@@ -48,6 +48,16 @@
? #endif

? //

could you add that?


Regards,
Michael
