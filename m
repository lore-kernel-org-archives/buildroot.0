From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 14:59:43 +0100
Subject: [Buildroot] [PATCH 0 of 3 v2] dependencies: some improvements
Message-ID: <patchbomb.1322053783@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original series had the following patches:
 1 dependencies: check core dependencies before anything else
 2 dependencies: add function suitable-host-package
 3 dependencies: build a host-tar if no suitable tar can be found
 4 dependencies: remove unused lzma checking scripts
 5 dirs and dependencies should be executed before every package

Patches 1 and 4 are already merged (thanks Peter).

Patch 5 tried to fix some non-default scenarios, like running 'make
ctng-menuconfig'
without having run 'make dependencies' or plain 'make' first. But, this
attempt mainly suffered from the introduction of circular dependencies, which
are not easy to solve. I therefore decided not to support these scenarios in
this series.

Patch 2 and 3 are updated in this series based on the input from Arnout
(thanks!)

Additionally, a new patch moves toolchain/dependencies to
support/dependencies.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
