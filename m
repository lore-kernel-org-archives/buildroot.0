From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 22:34:51 +0100
Subject: [Buildroot] [git commit] infra: introduce github helper function
Message-ID: <20131206215054.F08439BF53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb083e95cfae94a3a50551a2004f5ccdb02189a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to make it easier to cope with changes in github download-URL's,
this patch introduces the github helper function. It generates the site
URL of a github repository. It's usage is $(call github,user,pkg,version).

[Thomas: extracted from Mischa original commit, macro moved to
pkg-download.mk]

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 8e4a1ec..758b211 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -55,6 +55,9 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
 # default domainseparator is /, specify alternative value as first argument
 domainseparator=$(if $(1),$(1),/)
 
+# github(user,package,version): returns site of github repository
+github = https://github.com/$(1)/$(2)/tarball/$(3)
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
