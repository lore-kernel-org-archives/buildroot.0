Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481FCCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2041D61179;
	Fri, 12 Jun 2026 11:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvskhoG7LwVm; Fri, 12 Jun 2026 11:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92FF561150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263487;
	bh=77jCVJ3RttHkBWm8IzTBGSuxZ/Di5l16QuFFn5QJyRA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dq74qypmkHiRF7yPZkBrU671FtPBJFCiAZEp8b9kUmLXtj5ZR+GEZBHYrBHeU2iV3
	 1tXqYWSP7paIrkhq3KIy4ZqcYtzL16akZ6H7AHgQL3zKigS/OfFaJ/QfAqWh/laGKz
	 X78foZo7R0Euv6nduQwWco2unwQeWNWIAFC03SxeaZthz1/wPrzN0ustCVrgSaXxTV
	 iJxxSeh6Y21pyvfDFfh8WL8oJEsBTcaRPut2zHb9nuZom4EQkYY59wiTGxGSSanO/z
	 eNzYf/5Wo5LNHHro/gNypGZYGmIsI194Q4Bwg5ixfxF1ldm85/DiXcbD5oYTGAcTSS
	 TqOaNBMen7O4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FF561150;
	Fri, 12 Jun 2026 11:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6311F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793B94067A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Eij9K9i4NJQ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 906F64067D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 906F64067D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A1BF880E8; Fri, 12 Jun 2026 11:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:51:30 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1d11999065d15b69c0b7b0ec55a850a271928560
X-Git-Newrev: be1ee6a0bc4c99960d04150c34e4f646ebbaf06f
X-Patchwork-Hint: ignore
Message-Id: <20260612112350.6A1BF880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libusb: security
 bump to version 1.0.30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be1ee6a0bc4c99960d04150c34e4f646ebbaf06f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issues:

CVE-2026-23679: libusb before version 1.0.30 contains a NULL pointer
dereference vulnerability that allows attackers to crash applications by
supplying a malformed USB configuration descriptor where an interface claims
bNumEndpoints greater than zero but is followed by a class-specific
descriptor whose bLength exceeds the remaining buffer size, causing
parse_interface() to return early without allocating the endpoint array.
Attackers can exploit this flaw through libusb_get_active_config_descriptor
or libusb_get_config_descriptor by providing crafted descriptors via
virtualized USB passthrough, file-based descriptor parsing, or network
sources, causing any application iterating over endpoints to dereference a
NULL endpoint pointer and crash.

https://nvd.nist.gov/vuln/detail/CVE-2026-23679

CVE-2026-47104: libusb before version 1.0.30 contains a one-byte
out-of-bounds read vulnerability in parse_iad_array() in descriptor.c that
allows attackers to trigger a denial of service by supplying a malformed USB
descriptor whose bLength equals size minus one, causing the bounds check to
use the original buffer size instead of the remaining size.  Attackers in
virtualized environments with USB passthrough can supply crafted descriptors
through libusb_get_active_interface_association_descriptors or
libusb_get_interface_association_descriptors to read one byte past the end
of the malloc allocation, resulting in a denial of service.

https://nvd.nist.gov/vuln/detail/CVE-2026-47104

For more details, see the announcement:
https://sourceforge.net/p/libusb/mailman/message/59335553/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 907ebab6d9d1f4233071d1db3bb1fcf3fc365344)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 4c76609930..7b4b92e6e9 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85  libusb-1.0.29.tar.bz2
+sha256  fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf  libusb-1.0.30.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 95ce8b17df..1352569f7b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).29
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).30
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
