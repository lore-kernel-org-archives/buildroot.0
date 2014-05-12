From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 12 May 2014 07:27:02 +0400
Subject: [Buildroot] [PATCH 0/4] fix environment variables passing to
	configure/make
Message-ID: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series fixes erroneous usage of the 'CFLAGS+="..."' pattern in configure
and make steps, replacing it with 'CFLAGS="$(TARGET_CFLAGS) ..."'.

This fixes one issue reported by autobuilder and makes build commands look
correct in other cases.

Max Filippov (4):
  sqlcipher: fix passing CFLAGS/LDFLAGS to configure
  libcgroup: fix passing CFLAGS/LDFLAGS to configure
  ebtables: fix passing CFLAGS to configure
  sysstat: fix passing CFLAGS to make

 package/ebtables/ebtables.mk   |    4 ++--
 package/libcgroup/libcgroup.mk |    4 ++--
 package/sqlcipher/sqlcipher.mk |    4 ++--
 package/sysstat/sysstat.mk     |    2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.7.6
