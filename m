From: Svein-Erik Skjelbred <at91rm9200@skjelbred.com>
Date: Thu, 28 May 2009 00:08:47 +0200
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <87k5428ixt.fsf@macbook.be.48ers.dk>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
Message-ID: <4A1DB9EF.40002@skjelbred.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> Hi,
> 
> I've released RC3. Unless big issues are found, expect this to be the
> last release candidate before the release - So give it a good test.
> 
> Get it from here:
> 
> http://buildroot.net/downloads/buildroot-2009.05-rc3.tar.bz2
> 
> And report any issues found here or in the bugtracker.
> 
> The plan is to release the final 2009.05 release this weekend.
> 
The default linux-header for the tool chain was 2.6.29.4 but the default 
kernel itself was 2.6.29.2. The attached patch fixes that.

Svein-Erik Skjelbred

Start patch
----------------
diff --git a/target/linux/Config.in.advanced 
b/target/linux/Config.in.advanced
index de54d03..3a171b5 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -128,7 +128,7 @@ choice
           Select the specific Linux version you want to use

  config BR2_LINUX_2_6_STABLE
-       bool "The latest stable Linux kernel (2.6.29.2)"
+       bool "The latest stable Linux kernel (2.6.29.4)"

  config BR2_LINUX_2_6_29
         bool "Linux 2.6.29"
diff --git a/target/linux/Config.in.versions 
b/target/linux/Config.in.versions
index 467f73c..a37a5ad 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -19,13 +19,13 @@ config LINUX26_LATEST_MM_VERSION

  config BR2_KERNEL_CURRENT_VERSION
         string
-       default "2.6.29.2"
+       default "2.6.29.4"
         help
           This is the latest stable kernel (including minor version)

  config BR2_KERNEL_LATEST_2_6_29
         string
-       default "2"
+       default "4"

  config BR2_KERNEL_LATEST_2_6_28
         string
------------------------------
End Patch
