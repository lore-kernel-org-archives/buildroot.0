Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D41E92710
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 20:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4761A80ED3;
	Sat, 27 Dec 2025 20:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b947_UiJjcpP; Sat, 27 Dec 2025 20:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98B1180EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766869106;
	bh=bp97Bo8TmRbjVIDtpmeT6bo9PSSL8EzgiRWuSRWGjyo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W9XEYIvbktMoHZKYMA5yZLqVUJtHhx0fuh7zZw8jtyLLy37C7hc7GCnzL03+hahiF
	 Ikg9a1KpxZvTI/jbou/d50XViI8/x/eNg6OF+OX4TAUPgJKzDpGpxKFYK/Yl/FJ5BQ
	 SoygAa89GvEsXHVAKj/Dzhiwf36PtQj5UMMIREgx+vyIS+ArDoH2R5iQUxzDgHWcar
	 XWsC7pAIoKAG3ie8uxcQPNpKsxLm4jeSBGg28djcbdgyKRO1QfdDlU7BVARF3k3Qwi
	 qvvgVB1FmG0mIpy0M+DFXpso+diVfrHpgJtei5kGEH+6GQVPTKJo3mQn7cGHquGRsA
	 B3KQFSNLIraOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B1180EC7;
	Sat, 27 Dec 2025 20:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 964FF119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88798405D5
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGJpObP4otgj for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 20:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACF0A405C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF0A405C9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C1BB8781A; Sat, 27 Dec 2025 20:58:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 21:58:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33479613d437a99dd51f9ac53095d168371f0cbd
X-Git-Newrev: 225f8a189987ebddf77abc3a34f782eaf93d06c2
X-Patchwork-Hint: ignore
Message-Id: <20251227205824.9C1BB8781A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add missing entry for varlink
 test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=225f8a189987ebddf77abc3a34f782eaf93d06c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5ffd0e5398..228311beeb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2295,6 +2295,7 @@ F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
+F:	support/testing/tests/package/test_python_varlink.py
 F:	support/testing/tests/package/test_python_varlink/
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
