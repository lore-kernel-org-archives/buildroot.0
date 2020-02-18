From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 18 Feb 2020 22:33:53 +0100
Subject: [Buildroot] [PATCH v6 00/28] Qt5 qmake infra and per-package
 compatibility
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200218223353.09cdf837@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Mon, 17 Feb 2020 22:23:22 +0100, Andreas Naumann <anaumann@ultratronik.de> wrote:


> - qtwebengine locales appear in usr/translations/qtwebengine_locales/
> instead of usr/translations/qtwebengine_locales/qtwebengine_locales/

And this perfect as the qtwebengine searches for locales *.pak files
exactly under this location e.g.:

	/usr/translations/qtwebengine_locales/en-US.pak

The double path is a buildroot qt5webengine package install mistake...,
patch fixing this will follow soon...

Regards,
Peter
