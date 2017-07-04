From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Jul 2017 08:56:34 +0200
Subject: [Buildroot] [PATCH 0/2 v2] system: default to using Etc/UTC as a
	timezone
Message-ID: <cover.1499151384.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

A tiemzone is required by systemd, so we must have one defined.
See the second commit log for more details.

Changes v1 -> v2:
  - don't accept empty as default  (Arnout)
  - don't sneak whitespace cleanups, tell about them ;-)  (Arnout)


Regards,
Yann E. MORIN.


The following changes since commit 417ade5f2bbd6941d717d40af309f638abc108d5

  pkg-rebar: remove redundant / in front of $($(PKG)_ERLANG_LIBDIR) (2017-07-04 08:35:09 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 4928890759713fe0a785e193fa843dcff9805ed6

  system: use Etc/UTC as default timezone (2017-07-04 08:45:13 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/tz: fix variable name
      system: use Etc/UTC as default timezone

 package/tz/tz.mk         | 13 +++++--------
 package/tzdata/tzdata.mk | 15 ++++++---------
 system/Config.in         |  4 +---
 3 files changed, 12 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
