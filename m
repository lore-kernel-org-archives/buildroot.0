From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Aug 2014 15:40:33 +0200
Subject: [Buildroot] [PATCH 0 of 5 v4 for 2014.08] manual-text generation
	improvements
Message-ID: <patchbomb.1408110033@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series makes some improvements to the generation of the text
version of the manual:
- make sure that URLs are visible
- remove the 'logo' (logo.png) reference

To achieve this, three preparatory patches are needed.

Note that this series stands on its own, it can already be applied.
A subsequent series will make structural and content-wise changes to the
manual itself.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: fix 'make clean' (detected by Samuel)
v3: fix 'make manual' without .config (extra patch) (detected by Yann)
v2: refine patch 4 (changing URLs)

Thomas De Schampheleire (5)
  Makefile: unconditionally include pkg-utils.mk
  gendoc infra: use $(pkgname) instead of explicitly passing 'manual'
  gendoc infra: add support for asciidoc configuration files
  manual-text: make sure URLs are displayed if a link text was provided
  manual-text: hide image representations

 Makefile                       |   2 ++
 docs/manual/asciidoc-text.conf |  23 +++++++++++++++++++++++
 docs/manual/manual.mk          |  28 +++++++++++++++++-----------
 package/Makefile.in            |   1 -
 4 files changed, 42 insertions(+), 12 deletions(-)
