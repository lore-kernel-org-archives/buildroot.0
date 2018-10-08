From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 8 Oct 2018 20:39:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-07
In-Reply-To: <20181008060013.65E12207CC@mail.bootlin.com>
References: <20181008060013.65E12207CC@mail.bootlin.com>
Message-ID: <20181008203926.5aa43bde@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Oct 2018 08:00:13 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Build statistics for 2018-10-07
> ===============================
> 

[...]

> Results for branch 'master'
> ===========================

>         i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/66f55a311dcf9d54ca6148b232287973ba226999 |     
>         i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/a4759e8cea09a597dbeb82f6c673ddc531d419e8 |     

Both fail with:

.obj/qlinuxfbscreen.o: In function `QLinuxFbScreen::initialize()':
qlinuxfbscreen.cpp:(.text+0xa6c): undefined reference to `qt_open64(char const*, int, unsigned int)'
qlinuxfbscreen.cpp:(.text+0x1042): undefined reference to `qt_open64(char const*, int, unsigned int)'
qlinuxfbscreen.cpp:(.text+0x10aa): undefined reference to `qt_open64(char const*, int, unsigned int)'
qlinuxfbscreen.cpp:(.text+0x1746): undefined reference to `qt_open64(char const*, int, unsigned int)'

I suspect this qt  commit 'Linux: Bypass glibc's broken open() implementation' ([1]), which introduced
the qt_open64() function, but did not see immediately why it fails here (uclibc?)...

Regards,
Peter

[1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=1d33493989eae774bafc124f9d3ee68d7a017a10
