Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B887C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAEA835A9;
	Tue, 31 Oct 2023 10:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FAEA835A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhdK00OHoaTC; Tue, 31 Oct 2023 10:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570AA83595;
	Tue, 31 Oct 2023 10:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570AA83595
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 773E21BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 10:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D35D6129F
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 10:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D35D6129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOD__joLx55H for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 10:22:22 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 072906129D
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 10:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072906129D
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 11:22:17 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2023 11:22:16 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 11:22:14 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 11:22:14 +0100
X-IronPort-AV: E=Sophos;i="6.03,265,1694728800"; d="scan'208";a="59898052"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 31 Oct 2023 11:22:14 +0100
Message-ID: <cover.1698747732.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698747743; x=1730283743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LSpPsierd12c+ZiTQgEjNauGUdGxpiq8M5EheA1hiqk=;
 b=VL7hwSpT5M6RBxazp2k0CyvFhJcPUkAnNetmZWG1Pd4PKax+t+ih4MrL
 fkZbqWdSiz7FadggNcoMV2zMeuiVR9cNJ+0le4EUq9Yl36Tic5uxkCvT9
 R+Evg6N/EPwvfMvS6oypn5C0Q44PcaDYZvZsiz/hWUpJcPkcpUlbjuREV
 7NR27R+k7CiRcu1jzHDrjtDSlSGy6EiRySGg79tw+mPVm4ysD9gt0DHkV
 Ip1SPWcbzuUlQgq9NQZa0LRIabHdIkaFZiqiZp+ie6NruEVq4xL4l9kdV
 iuz1qrWYadXRnJg0yRNFgmti1flFl2JGcjqPCSOUsq5+4setFZdDJ0GPl
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=VL7hwSpT
Subject: [Buildroot] [PATCH 0/2] utils/docker-run network improvements
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

Make our utils/docker-run wrapper easier to use in corporate networks:
  - don't create a private, NATed network
  - expose the user's proxy variables in the container


Regards,
Yann E. MORIN.


The following changes since commit bc8d214e988b95b125ad2b9409286cbf820370b0

  package/python-django: bump version to 4.2.6 (2023-10-22 20:37:13 +0200)


are available as patches in this mail series,

for you to apply patches up to 31538ce771c6cd9f4719a969740b6ff04e3c8e62

  utils/docker-run: propagate user's proxy settings (2023-10-31 11:21:03 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      utils/docker: use host's network setup
      utils/docker-run: propagate user's proxy settings

 utils/docker-run | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
