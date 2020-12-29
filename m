From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 29 Dec 2020 12:52:53 +0300
Subject: [Buildroot] [PATCH v2 0/2 ] package/timescaledb: Don't build with
 postgresql 13
Message-ID: <20201229095255.183687-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TimescaleDB is not supporting postgresql 13 at the moment.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
changes in v2:
- Hide version selection in "if BR2_PACKAGE_POSTGRESQL" block

Maxim Kochetkov (2):
  package/postgresql: allow to select postgresql version
  package/timescaledb: add dependency on postgresql 12

 package/postgresql/Config.in       | 24 ++++++++++++++++++++++++
 package/postgresql/postgresql.hash |  3 +++
 package/postgresql/postgresql.mk   |  2 +-
 package/timescaledb/Config.in      |  1 +
 4 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.29.2
