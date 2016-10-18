From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 12:00:07 +0200
Subject: [Buildroot] [git commit] filemq: disable documentation generation
Message-ID: <20161018100012.8722B81D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=345e2db8549145df87f100f9e66f6955b4908fb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The parameter to disable asciidoc documentation generation changed from
'fmq_have_asciidoc' to 'filemq_have_asciidoc'.

Fixes [1], [2], [3]:

  File "/usr/bin/asciidoc", line 101
    except KeyError, k: raise AttributeError, k
                   ^
  SyntaxError: invalid syntax

[1] http://autobuild.buildroot.net/results/5f0/5f0558235756419eff15b8e909b5d630712f5141
[2] http://autobuild.buildroot.net/results/a23/a23d92b09dadc12b3753c951900e28fc19bd14cd
[3] http://autobuild.buildroot.net/results/a45/a450ff5c6008ccf290a028e6eab7ff26369243e7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/filemq/filemq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 0e73591..d57208e 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -8,7 +8,7 @@ FILEMQ_VERSION = e59951489045825d6fc5bdc6a5a5ecf1abf51943
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
-FILEMQ_CONF_ENV = fmq_have_asciidoc=no
+FILEMQ_CONF_ENV = filemq_have_asciidoc=no
 FILEMQ_INSTALL_STAGING = YES
 FILEMQ_DEPENDENCIES = czmq openssl zeromq
 FILEMQ_LICENSE = LGPLv3+ with exceptions
