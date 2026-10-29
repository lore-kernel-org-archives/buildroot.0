Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D5606A324
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gwwKyfMy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11ED781757;
	Fri, 30 Oct 2026 14:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_l_fSwKI7DE; Fri, 30 Oct 2026 14:20:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F023816E0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370027;
	b=YRtJcgs8coTxC89i38sONi42QhYvr+vsSAtHc46JgZZeWVZDMpw5Kxt17Qk8bGvxDOYb
	 D0/MRh0aDIRzxX5ERh+ssoSt8B1LiHuz+I+S4cyG8Lp+WGi/VaeD0KeFt+AdRAaLDVeju
	 5XXr7FmF0AACnX9qStezKUceIk9I/IMo8eqW91iW63ws+l3cZHqxmVWufvOO+9IT68E9d
	 UHTS9f18v2ohg23pJzxrUgOYgRbM7/bsqoHOC/juqxF1TcQTz8+icMawB1F1T5d7FFX88
	 JewnU5ZUvaiuCvn9DZa71Lq40oY1VWzkYliNcHOZKb1RiXrWVtp4t4VxDF5S0XtkzSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gzDkd+9qOrYlG4r9A6X/7OQAtbXE1gn7nQWUuYSQs2M=;
	b=ZmZ0YkHxPKYMhCFr5sjsdSorNcEdRY8b5ezybCO80iaS/0IpDXcxzTSO/xVUK7RU0ibq
	 dpLx9JaE+s0AbumlkkP49QICu7xSPQ5b61bnU4c7iNDLKTWu53E4tDfPQsIF7SaiRMauH
	 elFZeBpwKTjcBp7r8DnuZsCAxJds2NFm2TI7ZRyod1sUn6qSHHrVIcuSVkw0gGS5Li3my
	 FvLByyqTIqFcsIhoPkMGsYRg6LQrt+XHdprEi3qK7U8JRO1oY9OfSOc1zg4jyD3IlIPpt
	 W1YVa+4dDOwcxYIWLROG2ydM8HBdD5YSUtbgpnKq+ru6xUa+vk5OSB3yD64dOj8El6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370027;
	bh=gzDkd+9qOrYlG4r9A6X/7OQAtbXE1gn7nQWUuYSQs2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gwwKyfMyXbwAsWGp7WUabHEHeJY0ONS3jxwGolaWD4YqhFftYdjAHpHKj3uEO/YUt
	 Cl7BflEDWWBgqO837etLEjscHUT/Z2pa+eyb8WZR41HUTtx2HBSca0yic0KuLLTL5D
	 TQKaeA2N0CAabvSLoqfah/OUu0wMtSVMGQVmLNcaVn3r7ZnwYoYhINxa4QaiFhIfKs
	 zwFR8UvHfw2rzsxMjJV9JA86y5fyajuD1WAH7gUCb5oW11OZFPMbPXop8CUDQSzrig
	 rbD6prwW1Ou2zzU4Eq/lZkyXayvkJBObSecEbDtXk+LrwoWFXYP+pW3c15NnoZNeOQ
	 9MsRt7XQwumYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F023816E0;
	Fri, 30 Oct 2026 14:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6C0C362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1AD3813D8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoKM6NMQ6h9n for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D74F7812F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=oAdrXYR9fSy8SNK1lgp2Bxvjf24H44gjXDQ/j7lDsfkZd9htext1JQhKhbPFeTy3xRDH
 jNJ3tlJ+0Dep6VbhNxnw3l7FhkrQUjSgsb5loZSd+ZfdEDDRezxvztr8z9rjGxxnFeCEl
 cg9QXfWR2X4f06g1tJRTLQkW4leD6e8O1v4AuNY+Nydmwe8MrQYDHzmtaBISivViHfhJT
 aV0I462bnsjclxdXKB7a9P2ozmMOq4vSPCFIKK1O64oKGBOumjaDHjt8jpFMhZdoWy3MK
 OT+9hYPULVMo4C+i5tZ77xxednSE8R4WbOsJKeUdZp1K6k4ZLgAqXeXKEPtHYEUV55w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=D7I+wmwEc4XXQrQJlEeTYcnHGDgpu9rJVhh3XO2AXMs=;
 b=Kkdi74j8l3F+M2Z4FrG/gKWz82VtTYTTp74GC29ZM39jaWf9qci3H6joqir/3aVZA8RF
 W9dROMi9WK+o5u+i4BO9z3T+KGeSL3HnrYlKejQlVYwf0LvWoeLl9TheCvxGlDX1JQA9F
 XYyKIHTOLjIA8ApGrN/ED2VFq5JIZRuWYbK9AY9nspxp4HCClRuEZmg4mjp7oGsnnWoSW
 q1Q/0q0hvYrHtLROb+CHFFSiWkmobZgGWtDhkeiE+CWecrb+gzwM0QqqW/moL3BmdRHqw
 Js8sloxk43P40qc6wuukpyBhBH6MOfJk13daUBr3DczBsjuKKgwQPO3xWamLv+wPHWg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D74F7812F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 022959D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c58cbe478ace0e51e66f1bd68e1302f6cab06001
X-Git-Newrev: c647377c5391db982e804f41f49e595b3eeaef64
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.022959D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] boot/uboot: add
 host-python-pkg-resources dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2754722086667816949=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2754722086667816949==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c647377c5391db982e804f41f49e595b3eeaef64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Older U-Boot Binman versions import pkg_resources, which was removed
from setuptools in version 82. Add the standalone host package when
BR2_TARGET_UBOOT_USE_BINMAN is enabled to preserve support for these
versions and vendor trees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 26a8be28c05ced9d63d7086b522e07c79fbfe4de)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..b667f30f6f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -304,6 +304,7 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
+	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)

--===============2754722086667816949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2754722086667816949==--
