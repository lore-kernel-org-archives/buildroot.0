From: Thomas Davis <sunsetbrew@sunsetbrew.com>
Date: Tue, 27 Aug 2013 19:26:02 -0400
Subject: [Buildroot] [PATCHv3 0/1] civetweb: new package
Message-ID: <1377645963-1953-1-git-send-email-sunsetbrew@sunsetbrew.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Submission #3 with recommended changes.

1. Changed make file ifdef's to ifeq correctly.
2. Made openssl and ipv6 support automatic. 
3. Moved html directory to /var/www
4. Fixed formatting and code convention issues.
5. largefile support is required by LUA AND Sqlite3.  I was able
   to work this out for Sqlite3, but LUA less trivial.
6. posix_fallocate() has not been present in any of my test builds, and
   I cannot seem to find out how to enable it.  However, I did find
   several projects that automatically disable use of the function
   via patches.  I effectly did the same using a define HAVE_POSIX_FALLOCATE=0.
7. Simplified configuration options.

Thank you,
Thomas Davis

Thomas Davis (1):
  civetweb: new package

 package/Config.in            |    1 +
 package/civetweb/Config.in   |   26 ++++++++++++++++++++
 package/civetweb/civetweb.mk |   53 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 package/civetweb/Config.in
 create mode 100644 package/civetweb/civetweb.mk

-- 
1.7.8.3
