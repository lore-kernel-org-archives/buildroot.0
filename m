From: Ben Boeckel <mathstuf@gmail.com>
Date: Sun, 18 Oct 2015 10:51:59 -0400
Subject: [Buildroot] [PATCH 0/1] Add postgres server/client options
Message-ID: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently it is possible to turn on postgres and have both client and server
off. Making it an either/or seemed like too much of a break for those wanting
both, but I'm unsure of how to enforce at-least-one-of a set not available
until the postgres package is enabled.

Both options default to 'y' for backwards compat.

The procedure is as documented here (at the end):

  http://www.postgresql.org/docs/9.4/static/install-procedure.html

but I used FreeBSD's directory listing which also excludes the other
server-only bits and allows server-without-client mode as well.

If the simpler procedure on the webpage is wanted, I'm fine with that as well.

Tested in client, server, and client+server mode locally on x86_64.

Thanks,

--Ben

Ben Boeckel (1):
  postgresql: add an option to build the server

 package/bandwidthd/Config.in     |  1 +
 package/collectd/Config.in       |  1 +
 package/cppdb/Config.in          |  2 +-
 package/php/Config.ext           |  1 +
 package/postgresql/Config.in     | 16 ++++++++++++++
 package/postgresql/postgresql.mk | 48 ++++++++++++++++++++++++++++++++++++++++
 package/qt/Config.sql.in         |  1 +
 package/qt5/qt5base/Config.in    |  1 +
 8 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.6.1
