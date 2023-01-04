Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F589C4708D
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 02:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7156160FF6;
	Wed,  4 Jan 2023 02:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7156160FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d42ki4WtjGnF; Wed,  4 Jan 2023 02:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62A660FF3;
	Wed,  4 Jan 2023 02:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62A660FF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7D21BF47E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 02:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67DF881F0A
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 02:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67DF881F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DCgkpndfGn1 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 02:13:04 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB77F81F00
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB77F81F00
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 02:13:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CtAFp2abjalKACtAFplLjV; Wed, 04 Jan 2023 03:06:00 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 03:05:57 +0100
Message-Id: <20230104020558.1436469-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN7hdiwGxY15XfluX7ThFRbWPHUOiEFAl7etK22kSS9QtMZdRicVarfsKqWXl0/J/Gw241nVOeISwg2ww2fMVtQSXVkGAvJ5LxaQYNSAnhzWYAWswhR4
 aq5VOFisDj702jMv9GlrFUAEnrCdAGmYg595zw3ObqZRpijLf1ekhP+TASJsA4s+yWEAae6M6r8HsMj1ooXMwDRvFyYq0684pqf+n0h+nLefDZEcBUXrJYvn
 2PBavHiEwI+GTFHPC3KnicVlICpJStt9csFOwN9kmBQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672797960; bh=UzHaGRImxkd6GqQpY/j8dCX0QMzBLVqKRtZ3gXFqWcg=;
 h=From:To:Subject:Date:MIME-Version;
 b=XkVIg25JF2umueQHxN+4XMoMKQLG1UT6ZQ2hHDZlAxwZbu+a4mAwjUzrHBFEqJZcZ
 0trCrY0ql9Eo5bU6aejugKGe0G+O9hUV7frSS/o6j96JRI2UMPDOn28xX1MVwJx+E3
 eD4q7E+9G4PjayZZueQqG2tCRbVy4wNihGKnnYNGoKVJyi0oBrK5tqIcj6sXcPJqKs
 YXVfKh5djqUEKbE4O2A/P25/5A4O8Q7oW0/i0AqbKbcgJkisyx9IRr/77M6dHum560
 yoQeiyRwo++JIgnM/+VziXDpbqNIj0Nkht/L8mMEJycFUIzvjiLB1AygKLKtUaC6H8
 uNAgEe5m5lgkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XkVIg25J
Subject: [Buildroot] [PATCH 0/1] Fix Linux Version Probed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While trying to fix a bug on rtl8723ds I've found that
LINUX_VERSION_PROBED doesn't contain the x.y.z Linux version but
it contains instead the command to obtain it. I've found 2 errors
and 2 fix for this with the patch you find.
I've checked the LINUX_VERSION_PROBED even with make 4.1 and it was
wrong as well as make 4.3 and 4.3.91.

Let me know if someone else can give a try to this patch. It's mainly
used by drivers and by linux.mk to strip build/ and source/ folders from
target/ and I think that that part is failing.

Thank you
Giulio

Giulio Benetti (1):
  linux: fix LINUX_VERSION_PROBED content

 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
