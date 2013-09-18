From: =?ISO-8859-1?Q?Ra=FAl_S=E1nchez?= Siles <rasasi78@gmail.com>
Date: Wed, 18 Sep 2013 07:11:43 +0200
Subject: [Buildroot] [PATCH 1/1] Allow svn tags and branches notation in
	$(PKG)_VERSION variable.
Message-ID: <2228068.y4thvyPt1K@portaka>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


According to user manual "generic-package Reference" section, LIBFOO_VERSION
could refer to a branch or tag. This patch adds supports for this in the svn
method case for the repositories following the branches/tags/trunk layout.

Examples:
LIBFOO_VERSION = tags/v3.2.1
LIBFOO_SITE = svn://svn.server.net/myproject

LIBFOO2_VERSION = branches/featureA
LIBFOO2_SITE = http://svn.happyserver.net/theproject
LIBFOO2_SITE_METHOD = svn


Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 2 ++
 package/pkg-download.mk                 | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Allow-svn-tags-and-branches-notation-in-PKG-_VERSION.patch
Type: text/x-patch
Size: 1350 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130918/e022a560/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130918/e022a560/attachment.asc>
