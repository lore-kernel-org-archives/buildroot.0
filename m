Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BE1C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 23:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F23829B1;
	Tue, 20 Sep 2022 23:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F23829B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bam-nSTssOL1; Tue, 20 Sep 2022 23:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A3582978;
	Tue, 20 Sep 2022 23:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A3582978
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 064101BF377
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1DF740632
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1DF740632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yf1zSiFXOkAl for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 23:00:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD4154049A
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD4154049A
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 23:00:45 +0000 (UTC)
Received: from 91-153-34-150.elisa-laajakaista.fi ([91.153.34.150] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oamEK-00Emre-0C; Wed, 21 Sep 2022 01:00:39 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4ddb1ab6;
 Tue, 20 Sep 2022 23:00:29 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 02:00:26 +0300
Message-Id: <20220920230029.1680134-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ABxJCns4sNBQ0HSk9/EpZpsb0JLymDyzB+/BXfzGs8=; b=md4ilaSNZzhk6iJFjhGDKPBd+/
 H6RAUWVsBMNnBNxev6D8bRHqkUQOMBHTet0MRZRcHsXaByFS6e8YfkS7yri06pa7QdZbTWwJwyfKp
 +WQXS8UImrvZU8EGITew7Amc1oRukA2nTUv4WYaFHxYqRiMmcbiP+RII9cpm8DNcTmvMCCWv3f63X
 IVKvDsiVPakphcsf9I+/rXTUT7CaMc3PFYVkM6/mhWnSJ/satnlGaHkxTcOZRjqeoGKOiUxiKBvLS
 wWLMjdHDEnX3XaIZBbVyCimigMLTap1L6jJTwrLx+HQKtVCxk0oMuNuBagY/nxFf4Xfj28M8bAmzv
 hzemzvfg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=md4ilaSN
Subject: [Buildroot] [PATCH 0/3] Update WPE WebKit to 2.38.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series bump wpewebkit to the most recent release, updating also
the libwpe and wpebackend-fdo dependencies to the recommended versions
for 2.38.x, as documented at:

  https://wpewebkit.org/release/schedule/#compatible-components

=)

Adrian Perez de Castro (3):
  package/libwpe: bump to version 1.14.0
  package/wpebackend-fdo: bump to version 1.14.0
  package/wpewebkit: bump to version 2.38.0

 package/libwpe/libwpe.hash                    |   8 +-
 package/libwpe/libwpe.mk                      |   2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash    |   8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |   2 +-
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 328 ++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |   8 +-
 package/wpewebkit/wpewebkit.mk                |   8 +-
 7 files changed, 347 insertions(+), 17 deletions(-)
 create mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch

-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
