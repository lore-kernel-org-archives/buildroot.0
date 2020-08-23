From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 23:28:46 +0200
Subject: [Buildroot] [PATCH] package/qt5: needs host gcc >= 5.0 for full
 C++11
In-Reply-To: <20200823173352.17610-1-yann.morin.1998@free.fr>
References: <20200823173352.17610-1-yann.morin.1998@free.fr>
Message-ID: <20200823232846.67c6847b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Aug 2020 19:33:52 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Building qmake requires full C++11, which boils down to gcc >= 5.0,
> which is what upstream advertises as a requirement anyway:
> 
>     https://doc.qt.io/qt-5.15/supported-platforms.html
> 
>     Distribution   | Architecture     | Compiler
>     Generic Linux  | x86 and x86_64   | GCC (5 or later), ICC 18.x
> 
> Fixes:
>     http://autobuild.buildroot.org/results/c3e/c3ee971a72f268e72b69a647e8fd00a8cee7dc91/
>     http://autobuild.buildroot.org/results/89c/89c9a88b4e1195e952528574263201d4fbc27570/
>     [...]
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>

Thanks for doing this. You had forgotten to update the Config.in
comments in pinentry and wireshark, so I did that when applying to
master.

Long term, I don't think those pinentry and wireshark options should
select the Qt5 package, it should probably "depends on" it. I believe
if you want the wireshark Qt GUI, it's pretty obvious that you need Qt.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
