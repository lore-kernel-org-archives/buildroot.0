From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 13 Jul 2015 23:17:01 +0200
Subject: [Buildroot] [PATCH v2 0/4] Linux kernel specific infrastructure
Message-ID: <1436822225-29591-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches series introduces a new infrastructure to build Linux tools
available in the kernel tree.

- The first patch add the Linux tools core infra.
- Add a new Linux tool: cpupower.
- migrate the perf package to the new Linux tool infra.
- Add the documentation about Linux tool infra and Linux extensions.

Thanks Yann and Arnout for your help and review.

Best regards,
Romain Naour

Romain Naour (4):
  linux: add linux-tools infra
  linux-tools: add cpupower
  package/perf: migrate perf to use the new linux-tools infrastructure
  docs/manual: add documentation for linux-ext and linux-tools.

 Config.in.legacy                                   |   7 ++
 docs/manual/adding-packages-kernel-module.txt      |   1 +
 .../adding-packages-linux-kernel-spec-infra.txt    | 140 +++++++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 linux/Config.in                                    |   3 +
 linux/Config.tools.in                              |  29 +++++
 linux/linux-tool-cpupower.mk                       |  41 ++++++
 linux/linux-tool-perf.mk                           |  63 ++++++++++
 linux/linux.mk                                     |  24 ++++
 package/Config.in                                  |   1 -
 package/perf/Config.in                             |  21 ----
 package/perf/perf.mk                               |  68 ----------
 12 files changed, 310 insertions(+), 90 deletions(-)
 create mode 100644 docs/manual/adding-packages-linux-kernel-spec-infra.txt
 create mode 100644 linux/Config.tools.in
 create mode 100644 linux/linux-tool-cpupower.mk
 create mode 100644 linux/linux-tool-perf.mk
 delete mode 100644 package/perf/Config.in
 delete mode 100644 package/perf/perf.mk

-- 
2.4.3
