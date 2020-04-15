From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 15 Apr 2020 17:48:43 +0100
Subject: [Buildroot] [PATCH v2 2/5] support/docker: Add openssh-server
In-Reply-To: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
References: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
Message-ID: <20200415164846.122126-3-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install the openssh-server package into the test container. This
package, as well as its dependency openssh-client, is required to test
SCP and SFTP download methods on the localhost, as if these tools were
already installed on the user's machine.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index be795a18b4..f44be230e6 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -36,6 +36,7 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
+        openssh-server \
         python-flake8 \
         python-nose2 \
         python-pexpect \
-- 
2.20.1
