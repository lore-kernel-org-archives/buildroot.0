From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 30 Aug 2013 09:09:43 -0500
Subject: [Buildroot] [PATCH v3 0/2] Add support for libssh2 in buildroot
Message-ID: <1377871785-4964-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for libssh2 to buildroot to allow for its use with libcurl. 
By having libcurl use libssh2, features like SCP and SFTP become possible 
when using libcurl.

For more detailed information about options enabled with libssh2 in libcurl
see the following website: http://curl.haxx.se/docs/features.html

Change from v2 -> v3:
  * Use else when selecting configure and dependancy options with using
    libgcrypt or openssl (suggested by Baruch Siach)

Change from v1 -> v2:
  * All the following changes were noted by Arnout Vandecappelle
  * updated commit comments for libssh2
  * removed details from libssh2/Config.in
  * added libssh2 to select libgcrypt by default
  * fixed up configuration options libssh2 in libssh.mk
  * removed removal of documentation and static libraries since the
    target finalize step takes care of this
  * added check for zlib dependancy (myself)

Ryan Barnett (2):
  libssh2: add package
  libcurl: add support for compiling with libssh2

 package/Config.in          |    1 +
 package/libcurl/libcurl.mk |    8 ++++++++
 package/libssh2/Config.in  |   11 +++++++++++
 package/libssh2/libssh2.mk |   32 ++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/libssh2/Config.in
 create mode 100644 package/libssh2/libssh2.mk
