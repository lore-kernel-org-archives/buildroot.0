From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 23:30:13 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/qt5: bump latest version to
 5.9.1
In-Reply-To: <1499962724-536-1-git-send-email-joshua.henderson@microchip.com>
References: <1499962724-536-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20170719233013.43e0d27b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 09:18:43 -0700, Joshua Henderson wrote:
> Qt 5.9 is a Long Term Support version [1]. Some license file changes are
> involved, a new dependency on pcre2, and some filename changes.  qt5webkit
> popped back into the picture for 5.9.1 after being absent for 5.9.0
> "officially." QT5_SNAPSHOTS_SITE is removed with this commit as it is not used
> for qtwebkit anymore.
> 
> This removes the following patches that have been upstreamed for 5.9.1:
> 
> - qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch [2]
> - qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch [3]
> - qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch [4]
> - qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch [5]
> - qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch [6]
> - qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch [7]
> 
> [1] https://www.qt.io/qt5-9/
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
> [3] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
> [4] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=5cc0de2e084cb887a75b076b82cf470ecdcd4dd3
> [5] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e9a7739e77f79baeb5452189b6d17e63de5b341d
> [6] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=18d49808db46add078d9d4bcffaac5361d5c7269
> [7] https://code.qt.io/cgit/qt/qtwebkit.git/commit/?id=548380af096f8277e460383c81a4ecdf2b77523f
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Brent Sink <brents_3@hotmail.com>
> Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
> 
> ---

I've applied to master. I just changed two things:

 - The remaining qt5base patch was still number 0005-<something>, so I
   renamed it to 0001-<something>.

 - It was a bit odd to have one qt5webkit patch in the 5.6.2/ subdir,
   and the two other patches outside of the per-version directory.
   Instead, I've duplicated the patches, so that it's clear what is
   going on for 5.6.2/ and 5.9.1/.

It would be nice if you could keep an eye on
http://autobuild.buildroot.org over the next days and see if there's
any failure Qt5 related. It can happen in one of the qt5 packages
themselves, but also in other packages using qt5.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
