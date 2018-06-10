From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 17:44:55 +0200
Subject: [Buildroot] [PATCH 0/2 v3] support/docker: make the image more
 reproducible
Message-ID: <cover.1528645489.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, the base test image is not entirely reproducible, because we
install packages from PyPI without specifying all the versions of all
the packages we install from there.

Instead of relying on a third-party to provide packages, just use those
from the distribution, because we are using a pinned version and thus
we will always get the same packages from the distro.

If/when this series is applied, I'll regenerate and updalod the new
buildroot/base image, and send a furhter patch to use it from our
gitlab-ci.yml.


Regards,
Yann E. MORIN.


The following changes since commit 12b70acb82acfa4925a8436a31a668ac92a58d1d

  mender: fix check-package warnings (2018-06-10 16:43:53 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 720ecb41c6c51f66f6b4dda7663c1e16edb2fabb

  support/docker: use the distro-provided flake8 (2018-06-10 17:41:00 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/docker: sort the list of installed packages
      support/docker: use the distro-provided flake8

 support/docker/Dockerfile | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
