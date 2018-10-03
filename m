From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Oct 2018 09:47:22 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: tweak thread activation
In-Reply-To: <20181002192858.986-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 2 Oct 2018 21:28:58 +0200")
References: <20181002192858.986-1-fontaine.fabrice@gmail.com>
Message-ID: <87y3bfxyid.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > If threads are enabled, as described in include/common/hathreads.h,
 > haproxy uses __sync_*_4 intrisics if gcc < 4.7. Otherwise, haproxy
 > uses __atomic_ intrinsics.

 > As a result, instead of adding a dependency on BR2_TOOLCHAIN_HAS_SYNC_4
 > and BR2_TOOLCHAIN_HAS_ATOMIC in Config.in, enable threads only if the
 > dependencies are fulfilled in haproxy.mk

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7f24873ecdd9246c95c03bb8d2fcd4c16c488c6c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
