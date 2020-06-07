From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2020 19:44:48 +0200
Subject: [Buildroot] [PATCH 0/3] dus-borker: new package (branch
 yem/dbus-broker)
Message-ID: <cover.1591551884.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a rework of the original submission by Norbert, to add
dbus-broker and make use of it as a message us daemon for use with
systemd.

I (Yann) have reorganised the package, and fixed various issues, and
finally introduced run-time tests.


Regards,
Yann E. MORIN.


The following changes since commit 65b63785a642bbc565924edf365b5d7c080f961c

  package/systemd: move preset-all HOOK to fakeroot stage (2020-06-07 13:45:38 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f95931fc0eccd42e1aedeb83187ee01098903e3a

  support/run-test: add test for systemd using dbus-broker (2020-06-07 19:44:37 +0200)


----------------------------------------------------------------
Norbert Lange (1):
      package/dbusbroker: new package

Yann E. MORIN (2):
      package/systemd: do not force dbus if dbus-broker is available
      support/run-test: add test for systemd using dbus-broker

 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/dbus-broker/Config.in              |  21 +++++
 package/dbus-broker/dbus-broker.hash       |   3 +
 package/dbus-broker/dbus-broker.mk         |  71 +++++++++++++++++
 package/dbus-broker/dbus.socket            |   5 ++
 package/dbus-broker/session.conf           |  65 ++++++++++++++++
 package/dbus-broker/system.conf            | 120 +++++++++++++++++++++++++++++
 package/systemd/Config.in                  |   2 +-
 support/testing/tests/init/test_systemd.py |  28 +++++++
 10 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 package/dbus-broker/Config.in
 create mode 100644 package/dbus-broker/dbus-broker.hash
 create mode 100644 package/dbus-broker/dbus-broker.mk
 create mode 100644 package/dbus-broker/dbus.socket
 create mode 100644 package/dbus-broker/session.conf
 create mode 100644 package/dbus-broker/system.conf

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
