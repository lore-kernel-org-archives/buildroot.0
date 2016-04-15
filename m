From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:42:23 +0200
Subject: [Buildroot] [PATCH] qt: fix static linking
In-Reply-To: <1460703285-3235-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460703285-3235-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160415094223.204be26f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 08:54:45 +0200, J?rg Krause wrote:
> `-ldl` option is used unconditionally in `QMAKE_LIBS_DYNLOAD` while libdl is
> not supported when libc is static. As the value of `QMAKE_LIBS_DYNLOAD` goes
> into 'Libs.private' field of the pkgconfig files created by qmake, static
> linking with qt will fail with:
>   /usr/bin/ld: cannot find -ldl
> 
> Fix this issue by adding a build test to configure to check if libdl is
> supported. `QMAKE_LIBS_DYNLOAD` in "src/corelib/plugin/plugin.pri" is now used
> only if libdl is available.
> 
> Fixes:
> http://autobuild.buildroot.net/results/459/4596b9c69cbc387f1071c730aaac76723afaa853/
> http://autobuild.buildroot.net/results/459/4596b9c69cbc387f1071c730aaac76723afaa853/
> 
> Backported from Qt5:
> https://github.com/qtproject/qtbase/commit/f669ea0d54302de31456d57286aa0e4ca1443e98
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...with-ldl-option-only-when-it-is-supported.patch | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 package/qt/0011-Link-with-ldl-option-only-when-it-is-supported.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
