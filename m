From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 22:00:14 +0100
Subject: [Buildroot] [git commit] python-markupsafe: allow build as host
	package
Message-ID: <20150128210052.DA10080841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a641969ae6dbed01a8472565e9eddc721f3387b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-markupsafe is a dependency for python-jinja2, which can be used
during build time as a host tool to generate code based on templates.
This package is being added host package support mostly to allow
host-python-jinja2 to build.
This has been tested to build and work correctly as a host tool as well.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-markupsafe/python-markupsafe.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 9c7eb14..c815728 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -12,3 +12,4 @@ PYTHON_MARKUPSAFE_LICENSE = BSD-3c
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
