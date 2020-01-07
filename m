From: Mehmet Sami Tok <mehmetsamitok@gmail.com>
Date: Tue,  7 Jan 2020 15:32:08 +0300
Subject: [Buildroot] [PATCH 0/1] remove optimize by default while using qmake
Message-ID: <20200107123209.6608-1-mehmetsamitok@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building qt projects with debug configuration on a host computer,
applications build with optimization even if not configured to.

Optimization flags in TARGET_CFLAGS are passed as default build
arguments of qt build commands. If they are not overriden or removed
manually from build arguments, any project build with optimization
level of root file system by default.

So I filtered optimization flags which are passed to "config.opt"
first, then made into "mkspecs/qdevice.pri".

Signed-off-by: Mehmet Sami TOK <mehmetsamitok@gmail.com>

Mehmet Sami Tok (1):
  package/qt5: remove optimize by default on debug builds made with
    qmake

 package/qt5/qt5base/qt5base.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.17.1
