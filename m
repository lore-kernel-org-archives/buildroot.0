From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Dec 2018 00:37:40 +0200
Subject: [Buildroot] [PATCH 0/2] package: pkg-autotools: New $(PKG)_AUTOGEN
 variable
Message-ID: <20181223223742.23710-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add possibility to automatically call autogen.sh by setting $(PKG)_AUTOGEN = YES
variable. This will simplify a bit packages which should call autogen.sh to generate
'configure' script.

Vadim Kochan (2):
  package: pkg-autotools: Add option to run autogen.sh
  package: Use $(PKG)_AUTOGEN instead of calling autogen.sh manually

 docs/manual/adding-packages-autotools.txt |  4 ++++
 package/faifa/faifa.mk                    | 10 +---------
 package/gpm/gpm.mk                        |  8 +-------
 package/pkg-autotools.mk                  | 20 ++++++++++++++++++++
 package/sdl/sdl.mk                        | 10 +---------
 5 files changed, 27 insertions(+), 25 deletions(-)

-- 
2.14.1
