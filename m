From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 26 Mar 2010 20:46:31 +0100
Subject: [Buildroot] [PATCH] Prepare to handle more than two toolchain types
Message-ID: <20100326194619.8693.69302.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To prepare to handle more than two toolchian types, we should always
explicitly check the configured toolchain type, rather than falling
back to the non-selected one.

As this is a choice, we are sure that either the 'buildroot' or the
'external' toolchain is seleted, so we do not have to handle the
default case (both/none selected).

---

Yann E. MORIN (1):
      toolchain: prepare for more than two alternatives


 Makefile                   |    6 +++---
 package/Makefile.in        |   11 +++++------
 package/gettext/gettext.mk |    2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
