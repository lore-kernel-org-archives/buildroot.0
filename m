From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:30:20 +0200
Subject: [Buildroot] [PATCH 0/3] legacy: drop options older than 5 years,
 make that the new rule (branch yem/drop-old-legacy)
Message-ID: <cover.1616963387.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We advertise that legacy symbols will be removed after two years.
However, so far, we've be more lax than that, and we only dropped
symbols after about 5 year have elapsed.

This series changes the rule to match the customs, and drops the
entries older than 5 years.

Additionally, a little shell snippet is added in the comments, to
help eventually drop those legacy symbols when they are still used
elsewhere (e.g. as legacy defaults).

---
Changes v1 -> v2:
  - drop patches removing more recent entries up to 2-year old)
  - make the 5-year customs the rule

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      legacy: increase the duration during whih we keep legacy symbols
      legacy: add note about removing options
      legacy: drop options more than 5 years old

 Config.in                    |   1 -
 Config.in.legacy             | 658 +------------------------------------------
 configs/sheevaplug_defconfig |   1 -
 3 files changed, 4 insertions(+), 656 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
