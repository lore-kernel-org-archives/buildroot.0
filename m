From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Mar 2021 21:53:28 +0100
Subject: [Buildroot] [PATCH 0/5] legacy: drop old options (branch
 yem/drop-old-legacy)
Message-ID: <cover.1616878389.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We advertise that legacy symbols will be removed after two years.
However, so far, we've be more lax than that, and we only dropped
symbols after about 5 year have elapsed.

This series removes options in step, starting with the usual 5-year
threshold, in 1-year increments, to eventually catch-up with the
advertised 2-year threshold.

Additionally, a little shell snippet is added in the comments, to
help eventually drop those legacy symbols when they are still used
elsewhere (e.g. as legacy defaults).

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (5):
      legacy: add note about removing options
      legacy: drop options more than 5 years old
      legacy: drop options more than 4 years old
      legacy: drop options more than 3 years old
      legacy: drop options more than 2 years old

 Config.in                    |    1 -
 Config.in.legacy             | 2955 +-----------------------------------------
 boot/uboot/Config.in         |    2 -
 configs/sheevaplug_defconfig |    1 -
 fs/ext2/Config.in            |    1 -
 system/Config.in             |    1 -
 6 files changed, 4 insertions(+), 2957 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
