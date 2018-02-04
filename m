From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Feb 2018 15:44:22 +0100
Subject: [Buildroot] [PATCH 0/5] support/docker: generate reproducible base
 images
Message-ID: <cover.1517755438.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, we only ever refer to the "latest" version of the image.
This is not nice because:
  1. this is not reproducible;
  2. we can't have different images between master and the various
     maintenance branches.

So, this series makes the generated image reproducible, and explains how
to gnerate and push a tagged image.

Once this series has been applied, we'll have to generate such a tagged
image and update our .gitlab-ci.yml accordingly.


Regards,
Yann E. MORIN.


The following changes since commit 651af57cf011e6d8764d11932ce87fc064cd9a9b

  dash: enable line editting if libedit is selected (2018-02-04 12:09:09 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c7619a7bdc91c8c2cb9d486859ddad8a8e89e78a

  support/dockker: create and push tagged images (2018-02-04 15:43:06 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      support/docker: limit the number of layers
      support/docker: don't be silent when setting up
      support/docker: use a known base distribution
      support/docker: use a fixed Debian snapshot
      support/dockker: create and push tagged images

 support/docker/Dockerfile       | 45 ++++++++++++++++++++++++-----------------
 support/docker/apt-sources.list |  4 ++++
 2 files changed, 30 insertions(+), 19 deletions(-)
 create mode 100644 support/docker/apt-sources.list

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
