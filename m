From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 23:28:11 +0200
Subject: [Buildroot] [PATCH 0/2] gst-fsl-plugins: requires kernel headers <=
	3.10 (branch yem/quickies)
Message-ID: <cover.1406323367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by Gary, gst-fsl-plugins use part of the v4l2 API that was
removed in linux 3.11, so it should not be made available for toolchains
with kernel headers >= 3.11, but only for headers <= 3.10.

The first patch enhances the manual, explicitly stating that the
_AT_LEAST_X_Y dependencies can be used both ways, either to require at
least a specific version, or to require@most a specific version. or
even both (e.g.: 3.2 <= version <= 3.11 .)

The second patch adds the headers version dependency to gst-fsl-plugins.

Regards,
Yann E. MORIN.


The following changes since commit 5af28fe6a10976eee7d9e9006baa90543d6dd025:

  pkg-autotools: add support for <pkg>_AUTORECONF_ENV (2014-07-23 23:49:10 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/quickies

for you to fetch changes up to 09b3dee632b2855fe6517fbdbde2ac9d8a98dbbc:

  package/gst-fsl-plugins: not available for kernel headers >= 3.11 (2014-07-25 23:20:27 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      docs/manual: enhance doc for BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y
      package/gst-fsl-plugins: not available for kernel headers >= 3.11

 docs/manual/adding-packages-directory.txt   | 4 ++--
 package/gstreamer/gst-fsl-plugins/Config.in | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
