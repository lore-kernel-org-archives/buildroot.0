From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:03 +0200
Subject: [Buildroot] [PATCH 0/6 v4] Setting timezone for uClibc,
	and setting localtime (branch yem/tz)
Message-ID: <cover.1396900553.git.yann.morin.1998@free.fr>
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

Changes v3 -> v4:
  - fix omission about the default value in the TZ list

Changes v1 -> v3:
  - lost in the time warp since the initial submission... :-/

Regards,
Yann E. MORIN.


The following changes since commit f46f81de1315e6807a5309c0183d8bf336d14000:

  Don't build host-xz needlessly (2014-04-07 21:38:28 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/tz

for you to fetch changes up to d6e21684e5985a2d9c710447082cf576d956e328:

  system: allow setting the local timezone for uClibc (2014-04-07 21:51:18 +0200)

----------------------------------------------------------------
Alexandre Belloni (3):
      tzdata: allow host build
      tzdump: new host package
      tz: new package

Yann E. MORIN (3):
      system: make the zoneinfo list a system option
      system: add selection of a default localtime
      system: allow setting the local timezone for uClibc

 Config.in.legacy         | 15 +++++++++++++++
 package/Config.in        |  1 +
 package/tz/Config.in     |  4 ++++
 package/tz/tz.mk         | 30 ++++++++++++++++++++++++++++++
 package/tzdata/Config.in | 23 +++--------------------
 package/tzdata/tzdata.mk | 31 ++++++++++++++++++++++++++++---
 package/tzdump/tzdump.mk | 24 ++++++++++++++++++++++++
 system/Config.in         | 39 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 144 insertions(+), 23 deletions(-)
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
