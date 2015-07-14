From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 19:35:07 +0200
Subject: [Buildroot] [PATCH v5 0/8] Linux kernel specific infrastructure
Message-ID: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches series introduces a new infrastructure to build Linux tools
available in the kernel tree.

Currently, the only Linux tool packaged in Buildroot is Perf and it
is use the generic package infrastructure.

But before introduce this new infra, merge some patches for Perf.

- Fix Perf optional dependencies.
- Add the Linux tools core infra.
- Add a new Linux tool: cpupower.
- Migrate the perf package to the new Linux tool infra.
- Add the documentation about Linux tool infra and Linux extensions.

Thanks Yann and Arnout for your help and review.

Romain Naour (4):
  linux: add linux-tools infra
  linux-tools: add cpupower
  package/perf: migrate perf to use the new linux-tools infrastructure
  docs/manual: add documentation for linux-ext and linux-tools.

Steven Noonan (4):
  package/perf: if slang is enabled, depend on it
  package/perf: if numactl (libnuma) is enabled, depend on it
  package/perf: if libunwind is enabled, depend on it
  package/perf: use correct definition of ARCH on x86_64

 Config.in.legacy                                   |   7 +
 docs/manual/adding-packages-kernel-module.txt      |   1 +
 .../adding-packages-linux-kernel-spec-infra.txt    | 143 +++++++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 linux/Config.in                                    |   3 +
 package/perf/Config.in => linux/Config.tools.in    |  18 ++-
 linux/linux-tool-cpupower.mk                       |  39 ++++++
 package/perf/perf.mk => linux/linux-tool-perf.mk   |  43 +++++--
 linux/linux.mk                                     |  24 ++++
 package/Config.in                                  |   1 -
 10 files changed, 262 insertions(+), 19 deletions(-)
 create mode 100644 docs/manual/adding-packages-linux-kernel-spec-infra.txt
 rename package/perf/Config.in => linux/Config.tools.in (63%)
 create mode 100644 linux/linux-tool-cpupower.mk
 rename package/perf/perf.mk => linux/linux-tool-perf.mk (65%)

-- 
2.4.3
