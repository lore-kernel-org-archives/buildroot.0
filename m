From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 Mar 2011 08:27:05 +0100
Subject: [Buildroot] [PATCH 0 of 3] Add support for local package downloads
	(file://)
Message-ID: <patchbomb.1300174025@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series add support for file:// URLs for both the package
infrastructure, as for the BR2_PRIMARY_SITE and BR2_BACKUP_SITE options. URLs
starting with file:// will be handled by a plain 'cp' instead of wget. A new
SITE_METHOD 'file' is added. Documentation is updated as well.

Note that this is mainly useful in situations where developers working on a
project are sharing the same filesystem (e.g. disk, NFS, ...), as typically
is the case in corporate environments. In that case, one may add one or more
local project-specific packages, and even use a central storage location as
'proxy' for package downloads (using BR2_PRIMARY_SITE with a file:// URL).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/buildroot.html         |  29 +++++++++++++++++------------
 package/Makefile.package.in |  14 +++++++++++---
 2 files changed, 28 insertions(+), 15 deletions(-)
