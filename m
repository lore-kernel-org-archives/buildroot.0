From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:24:16 +0100
Subject: [Buildroot] [PATCH 0/3] Improve libopenssl target arch selection
Message-ID: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Reviewing commit 027c02660b8cd670eff0ba6fdd9e49253968517f
("package/libopenssl: set no-asm with generic architectures") from
Fabrice made me realize that the OpenSSL target architecture selection
logic was not very easy to read, and was missing a number of useful
cases.

So here is a small patch series that moves the target architecture
selection logic to Config.in, and then makes use of linux-generic64
and linux-x86 when appropriate.

Thomas

Thomas Petazzoni (3):
  package/libopenssl: move target arch selection to Config.in
  package/libopenssl: make use of linux-generic64 for 64-bit archs
  package/libopenssl: make use of linux-x86 for i386

 package/libopenssl/Config.in     | 31 ++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk | 35 +-------------------------------
 package/openssl/Config.in        |  2 ++
 3 files changed, 34 insertions(+), 34 deletions(-)
 create mode 100644 package/libopenssl/Config.in

-- 
2.21.0
