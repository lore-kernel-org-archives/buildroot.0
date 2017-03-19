From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 09:42:32 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <trinity-31a9d6e0-5836-4ca5-b1c7-2ba16255609d-1489911005153@3capp-mailcom-bs11>
References: <20170313090834.13715-1-daggs@gmx.com>
 <20170313133345.36d712f4@free-electrons.com>
 <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
 <20170314225427.390c43ce@free-electrons.com>
 <trinity-fe2675f8-6575-4221-b2c0-58c922f95d24-1489559834487@3capp-mailcom-bs10>
 <20170315091241.40a1a396@free-electrons.com>
 <trinity-01731c2c-041f-4f4a-9d1e-ab9463ddbd61-1489571560099@3capp-mailcom-bs08>
 <20170315110141.332ee46b@free-electrons.com>
 <trinity-31a9d6e0-5836-4ca5-b1c7-2ba16255609d-1489911005153@3capp-mailcom-bs11>
Message-ID: <20170319094232.4088533c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 09:10:05 +0100, daggs wrote:

> a question, does the latest gl related patch to libepoxy is relevant
> for this issue? if so, can you comment on how?

It is indeed relevant: if the egl.pc provided by odroid-mali defines
the appropriate -DMESA_EGL_NO_X11_HEADERS in its Cflags when the
non-X11 version of odroid-mali is installed.

That being said, upstream feedback
(https://github.com/anholt/libepoxy/pull/113) on Gustavo patch wasn't
entirely positive, so a different solution might be needed. But in the
mean time, a patch for odroid-mali egl.pc should resolve the issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
