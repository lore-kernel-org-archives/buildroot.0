Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB3BC0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 13:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A7161127;
	Tue,  1 Aug 2023 13:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A7161127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YnbkG71o3eWz; Tue,  1 Aug 2023 13:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D1260E46;
	Tue,  1 Aug 2023 13:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D1260E46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D72A1BF97D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2707180BAE
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2707180BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcWDDTeIggCU for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 13:18:30 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Aug 2023 13:18:29 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC80D80D4D
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC80D80D4D
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 13:18:29 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 15:11:17 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2023 15:11:16 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 15:11:15 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 01 Aug 2023 15:11:14 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,247,1684792800"; d="scan'208";a="22653886"
To: <buildroot@buildroot.org>
Date: Tue, 1 Aug 2023 15:11:14 +0200
Message-ID: <cover.1690895462.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX103.corporate.adroot.infra.ftgroup (10.115.26.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1690895910; x=1722431910;
 h=to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:from;
 bh=bAUua2mLPv+LAIWpd7XmqTEvuWkQJIniVGZH3FJIIeE=;
 b=bbB1IRFSXPxZ0jtddA1jpXj7TKnifsNt6U0NyI5Jhv52hjRIeKQBzQ2+
 SRkrVWBfxNjiohTGCWDiXxZmysefbLDV8AiSbPvIBp9pB3cRj1gEU/uUx
 wPDYDF56hNHoSZbWZWrbocHIT2eSMQdCVTVoCi/W2z9KpxAjHvbKaPxOa
 i5QtlLbKRdm3fpJBkKqx0WHu4l61Ovm6kD2npWMN6+7pnWkmFcrOamk0I
 UHGHgVn9S3zwBVbzhqpN+Um0O0SCxWKcaK7q02cIcpQt1yKKk3+r1DIym
 uAcayiAoZbt4L4VEP5tlWCKpRJrEBKFAC8bo/TTW1oFIOPtMPQhUG2Eo4
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=bbB1IRFS
Subject: [Buildroot] [PATCH 0/3 v2] support/download: enhance svn backend
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small series enhances the svn backend with two new features:
  - properly use credentials to retrieve changeset info
  - allow skipping svn-externals

Additionally, it also adds shellcheck fixes/exceptions, so that script
does not end up on the list of derelict scripts.

Changes v1 -> v2:
  - don't accidentally force submodules for git-downloaded packages


Regards,
Yann E. MORIN.


The following changes since commit 22e476d7886163484d233803b42a2a4c2b588a5b

  arch/Config.in.x86: add Intel and AMD GCC targets (2023-08-01 00:14:50 +0200)


are available as patches in this mail series,

for you to apply patches up to 2281fe5f1a1324621f726080c57b35374ab7bb55

  support/download: add support to exclude svn externals (2023-08-01 15:07:36 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      support/download: fix shellcheck errors in svn backend
      support/download: use svn credentials to retrieve revision date
      support/download: add support to exclude svn externals

 .checkpackageignore                     |  1 -
 docs/manual/adding-packages-generic.txt |  6 ++++++
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  | 10 ++++++++++
 support/download/svn                    | 28 +++++++++++++++++++++++++---
 5 files changed, 42 insertions(+), 4 deletions(-)

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
