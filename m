From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 23:10:22 +0100
Subject: [Buildroot] [PATCH 0/7 v3] Setting timezone for uClibc,
	and setting localtime
Message-ID: <cover.1393884458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a series that adds the possibility to:

  - install the timezone info for uClibc; currently, that was only
    supported for glibc or eglibc-based systems. Thanks to Alexandre's
    packaging of tzdump, we can generate zoneinfo for uClibc, too.

  - set a default localtime for the system, for both *glibc-based
    systems and uClibc-based systems.

Unfortunately, musl-based systems are still left behind for now.
This is not too bad, as musl is not yet widely available.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Alexandre Belloni (3):
      tzdata: allow host build
      tzdump: new host package
      tz: new package

Yann E. MORIN (4):
      system: make the zoneinfo list a system option
      system: add selection of a default localtime
      package/zic: install header
      system: allow setting the local timezone for uClibc

 Config.in.legacy         | 15 +++++++++++++++
 package/Config.in        |  1 +
 package/tz/Config.in     |  4 ++++
 package/tz/tz.mk         | 30 ++++++++++++++++++++++++++++++
 package/tzdata/Config.in | 23 +++--------------------
 package/tzdata/tzdata.mk | 31 ++++++++++++++++++++++++++++---
 package/tzdump/tzdump.mk | 24 ++++++++++++++++++++++++
 package/zic/zic.mk       |  2 ++
 system/Config.in         | 40 ++++++++++++++++++++++++++++++++++++++++
 9 files changed, 147 insertions(+), 23 deletions(-)
 create mode 100644 package/tz/Config.in
 create mode 100644 package/tz/tz.mk
 create mode 100644 package/tzdump/tzdump.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
