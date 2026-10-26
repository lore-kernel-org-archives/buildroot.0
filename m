Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44601606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OaHrQIqI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2418640539;
	Mon, 26 Oct 2026 20:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTa5GvkWOpI3; Mon, 26 Oct 2026 20:41:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3FB894053C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793047270;
	b=QP8O+xisfaJtoo4wNGH2GllrZ610+qTJUdn7I+UkP7iroGNKByDiHF3iGAQd4VKEFAm2
	 +6MtApsxp8lfOa1o0dL24WZ9eipMudhELCi7Ofd/Br6RMS3C4A9eNJwryJoAGC73D8Ege
	 SK0Vz13iat3sVhKriYWpX0hmxEtjAFSi8VGlyydUL/DGiTMr7OZtNmHuZN9jmVL5jXOUK
	 d7pGU+1Sgbu5K+qK18oN1+ATi5gOuSTi3LgTIH2Ng1+FM6nSyWlYYtiqBCQt6Tmn0GBNB
	 Dw2Q+UJFQw1IhiZpOuLF4oPGstYkDa7DRSbI36ZWtQ36FbtzvjHw9n6ene2wOeHBbKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793047270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UKgAWtlewM7SnrTYU0PSJFmMvp/nZV9OBwXEtlzVUdw=;
	b=E2TTBwDy/OcVLE1nkHljZOCYjgxNrrTEpYB8ZJgveoa2p6cDdMSwesLqgg4rvSdS9Qhm
	 /92OOzLa87Ac+o96Env2EgWl8ET5stsCg53RGe2cwd//f69pOWvCM+/ZGttPK5/fvrQrG
	 zEgzv9uidE3to+pK4hg3zp9y+2MFtwZ/7txXiW9il+wGXsyTf4SO0uNxW0rVHzo9evMQ5
	 9WIqXWjHwq+m2rTzU2zswt3YhKv+SE9rt6/0aFvpLDy8mVz5VXm54pBBrFwIrPaTjUtoE
	 M4S8phtQdDI8O8BZU/Aw2SGA/4utYLd9MdPw+3ysoJyD0BeCRx9Ve0Z+li4NPUucdog==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793047270;
	bh=UKgAWtlewM7SnrTYU0PSJFmMvp/nZV9OBwXEtlzVUdw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OaHrQIqIp382EBpYv7MO+YZf0IY/5F81hAU8sSeWzHjFTcQ20tvDh/7bi1fnZ3yjD
	 JvglbkNf6Ky6BqJ4YARDU4rWYFHeTx5qGgQurvrxGWWyeEzkdDG8sV5mBKsfMkCpV3
	 61K2YlkTR5y7vc8c5KwTxl9y5y9z5R7sZpMnR1jn1HXK8qP8WHIy83DyKQp/t2ADvA
	 jJRZVW03XEPqYNS/OGpMmH+dBU8/KZOxfUdE0+ZSOyBD//bH4HKGarV1FlfcKLzFPs
	 GzcyCcVpAwLm7sSYxj52ScLYcvgVvudZ5ObVImv6gsL2m/bkV1MsJzFwd+1RghH5nE
	 mf+OaH50Q8zAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB894053C;
	Mon, 26 Oct 2026 20:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B260B235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9878C4053C
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RscFGOjFI0VF for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF04340539
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793047266;
 b=aZA6syoiGR5pMei686E9vgRTlWtnwHu6AJR4gRwPOk7dbvnHFxJCuip/1xNYQkZaQNbW
 WdwCVzUtBsHCLLsrZDCdmByH8SDedDBX2DWSUt9VWOpO2qgMrCJr4uBVSCSEnKESh2noy
 cWHHl/v6d0yCWdvtxVQ1Fu/dlcbHJDSw50t5hSuRE0WUOGZCRtUT6oT991Th9IphaN2fp
 o34+x2S1qKGrrAteBcm5OE5C5PKF0Za2FwIfgwEJhTsWqOiJ8gNq7LQGRhfE+/FEBKaPu
 KadwkrrzEyhd0a7VxDpLH/h2GlPNG1vI6mKtr0GzgNmIH8Va6tTzeb5BDrDsKKg07Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793047266;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LBDl4ty3kmxWbZLpiSETQUiP/LdiIOAnmMPDxORe3Qs=;
 b=FGuuna9awYHHsB+L/0v5oS16hro/penqQeJsjShYSK7y3zkOj8L4KqVMYhSEOyl7N0KS
 Cxb5V1oPSa2VwaAV7PPIKzMa+ePWvQTiax2JEH9hSXT/mCdnsBtRv5q1sE16T6T67wdIr
 fREAciQwKE4SyRnTGLxSix0Jm1FBEppKHAP6mxhsIEVJ2/N0K7jWPIc24QbjHAzevWKvm
 CywSsfgX4ZQjl9tczi0FZMU3uMHHSjiU0Ux/63bvv8shbIakjf/dqphaRkOjHgMXzVpoV
 XWATmQPWihyV8UutVvkskTSkHulJJLdwx0MdqUZQVtXYYbVNsAGoH2eUYEAMABDA9uw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF04340539
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D06D09CFF6; Mon, 26 Oct 2026 20:39:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 21:37:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6a653e5fc31ab9e0e0b105583a693938b59711a
X-Git-Newrev: 56f15ebd01b1057fb7d28574c4176e837b586fae
X-Patchwork-Hint: ignore
Message-Id: <20261026203940.D06D09CFF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swtpm: fix license information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56f15ebd01b1057fb7d28574c4176e837b586fae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The SPDX identifier matching the LICENSE file is BSD-3-Clause [1], not
BSD-4-Clause. The LICENSE file was last modified with upstream commit
5f1ef9565df074b918a39cb4885af4190c98edb7 in 2015, before release
0.1.0, so the fix applies to all Buildroot stable branches.

[1] https://spdx.org/licenses/BSD-3-Clause.html
[2] https://github.com/stefanberger/swtpm/commit/5f1ef9565df074b918a39cb4885af4190c98edb7

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 "package/swtpm: add host package"

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swtpm/swtpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index d6559c22d6..3357be9c39 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -6,7 +6,7 @@
 
 SWTPM_VERSION = 0.10.2
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
-SWTPM_LICENSE = BSD-4-Clause
+SWTPM_LICENSE = BSD-3-Clause
 SWTPM_LICENSE_FILES = LICENSE
 
 HOST_SWTPM_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
