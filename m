From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Aug 2019 18:22:30 +0200
Subject: [Buildroot] [PATCH 0/2 v7] package/iputils: use capabilties (branch
 yem/iputils-caps)
Message-ID: <cover.1564676540.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series changes iputils to use capabilities if support for
extended attributes is enabled.

Additionally, arping can be used for arp poisoning, so it should not be
usable by a non-root user. As such, we remove the setuid bit, and do not
assign it a capability either.


Regards,
Yann E. MORIN.


The following changes since commit 152e160bf6fcbb8f73c60944107e3a82f91edf50

  package/netsurf: add optional dependency on webp (2019-08-01 16:54:04 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 7357ef816dae35990f461175f35135fb4996eb54

  package/iputils: use capabilities if possible (2019-08-01 18:18:07 +0200)


----------------------------------------------------------------
Petr Vorel (1):
      package/iputils: use capabilities if possible

Yann E. MORIN (1):
      package/iputils: drop setuid on arping

 package/iputils/iputils.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
