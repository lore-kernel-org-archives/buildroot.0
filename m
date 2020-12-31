From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2020 10:53:09 +0100
Subject: [Buildroot] [PATCH 0/3] package/gdb: add support for python3
 (branch yem/gdb-py3)
Message-ID: <cover.1609408378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small 3-patch series is based on the RFC by Titouan, to add support
for python3 to gdb:
    http://lists.busybox.net/pipermail/buildroot/2020-February/273561.html

We first cleanup the script emulating python-config, and then we make it
agnostic to the pytthon version. Finally, we enable python3 support in
gdb.

Regards,
Yann E. MORIN.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Titouan Christophe (1):
      package/gdb: enable python3 support

Yann E. MORIN (2):
      package/gdb: cleanup in gdb-python-config
      package/gdb: do not hard-code python version in gdb-python-config

 package/gdb/Config.in         |  3 +--
 package/gdb/gdb-python-config | 23 ++++++++++++++---------
 package/gdb/gdb.mk            | 12 +++++++++++-
 3 files changed, 26 insertions(+), 12 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
