From: Christian Stewart <christian@paral.in>
Date: Sun, 15 Jul 2018 15:53:29 -0700
Subject: [Buildroot] [PATCH v4 3/3] docker-engine: split into
 docker-{cli, engine}, bump v2018.06-ce-rc3
In-Reply-To: <20180715224340.30282-3-christian@paral.in>
References: <20180715224340.30282-1-christian@paral.in>
 <20180715224340.30282-3-christian@paral.in>
Message-ID: <CA+h8R2qfgKP8Pb1BpTYtSXnDUqF7j2UD5i4=imfzxwCo3A9udA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Apologies for making the notorious mistake of finding a typo just
after submitting something:

--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,6 +3,7 @@  config BR2_PACKAGE_DOCKER_ENGINE
  depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
  depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
  depends on BR2_TOOLCHAIN_HAS_THREADS
+  select BR2_PACKAGE_DOCKER_CLI
  ^
This should be a tab, not spaces.

Same in Config.in.legacy:

select BR2_LEGACY
select BR2_PACKAGE_DOCKER_CLI_STATIC
^

Best,
Christian
