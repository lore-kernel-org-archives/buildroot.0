From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 21:36:45 +0100
Subject: [Buildroot] [PATCH 0/3] NodeJS fixes
Message-ID: <20191127203648.291701-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I finally took a closer look at two long standing NodeJS issues:

 - Issue with the host tool not finding libcrypto.so (bug #12211)

 - Issue with invalid floating point instructions being used on some
   ARM platforms/configurations (bug #12166)

This patch series fixes both issues.

Thanks,

Thomas

Thomas Petazzoni (3):
  package/nodejs: properly pass the --with-arm-float-abi on ARM
  package/nodejs: use --with-arm-fpu option on ARM
  package/nodejs: properly pass HOST_LDFLAGS when building host tools

 package/nodejs/nodejs.mk | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.23.0
