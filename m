From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 May 2011 15:53:40 +0200
Subject: [Buildroot] [PATCH 1/1] qt: scripttools needs gui
In-Reply-To: <d8244392bcde50c998813d693d8985d1c8fd60b1.1306054416.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 22 May 2011 10:53:40 +0200")
References: <cover.1306054416.git.thomas.petazzoni@free-electrons.com>
	<cover.1306054416.git.thomas.petazzoni@free-electrons.com>
	<d8244392bcde50c998813d693d8985d1c8fd60b1.1306054416.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874o4m4za3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The QtScriptTools library depends on the QtGui library, as can be seen
 Thomas> in the src/src.pro file of the Qt sources :

 Thomas> !contains(QT_CONFIG, no-gui):contains(QT_CONFIG, scripttools): SRC_SUBDIRS += src_scripttools

 Thomas> If the scripttools are enabled in the Qt configuration, but not the
 Thomas> gui, then the scripttools library is not built by Qt, and the
 Thomas> Buildroot build process fails with:

 Thomas> cp: cannot stat `/home/test/outputs/test-502/host/usr/sh4-unknown-linux-gnu/sysroot/usr/lib/libQtScriptTools.so.*': No such file or directory

Committed, thanks. I hit this issue with a build earlier today as well.

-- 
Bye, Peter Korsgaard
