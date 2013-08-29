From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 29 Aug 2013 14:27:01 -0500
Subject: [Buildroot] [PATCH 0/2] Add support for libssh2 in buildroot
Message-ID: <1377804423-31230-1-git-send-email-rjbarnet@rockwellcollins.com>
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

Ryan Barnett (2):
  libssh2: add support for new package libssh2
  libcurl: add support for compiling with libssh2

 package/Config.in          |    1 +
 package/libcurl/libcurl.mk |    8 +++++++
 package/libssh2/Config.in  |   18 ++++++++++++++++
 package/libssh2/libssh2.mk |   49 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 package/libssh2/Config.in
 create mode 100644 package/libssh2/libssh2.mk
