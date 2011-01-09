From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jan 2011 15:08:42 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTi=czJUTrjfhvtyb2mZ5yO=xqQo80OD8ShbXP0SH@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf>
	<AANLkTi=czJUTrjfhvtyb2mZ5yO=xqQo80OD8ShbXP0SH@mail.gmail.com>
Message-ID: <20110109150842.549f5925@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Jan 2011 13:52:48 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> I assume that CMAKE_PROGRAM_PATH is needed so CMake can
> find (at least) moc and/or qmake?

Yes, exactly.

> But after a git pull + build moc
> and qmake are not in HOST_DIR/usr/bin:
> 
> $ find -type f -name moc -o -name qmake
> ./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/moc
> ./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/qmake
> [snip matches from ./output/build/qt-everywhere-opensource-src-4.7.1]

Yes, this is a mistake in the current qt package. It should install
those host tools to $(HOST_DIR)/usr/bin. I have a patch here that fixes
this, I need to clean it up and send it (I just did it on Friday, I
didn't had the time to send it yet).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
