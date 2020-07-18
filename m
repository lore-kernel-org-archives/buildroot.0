From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 13:48:23 +0200
Subject: [Buildroot] [PATCH 0/4 v5] dus-borker: new package (branch
 yem/dbus-broker)
Message-ID: <cover.1595072897.git.yann.morin.1998@free.fr>
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

All the gory details necessary to make dbus-broker work are explained in
the first patch' commit log.


Regards,
Yann E. MORIN.


The following changes since commit 3346d78384c9732affb4149f941c74c369b7c1d7

  package/systemd: cosmetic rearrange list of users (2020-07-18 13:43:23 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to a63f1dc4a5c32382d5861934aa426cfbe58a490e

  support/run-test: add test for systemd using dbus-broker (2020-07-18 13:46:20 +0200)


----------------------------------------------------------------
Norbert Lange (1):
      package/dbus-broker: new package

Yann E. MORIN (3):
      package/systemd: do not force dbus if dbus-broker is available
      support/testsuite: de-duplicate the systemd runtime tests
      support/run-test: add test for systemd using dbus-broker

 .gitlab-ci.yml                             |   4 +
 DEVELOPERS                                 |   2 +
 package/Config.in                          |   1 +
 package/dbus-broker/Config.in              |  22 ++++++
 package/dbus-broker/dbus-broker.hash       |   3 +
 package/dbus-broker/dbus-broker.mk         |  77 ++++++++++++++++++
 package/dbus-broker/dbus.socket            |   5 ++
 package/dbus-broker/session.conf           |  65 +++++++++++++++
 package/dbus-broker/system.conf            | 123 +++++++++++++++++++++++++++++
 package/systemd/Config.in                  |   2 +-
 support/testing/tests/init/test_systemd.py |  69 +++++++++++-----
 11 files changed, 352 insertions(+), 21 deletions(-)
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
