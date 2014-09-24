From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 22:46:08 +0200
Subject: [Buildroot] [PATCH 0/2] docs: move website to its own sub-dir
	(branch yem/website)
Message-ID: <cover.1411591300.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series moves the website to its own sub-dir, so it is not mixed
with the rest of the documentation, especially the manual.

It will allow to reorganise the locations where we store manual-related
configuration files, in my gendoc/asciidoc series.

The first patch can be applied right now, and is just a temporary
kludge that has no impact, except makign the website available both in
the current location, and the new one.

This means the website won't be impacted, and we can switch the deploy
scripts to use the new location.

Once the scripts have been updated, the second patch does the actual
move, and the website is only available from the new location.

Regards,
Yann E. MORIN.


The following changes since commit 2b8937f238a3593c9267a68e0fdad83841a56657:

  nitrogen6x_defconfig: bump linux kernel (2014-09-24 10:15:25 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/website

for you to fetch changes up to e3175e7a9fa2832f59ba0efecc786457a01e92d8:

  docs: really move the website (2014-09-24 22:39:14 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      docs: prepare mmoving the website
      docs: really move the website

 docs/images                                              |   1 +
 docs/{ => website}/about.html                            |   0
 docs/{ => website}/contribute.html                       |   0
 docs/{ => website}/copyright.txt                         |   0
 docs/{ => website}/css/bootstrap-responsive.css          |   0
 docs/{ => website}/css/bootstrap-responsive.min.css      |   0
 docs/{ => website}/css/bootstrap.css                     |   0
 docs/{ => website}/css/bootstrap.min.css                 |   0
 docs/{ => website}/css/bootswatch.less                   |   0
 docs/{ => website}/css/buildroot.css                     |   0
 docs/{ => website}/css/variables.less                    |   0
 docs/{ => website}/docs.html                             |   0
 docs/{ => website}/download.html                         |   0
 docs/{ => website}/favicon.ico                           | Bin
 docs/{ => website}/footer.html                           |   0
 docs/{ => website}/git.html                              |   0
 docs/{ => website}/header.html                           |   0
 docs/{ => website}/images/boundary-devices-logo.png      | Bin
 docs/{ => website}/images/calao-logo.png                 | Bin
 docs/{ => website}/images/circuitco-logo.png             | Bin
 docs/{ => website}/images/fluendo-logo.png               | Bin
 docs/{ => website}/images/free-electrons-logo.png        | Bin
 docs/{ => website}/images/glyphicons-halflings-white.png | Bin
 docs/{ => website}/images/glyphicons-halflings.png       | Bin
 docs/{ => website}/images/google-logo.png                | Bin
 docs/{ => website}/images/gplus.png                      | Bin
 docs/{ => website}/images/imgtec-logo.png                | Bin
 docs/{ => website}/images/logo.png                       | Bin
 docs/{ => website}/images/logo.xcf                       | Bin
 docs/{ => website}/images/logo_small.png                 | Bin
 docs/{ => website}/images/menuconfig.png                 | Bin
 docs/{ => website}/images/menuconfig_small.png           | Bin
 docs/{ => website}/images/mind-logo.png                  | Bin
 docs/{ => website}/images/synopsys-logo.png              | Bin
 docs/{ => website}/images/valid-html401.png              | Bin
 docs/{ => website}/index.html                            |   0
 docs/{ => website}/js/bootstrap.js                       |   0
 docs/{ => website}/js/bootstrap.min.js                   |   0
 docs/{ => website}/js/buildroot.js                       |   0
 docs/{ => website}/js/jquery-1.10.2.min.js               |   0
 docs/{ => website}/news.html                             |   0
 docs/{ => website}/robots.txt                            |   0
 docs/{ => website}/sponsors.html                         |   0
 docs/{ => website}/support.html                          |   0
 44 files changed, 1 insertion(+)
 create mode 120000 docs/images
 rename docs/{ => website}/about.html (100%)
 rename docs/{ => website}/contribute.html (100%)
 rename docs/{ => website}/copyright.txt (100%)
 rename docs/{ => website}/css/bootstrap-responsive.css (100%)
 rename docs/{ => website}/css/bootstrap-responsive.min.css (100%)
 rename docs/{ => website}/css/bootstrap.css (100%)
 rename docs/{ => website}/css/bootstrap.min.css (100%)
 rename docs/{ => website}/css/bootswatch.less (100%)
 rename docs/{ => website}/css/buildroot.css (100%)
 rename docs/{ => website}/css/variables.less (100%)
 rename docs/{ => website}/docs.html (100%)
 rename docs/{ => website}/download.html (100%)
 rename docs/{ => website}/favicon.ico (100%)
 rename docs/{ => website}/footer.html (100%)
 rename docs/{ => website}/git.html (100%)
 rename docs/{ => website}/header.html (100%)
 rename docs/{ => website}/images/boundary-devices-logo.png (100%)
 rename docs/{ => website}/images/calao-logo.png (100%)
 rename docs/{ => website}/images/circuitco-logo.png (100%)
 rename docs/{ => website}/images/fluendo-logo.png (100%)
 rename docs/{ => website}/images/free-electrons-logo.png (100%)
 rename docs/{ => website}/images/glyphicons-halflings-white.png (100%)
 rename docs/{ => website}/images/glyphicons-halflings.png (100%)
 rename docs/{ => website}/images/google-logo.png (100%)
 rename docs/{ => website}/images/gplus.png (100%)
 rename docs/{ => website}/images/imgtec-logo.png (100%)
 rename docs/{ => website}/images/logo.png (100%)
 rename docs/{ => website}/images/logo.xcf (100%)
 rename docs/{ => website}/images/logo_small.png (100%)
 rename docs/{ => website}/images/menuconfig.png (100%)
 rename docs/{ => website}/images/menuconfig_small.png (100%)
 rename docs/{ => website}/images/mind-logo.png (100%)
 rename docs/{ => website}/images/synopsys-logo.png (100%)
 rename docs/{ => website}/images/valid-html401.png (100%)
 rename docs/{ => website}/index.html (100%)
 rename docs/{ => website}/js/bootstrap.js (100%)
 rename docs/{ => website}/js/bootstrap.min.js (100%)
 rename docs/{ => website}/js/buildroot.js (100%)
 rename docs/{ => website}/js/jquery-1.10.2.min.js (100%)
 rename docs/{ => website}/news.html (100%)
 rename docs/{ => website}/robots.txt (100%)
 rename docs/{ => website}/sponsors.html (100%)
 rename docs/{ => website}/support.html (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
