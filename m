From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:42:51 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix installation of headers
In-Reply-To: <20180702144922.15130-1-gael.portay@savoirfairelinux.com>
References: <20180702144922.15130-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180702224251.00cd9243@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jul 2018 10:49:22 -0400, Ga?l PORTAY wrote:
> Since Qt 5.11, the headers are not installed anymore.
> 
> The issue comes from a update in qt5base [1] which is not backported to
> qt5webkit because it is not officially supported anymore by Qt.
> 
> Fixes build issues with qt5webkit-examples that requires QtWebKit
> headers:
> 
> 	In file included from main.cpp:42:
> 	window.h:46:10: fatal error: QWebElement: No such file or directory
> 	 #include <QWebElement>
> 	          ^~~~~~~~~~~~~
> 	compilation terminated.
> 
> [1]: https://github.com/qt/qtbase/commit/9c4c136bc9f29bab1cc9684dfced55a92a8bbe96
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
