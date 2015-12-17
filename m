From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:06:32 +0100
Subject: [Buildroot] [PATCH 0/4] Do not select providers of virtual packages
	(branch yem/dont-select-providers)
Message-ID: <cover.1450389598.git.yann.morin.1998@free.fr>
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

Regards,
Yann E. MORIN.


The following changes since commit aee53f8b6f29916ca5d322f793828c24874459d5:

  package/php: Always link with libpthread for static builds (2015-12-17 22:50:56 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/dont-select-providers

for you to fetch changes up to cb0f7634e0c32e0e383baa52e48047dc7a82b7ea:

  package/libedje: do not select Lua, depend on it (2015-12-17 22:58:46 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/dnsmasq: do not select Lua, depend on it
      package/haserl: do not select Lua, depend on it
      package/lighttpd: do not select Lua, depend on it
      package/libedje: do not select Lua, depend on it

 package/dnsmasq/Config.in           |  5 ++++-
 package/efl/libedje/Config.in       |  6 +++---
 package/efl/libelementary/Config.in |  6 ++++--
 package/efl/libethumb/Config.in     |  5 +++--
 package/enlightenment/Config.in     |  6 ++++--
 package/haserl/Config.in            | 10 ++++++++--
 package/lighttpd/Config.in          |  5 ++++-
 7 files changed, 30 insertions(+), 13 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
