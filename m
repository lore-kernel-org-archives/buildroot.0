From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 May 2017 15:29:28 +0200
Subject: [Buildroot] [PATCH] toolchain: limit musl workaround to kernel
	headers 3.12+
In-Reply-To: <9f5573bb9c8401ad32d34c22c69e062e14b834de.1495167637.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 19 May 2017 07:20:37 +0300")
References: <9f5573bb9c8401ad32d34c22c69e062e14b834de.1495167637.git.baruch@tkos.co.il>
Message-ID: <87a8692cw7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The libc-compat.h first appeared in kernel version 3.12. Trying to build a
 > musl toolchain using earlier headers leads to the following failure:

 > /bin/sed: can't read .../output/host/usr/arm-buildroot-linux-musleabi/sysroot/usr/include/linux/libc-compat.h: No such file or directory
 > package/pkg-generic.mk:266: recipe for target '.../output/build/toolchain/.stamp_staging_installed' failed

 > Don't apply the sed patch to older headers.

 > Reported-by: Florent Jacquet <florent.jacquet@free-electrons.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
