From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:40:23 +0100
Subject: [Buildroot] [PATCH 0/4 v2] Do not select providers of virtual
	packages (branch yem/dont-select-providers)
Message-ID: <cover.1450391976.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the selection of the Lua package, a sit is a provider
for the virtual package lua-interpreter.

As explained in the manual, it is not allowed to select the provider of
a virtual package. Quoting:

    If your package really requires a specific provider, then you?ll
    have to make your package depends on this provider; you can not
    select a provider.

Followed by an explanations on the reasons this should not be done:

    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

This series just cleanups the situation with respect to the
lua-interpreter virtual package. It has not been checked if we
had other virtual packages for which providers were selected.
This can be done in a later series.


Changes v1 -> v2:
  - drop the comment about Lua beeing needed  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 1edb4c51dee78d7d26700c037f29558e73d27ee0:

  Makefile: valgrind needs non-stripped dynamic linker library (2015-12-17 23:21:17 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dont-select-providers

for you to fetch changes up to 84fa969c68f847a8cbc781c28da5a5c2bc56dce8:

  package/libedje: do not select Lua, depend on it (2015-12-17 23:38:13 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/dnsmasq: do not select Lua, depend on it
      package/haserl: do not select Lua, depend on it
      package/lighttpd: do not select Lua, depend on it
      package/libedje: do not select Lua, depend on it

 package/dnsmasq/Config.in           | 2 +-
 package/efl/libedje/Config.in       | 4 ++--
 package/efl/libelementary/Config.in | 4 +++-
 package/efl/libethumb/Config.in     | 3 ++-
 package/enlightenment/Config.in     | 6 ++++--
 package/haserl/Config.in            | 2 +-
 package/lighttpd/Config.in          | 2 +-
 7 files changed, 14 insertions(+), 9 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
