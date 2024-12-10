Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E36E7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 15:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7F080DB5;
	Tue, 10 Dec 2024 15:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8Fb52zycRvY; Tue, 10 Dec 2024 15:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3496F80D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3496F80D9F;
	Tue, 10 Dec 2024 15:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27AD4ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 15:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1024780D9E
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 15:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdXTmM6cEZzg for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 15:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.59;
 helo=send220.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEE6780D1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE6780D1D
Received: from send220.i.mail.ru (send220.i.mail.ru [95.163.59.59])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEE6780D1D
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 15:42:45 +0000 (UTC)
Received: by exim-smtp-598667c6b5-t6m4j with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tL2Nl-00000000DQG-41rB; Tue, 10 Dec 2024 18:42:42 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 10 Dec 2024 18:42:40 +0300
Message-ID: <20241210154240.1380886-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B739379E53DE709585AD0E3AD12D25CAAC728D94BFE54185182A05F538085040B869FC875806B0743DE06ABAFEAF67057C6B080D155015856EDBBE88E6DFA98FD599AB4818251001
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE728A881FD0F09D355EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375E5376F82D9E62E48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D885060523EDFADF2A2D37918CDC6AD8AF284D3555531E61AA20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0C7E80E60854EA9278941B15DA834481FA18204E546F3947C17119E5299B287EEF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063767B9C6E70FBE8DD8389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B2FFDA4F57982C5F435872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A58A64E3B7EEB3D59D5002B1117B3ED696A36FD618DE2281FB406406D89DD9EB8A823CB91A9FED034534781492E4B8EEADF4F3DF47829F65C7C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF102AC1AD4B95E5FEFD71CDF2E2814FC802AFE10DF1F45BFDDEEF07421C379A7F46C06E59B4E81405A0626FDB23E8EA70815EEEBA9CD4CB103884AF983B2682B899F1F92BFBB8D38F111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojwdtfQel0s3ky+Y2poaCoQg==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21962BC0FB6A72FBAB0539FF2E3F78588B8ACB0A91446A0B2F090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=OEk4fSqaqTrWjU0SVgdFn9oKQQGdcRbRN3eIR8wm1B4=; t=1733845366; x=1733935366; 
 b=P4F0D3kv/mv2Ljwy4s3rg3p49HD0hDr5A+2zfrmRw5c6BlbGQ8DhfKKP+sd+fYr+ZxJHBMxdqHj
 ephZ4Vm5CXtkYksfuQpiPqlrtatWXtzX7vvqQzlRaafnVvCxhW8NhTG+ZFgJt/ZhKgkKroCtYuoEL
 nGrZphDnBfNS8g+iH1JVjv0zSIaV2PMh1q2q/69/UiX5SJnhdW5o94WxQaIGbtXofFU2W+aeXaSrn
 BOQj5cW/9leSolyghRW8FCOp8AfjB4SVjHK7YqNM1yehtWSR80nJ3Z9Q7TY6U7++BW0nKZOh9ubFx
 3NMwX/ifrAnfS0mU0EN5VpiX2xa9BZCjt6ZA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=P4F0D3kv
X-Mailman-Original-Authentication-Results: exim-smtp-598667c6b5-t6m4j;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: add patch to disable
 docs build
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

docbook package is needed for building docs. Build fails without it
if xmllint is found on host:

I/O error : Attempt to load network entity: http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
../doc/src/sgml/postgres.sgml:22: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
]>
  ^
../doc/src/sgml/postgres.sgml:24: element book: validity error : No declaration for attribute id of element book
<book id="postgres">
                   ^

So disable docs build.

Fixes: https://autobuild.buildroot.org/results/711c101d9a4807fcb59cff2b7c89454f96cc3e2d/
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...ld-drop-docs-build-from-world-target.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch

diff --git a/package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch b/package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch
new file mode 100644
index 0000000000..92ddbf7da6
--- /dev/null
+++ b/package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch
@@ -0,0 +1,34 @@
+From 304889951e5fd2b40864770ef2432c83b68c0c1a Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <fido_max@inbox.ru>
+Date: Tue, 10 Dec 2024 13:55:09 +0300
+Subject: [PATCH 1/1] meson.build: drop docs build from "world" target
+
+"world" target is used to compile all the PG extensions and
+plugins. There is no way to disable documentation builds for
+"world" target. However documentation needs a lot of extra
+xml/sgml/docbook tools, schemas etc...
+So let's just drop docs tarets.
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 005dc9f353..2504a3c8f5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -3588,8 +3588,8 @@ alias_target('pl', pl_targets)
+ alias_target('contrib', contrib_targets)
+ alias_target('testprep', testprep_targets)
+ 
+-alias_target('world', all_built, docs)
+-alias_target('install-world', install_quiet, installdocs)
++alias_target('world', all_built)
++alias_target('install-world', install_quiet)
+ 
+ run_target('help',
+   command: [
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
