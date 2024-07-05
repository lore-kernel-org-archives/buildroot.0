Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB357C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B47340F4B;
	Fri,  5 Jul 2024 09:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myGId5KQmCKa; Fri,  5 Jul 2024 09:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FC240C97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83FC240C97;
	Fri,  5 Jul 2024 09:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABFB1BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17813408FA
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6wLyJSqaLl1 for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE8D84078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE8D84078C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE8D84078C
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:45:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.231]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQkE-1sCHQ40Iy0-012bpQ; Fri, 05
 Jul 2024 11:45:08 +0200
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:44:47 +0200
Message-ID: <20240705094449.8550-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:HW4Etpw4OajoM6nYjbvXdkXJna4TDVuKMklzdHqhbPQ4rPQCVmL
 ajCnJ7pO0s1ktpBKonOTfnKczcuodljzWIdRrfRajhlVMVhj/O6OVEl4Xm+9vevjvevAAML
 htMC3RjffD+MZIzkMoaBjD5TjBVw4BEdP0AQ4FLTmWb95dMwyxfQ7nh69Y6fzOBFSXsCoxj
 vnUijFlxh8ZBq1lJxUwyQ==
UI-OutboundReport: notjunk:1;M01:P0:pJW3TWOAB8o=;hnsmnyjRiEo/ObqUUHjTQPJkjTm
 qbSjlzKOKEbnyyo7/4/Z8rcM7klAS//Mre9Q3DRbJyfEYagEFji0ERu7t0zzoFR6HUvL8p0gY
 4v57k+lO74ld5noPgIdmkiMmpUc2g+BGyk3IauIYoEVLdQzNJn0QvLMjuzgSh4Xa5IshD6cxS
 1OEy8Ng1wUKMhFj0kFV1J6GZ5VZR/1W8lr2XY7oZaY+rbGeIHLE0nx+Y/Qg4KJ/E8IGoqJ1FD
 dhIWrWY93/gadcKvfJqUCBJh7P+NKJzM9tD/49Q3ReGeO8/XE67zH83ddFaxumHxMW09TgjvH
 +/fQo+VaiwNqioqO13zTg4rN3IW2UlyI6VX+nM+C7Va7To8K3LhFiQd8FxqJ+D22iiCTcQvp4
 RjDtyiekO8sSdrmCam7eK+4AJNTTGroBE8CrR6OgQrZ8yuugIqxrhoJxVNpufWMXkryj6t5EH
 pu+dRBijE8uRM7KXyiqr/ILsa/38fJB/t8LI6BqicpBmj0opc4fiN8zRkyMh5NtwdSa0dhFQn
 0iykn84ip0mWDVkN98763z1M+cH4bPjlLc9sJHBNjvbBNAL46uJlYj879hjYNZzBVayKGTt6b
 gBvwWA8coz0PbEeBWgIWq4+VWP6fc85kR/8qMT6InKVB0Z2w+gdgfHS25xWF2VnAPNMlaoSf2
 QVspcHotc/FAKU+diyLa3GGIcFEiBnfPm9Q3IszQhNMEVpEm2tlFRYIvFj0IotNaX1xZlKiVZ
 vcHK2v/Zj99/lNnZsG9UaVzhAgqBfJ3oKKX9pO1eUU2KzPnjxGd7Jp7GxWUlQne9AnDq3aUue
 dgHJ3iXzGmXHcPZC3cNVsHt8jcx24Md/uRsui7/RK2v8I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720172708; x=1720777508; i=fiona.klute@gmx.de;
 bh=d8dPN1V/K+mCyfPEZEvS5s9nA8vLS/8x8qm4xkuHZzY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=l7B7D6QRhK12LloZqE2GzdHS8qgcCLMdsmg4UL9o/e3Fz2rAUINsohIL3ZfODPCO
 ShRjwPzeUKAl8JLQuaW2JMACp4FaAg7eRruZNZYW8ZZZ9uMjqTXEXGhfk1+vll8IH
 YaScMgKJPEfGS3iEQMVVL20PaDPVSNaygfojQyMrVQr5nT/pObpY6Ry29M3pMj4Hq
 PdEWqeC37lgjb1acnS4rc2a55CLgR0ooTdsqtNZtARQvib4mgECTP6+03Bx4kY3Sn
 1qm8SU0fHH2Bhm/TZjLKR2iBf0Q+SF4rtwxS11/x4GQKAm5BKG5/P/wCl+bUUv0wK
 UpUktp7eL83I94hA2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=l7B7D6QR
Subject: [Buildroot] [PATCH 0/2] Manual updates
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

These two patches integrate points that Arnout Vandecappelle clarified
on the mailing list in replies to me into the manual. I hope I didn't
add any errors in rephrasing them, please let me know if anything
needs to be changed.

Best regards,
Fiona

Fiona Klute (WIWA) (2):
  docs/manual: describe relying on default options
  docs/manual: allow sponsor mention in author name

 docs/manual/contribute.adoc             |  4 ++++
 docs/manual/integration-principles.adoc | 18 ++++++++++++++++++
 docs/manual/integration.adoc            |  2 ++
 3 files changed, 24 insertions(+)
 create mode 100644 docs/manual/integration-principles.adoc

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
