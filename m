From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:22:27 +0200
Subject: [Buildroot] [PATCH] strongswan: needs atomics
In-Reply-To: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408212227.615c05a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 12:32:08 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/3d1/3d13ced1b142d014c5bc098137174c4369a1e3b5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Hum, I don't quite see how this change can fix the build issue. The
build issue is on Microblaze, and Microblaze has BR2_ARCH_HAS_ATOMICS=y.

So while I agree that Strongswan is indeed using atomic intrinsics, it
isn't going to fix the issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
