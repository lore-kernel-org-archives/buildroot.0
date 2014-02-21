From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Feb 2014 23:17:50 +0100
Subject: [Buildroot] [PATCH 0/3 v3] BR2_EXTERNAL, O: misc fixes and docs
Message-ID: <cover.1393020340.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that fixes use of relative paths in BR2_EXTERNAL
and documents the limitations in the manual for BR2_EXTERNAL and O.

The first patch is an actual fix for this case:
    make O=.. BR2_EXTERNAL=.. foo_defconfig

The rest are enhancements/clarifications to the manual. 

As such, I propose them as candidates for 2014.02.


Changes v2 -> v3:
  - refreshed on-top current master, should apply to -next as well.

Changes v1 -> v2:
  - don't discourage relative paths, just properly document them  (Thomas,
    Arnout)
  - fix overriding BR2_EXTERNAL  (J?r?my)
  - simplify error message when BR2_EXTERNAL is not found  (Arnout)
  - document that $(O) is created

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      Makefile: internally use absolute paths to BR2_EXTERNAL
      manual: switch BR2_EXTERNAL examples to use absolute paths
      manual: add explanations on limitations about using O=...

 Makefile                             |  5 +++++
 docs/manual/common-usage.txt         | 12 +++++++++---
 docs/manual/customize-outside-br.txt | 10 +++++-----
 3 files changed, 19 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
