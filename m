From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 15:49:15 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/linux-backports: fix kernel
 version check
In-Reply-To: <20201113130941.67928-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 13 Nov 2020 14:09:40 +0100")
References: <20201112120155.333290-1-ju.o@free.fr>
 <20201113130941.67928-1-ju.o@free.fr>
Message-ID: <87d00d73x0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f "infra/pkg-kconfig:
 > do not rely on package's .config as a timestamp" broke the kernel
 > version check of this linux-backports package (it was no longer
 > executed). Since linux-4.19, the kernel's build system internally
 > touches its .config file, so it can no longer be used as a stamp file.
 > The stamp file defined in KCONFIG_STAMP_DOTCONFIG variable of
 > pkg-kconfig infra need to be used instead.

 > This commit fixes the kernel version check.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Changes v1 -> v3:
 >   - new patch to fix kernel version check

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
