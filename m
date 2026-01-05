Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3309CC79F9C
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 14:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83C960A9F;
	Mon,  5 Jan 2026 14:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxRNJBiWmvwX; Mon,  5 Jan 2026 14:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E1660607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767624075;
	bh=cF4edI3Pocdqu7VAcDGs5IBJ9/CsU1oa5iCkIiEBMYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=NpYNXCdNEvGeVl1esNWnXVgyVZXtRzMj0LB8i0xjRXj3pziDClQ5fbmQ6pLP1vByg
	 NQeZwjU94PaHphzH3rl3/s4j0ocJEh/yWkf4PkDidW0qcAxXC5oiVzOI8h0vM7t++k
	 AWh1ssSllral460S5HXm5rOLdRD5YwE2J8kpX228VO1d5v7qqrOAtPTvUFLY/6akfX
	 9fB1YzlCc5fY/EyOhnVXJUMiJmC5Gp3HRnNjXYLNDRhmLE72TPROL+XHCYsxRzkNHe
	 Fax0irATDrPr9SM1STea1g9uj9j9oeEX2CFqMHSuTXaa3JHzs2XrFyh3EXoTqAtb+K
	 MlEZT8+DkC7sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E1660607;
	Mon,  5 Jan 2026 14:41:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B775249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61663807F1
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IkgV19Lus-H for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 14:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A36E807D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A36E807D8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A36E807D8
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.30.53]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DO3-1vbNer3z0n-007N5H; Mon, 05
 Jan 2026 15:41:09 +0100
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 15:40:46 +0100
Message-ID: <20260105144048.16235-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:nVIB5lhj3ZFbKBeV4rff6VwEiTiQco0t/rb033pN+Vgnkg7yNrm
 x88BMKtZMN5aVhFJu1XtvoM0mjYcsk4j96AxF0PWYxmLwdaXQakKOb5ftPKJrYaDhU2j1wI
 /LUDB19PeSw8pAsuauhsn38nioibUstnqFdx9MaN82YKNopXsSeVkSzrfG5Wj1ZUzfaEm87
 35Z2L22W7qMgrgcMLcflg==
UI-OutboundReport: notjunk:1;M01:P0:VeMaNlVtcSQ=;K+bsYx1ig9Nv2V2W9ONMkMtCiJR
 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
 vwiz5Enu0QByb0RCjfxy
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767624069; x=1768228869; i=fiona.klute@gmx.de;
 bh=yMEczos5PC8QLv92bmwloNXlQ2Zx3PBfN6LqbFI7SWs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LmNKqfEyjg8V0fhO5OymvnD0H7SAly3LjnsrOLVaj5l9JPAcV07+lvquSdo+YeGs
 HWyh5DTiP2edAwZl6kLq87a+oZE0FN2PgCo4q5aXff7OzCD2vIaCd7iPPJZwjYZ60
 I2RTuqdCAo2AgAb3sVpL3lI44onl+iL/TGsz+aAe8pmhNloVtRA+ykdqf5HDCNwO+
 9vrTg07C1nJCfxfDCRj4MsajIuueCwJJGhhYWiJWFGjE8Xs2O0BgLaa79+nbGoMIF
 KEPHHuaxfaBJXBPm7vKLXa7CzQJR20u7HOzJ+e8IwXdd3OZROkmnl+pFX6iOImQbp
 giUlKQfb/KNQoRYgqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LmNKqfEy
Subject: [Buildroot] [PATCH v2 1/3] package/python-rich: add missing
 dependency on zlib support in Python
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This did not show in the runtime test for package/python-memray
because that package already has the dependency, so the Python zlib
module is present in the test.

Package was added in commit 26bc4b51a808d73c09598035aa94f9c37b273218.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Add reference to commit that added the package (not in any release/LTS)

 package/python-rich/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rich/Config.in b/package/python-rich/Config.in
index d7f3cdf54a..9fb34f097b 100644
--- a/package/python-rich/Config.in
+++ b/package/python-rich/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_RICH
 	bool "python-rich"
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	help
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
