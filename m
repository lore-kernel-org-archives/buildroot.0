From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Thu, 20 Feb 2020 17:01:16 +0100
Subject: [Buildroot] [PATCH v3 07/10] docs/manual/adding-packages-cargo:
 update doc for new infra
In-Reply-To: <20200220160119.3407-1-patrick.havelange@essensium.com>
References: <20200220160119.3407-1-patrick.havelange@essensium.com>
Message-ID: <20200220160119.3407-7-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-cargo.txt | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 9a496224e3..e7d03eb7b5 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -61,16 +61,8 @@ Those will then replace the commands from the cargo infrastructure.
 ==== About Dependencies Management
 
 A crate can depend on other libraries from crates.io or git repositories, listed
-in its Cargo.toml file. Before starting a build, Cargo usually downloads
-automatically them. This step can also be performed independently, via the
-+cargo fetch+ command.
+in its Cargo.toml file. Before starting a build, the +cargo vendor+ command
+will be run and will take care of downloading those dependencies.
 
-Cargo maintains a local cache of the registry index and of git checkouts of the
-crates, whose location is given by +$CARGO_HOME+. As seen in the package
-Makefile example at line 15, this environment variable is set to
-+$(HOST_DIR)/share/cargo+.
-
-This dependency download mechanism is not convenient when performing an offline
-build, as Cargo will fail to fetch the dependencies. In that case, it is advised
-to generate a tarball of the dependencies using the +cargo vendor+ and add it to
-+FOO_EXTRA_DOWNLOADS+.
+The final source tarball will contain all the required dependencies, effectively
+permitting us to do an offline build.
-- 
2.17.1
