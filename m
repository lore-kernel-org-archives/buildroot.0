Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A14C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4628260722;
	Wed, 15 Jul 2026 19:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k98OLvAgJxjM; Wed, 15 Jul 2026 19:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1B860707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784143073;
	bh=mDJPmJidTprBMwHmFs1N8GcFUvno3Dn0zTX9T0ILmrc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DQYCiBVY4/7AROTot5psJnvVjpAs6RTFbiB9UbKlfUsQRCL9p3Ezui4bhNwOFn4qf
	 a4eJis9RljI44s4QR/DXOOI54/p443EfhUEg7z2AiCqZ5ie2iPtNx3j/XRCri2b7zI
	 ybZGk6GU6neBFjg8xX5yxImpDwfqSyzoL95QmRQIdi7zuWqP4mGV4b4b3JiyJNlVFp
	 mdeL5AxcvLIbYBH9bqoh0IqK5ojiwOiF8nMQqausq+mBz6ha1vTEIU/kH/CBLW2BSy
	 ifdtRKWNgvXJojaXfljCG1DYXBrfbBDfbOhHAY+pdWCidRxBm78V8zvftPirBw9hBv
	 qD7eKCu1QmOPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB1B860707;
	Wed, 15 Jul 2026 19:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C7F203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DB6080DBC
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAFf6CdZPyOt for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B38A080DBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B38A080DBB
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:17:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5835D88972; Wed, 15 Jul 2026 19:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:15:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b28a6ffe13e837c49a714c9630029071a10bd650
X-Git-Newrev: 013c6e52b8858a7573b30f1b8f835faf4286c649
X-Patchwork-Hint: ignore
Message-Id: <20260715191716.5835D88972@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/migrating.adoc: document the tarball
 suffix update for Cargo-fetch packages
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/013c6e52b8858a7573b30f1b8f835faf4286c649
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

We changed the suffix of tarballs for Cargo-fetched packages in
commit [1], which affects out-of-tree packages, so it makes sense
to document that in the migration guide.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e8c8bd9bc56a827db90c3bb2e71e4613a5a2c730

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to the commit changing the archive format]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/migrating.adoc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 230754be76..68f09e1bae 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -258,3 +258,9 @@ from +true+ to +false+, in line with upstream defaults. If you need
 +EnableNetworkConfiguration=true+ to let +iwd+ handle network
 configuration for active wifi connections, adjust +/etc/iwd/main.conf+
 in your build (see xref:rootfs-custom[] for options).
+
+Due to the update of Rust to a version greater than 1.96.1 $comment was
+added to .cargo-checksum.json to clarify that this file is not a
+security mechanism. Tarballs generated by Cargo-fetched packages have
+changed, therefore the suffix of such tarballs has been changed from
++-cargo5+ to +-cargo6+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
