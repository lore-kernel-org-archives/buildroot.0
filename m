Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=InXYWpki
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD6B81A23;
	Sat, 24 Oct 2026 15:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYRaq_mp6i4y; Sat, 24 Oct 2026 15:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 480F681A99
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854085;
	b=bEoB65+C54SMNv15XjXsFHR8lygEU1rWnwqyHvYQZ1H24fKj8laBVvebm0ew3W/mUYbB
	 xpg306AJ3eRn5gVnGy3pyuqvBMYYnuQLXaOKr9KgwL8FYcLGTP0eEqX3z8CIi880u8Cxs
	 PoolmmvX6G3Aec9o2g8DYYrKSfsNDNqdwYIq+o+qW4ZCuzs+2EVvCmEYjVje2KpidDSgq
	 Iiq0ujfACGn0YNdgdwmre31nAHxecDMQbrXWKlFNyJBq5BfJlmVk8gg8rbVqLG4RaA6Th
	 pF+DzUnIdNt/qF/BgAzeuldaOa/cxzrH2xFt0nMSUHu+PwECQQGaJpJwUZR/vomDXYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b5LaQs7oXGipjqQxOrvM7+UU2pMpv+6EwyJclP+Wluc=;
	b=R30tuzJhxXw/BeIEd/dr1HwX/9A+PkhFHbZ6qFuJ23LXhk56WOuEVYsLuk5WLMW1S79O
	 QXxt/9W9MqzKFc0UM202aNi5s89Of+nVgd/SiSsbWx4NZSVA01MR89mITp3jsu3cncQy4
	 rxKV3b839+6L2Qn4QtMvIgLDt8RFiVF2PfvHANFUOVE+rA/vKqxyoDJNiXXKGZTRx2GCV
	 o/3bkdyLGt66URwfDhOX6PvBxeAYG6CnJgBuLgRTF27mA/fJ13QGLKwFSO9X/kE42eNh6
	 x3KTJSIlHbGJYd6Njl6edMH/xINlD/U8bO/i10YjshXhCr4cbJkSULDKr3pQqPbP4Og==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854085;
	bh=b5LaQs7oXGipjqQxOrvM7+UU2pMpv+6EwyJclP+Wluc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=InXYWpki44Ta6Xh1gp0GPlkSF/4QASZFpyOUXTHU5neMU7bVr2bDsvvX9iq84GTVn
	 0WiH9R/nzWPpw1n8geNyY6i4riGM11t7I3dbPjgqCVr6VPSZN79dXqM3smDZ7cLCXN
	 dMpQptXINpT0Z62OfXFGi/T/wM3BEOqNdSUj3izeqp9Z4/OUs0J84MVLI//1q5sx7o
	 awKzBqT/cxqphWyOZ4inWr6yu3DpIKt1i1THtzVNIqq4o8fXf2quNHnNy3hAnBDe1F
	 WMwilLO0KUGyvron0gm8eT+tMGvax5rjnZrpXDCIuFpmVbmDYKrcvca4roXYn4ILl8
	 B0qsCXlOuN4wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480F681A99;
	Sat, 24 Oct 2026 15:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30A2AD32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CEA1409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSS_Ft80gQAl for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D4FF40A33
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854054;
 b=OutXsWiVlvILjh8PZBx3OuAmSqUJvJyweRUsQcxp9foNGJcUrpXwPoXoqinEqWOIsdfs
 5oS49LI8PYfgerGhhqP5BtzwfbL3NNiNq4h+zNHbKZX3JocKUZHLo2TCw5LAcxFnTBcp9
 +ReKlvWGF4bfrZlC4k3v+41POIGuoDW26g9a7MbXUWYb9lQ2IajrLuAc7TULv9AGwtmP2
 sYrE73kzb4O+EX26f13oWCBDnyrIMco8I0u9ifrUQPC41O2+c9p+njmNgLLxv+5R2h3yv
 Yn8qC3yw0f5w93U7xl+PEEbZfs/tXBnjXmkbjBy0dPC8B30KtT/qI5+VUXe8ESZZB/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YU7fU+odVGa/w4QibOc+i2CUnBl5NzOnS4JY2S7E/wA=;
 b=Pja5LzRYr6CzrVTCgI3oV7ARmsJ7jdFhUXFV/SgttWXe4MnBlJuoPi44mEKqQkrnMUBU
 ZNaL0vw6lhLNCNzwAAzw/Je/AU/Qcnt+Vh1BYlEyrs4Nvw8wyoTiGStBbBTodED6lcgis
 9xQLH1VZ4xwTGpWbwN3aR18JMlTS4gxPkqQK/b5lUsW61/OQ2gvyi2PRJuVFXxJSGNwj7
 4lsWwVwDk+2qKBFp2b/cZnBTDwhiUp3QOhN6BDkV+RS0aZM/geu1ABvqZdfFr8IOY9IVb
 WrarOvnTH3iTDKK5AHKlyzoIIy6b3yIT4bVjynL/jtxekgRLnWzHRv2Q6c3rN746FuA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D4FF40A33
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 438649C7D5; Sat, 24 Oct 2026 14:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93ad9e63ddfe7492ab51931185e2294f5a845aef
X-Git-Newrev: 26a8be28c05ced9d63d7086b522e07c79fbfe4de
X-Patchwork-Hint: ignore
Message-Id: <20261024145929.438649C7D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add host-python-pkg-resources
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26a8be28c05ced9d63d7086b522e07c79fbfe4de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Older U-Boot Binman versions import pkg_resources, which was removed
from setuptools in version 82. Add the standalone host package when
BR2_TARGET_UBOOT_USE_BINMAN is enabled to preserve support for these
versions and vendor trees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 99330a2f15..a7e831f6c3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,6 +312,7 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
+	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
