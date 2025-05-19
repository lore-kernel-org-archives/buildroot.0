Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E801C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 07:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACF740CF8;
	Mon, 19 May 2025 07:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obV0fzi8kQSG; Mon, 19 May 2025 07:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C9740D26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73C9740D26;
	Mon, 19 May 2025 07:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53653193;
 Mon, 19 May 2025 07:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43A1160EB4;
 Mon, 19 May 2025 07:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoWGuVIhxaM6; Mon, 19 May 2025 07:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F3D660E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3D660E91
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F3D660E91;
 Mon, 19 May 2025 07:53:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 022081C0F9B; Mon, 19 May 2025 09:53:06 +0200 (CEST)
Message-ID: <862f82a4-c0bf-4ee0-b406-872a9c97df4b@rnout.be>
Date: Mon, 19 May 2025 09:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747641187; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=Qihp/BKwU+7U+CqcwL89P4/qbwFRUzuh603zjZyogs4=;
 b=TZd766ykHlJ+eTentlbqiO8yx6MYc/x5dViDLoWfZ3gdlESHV8CCtm4mBm2vC4r30hI6mH
 3bZKGdzzriLd4dnDoDsRFaRZjKKEjIW7OBe4yM8Z9xIY4FfRuEh2OUII//eLQBPtxGWdVm
 TL89zoIingyX/swjudQZ9JTbf4hxQCXxFmVqEP2rTBmhsRXmEC8twlMAAgmXt+2qmivieU
 HSu3pNGAizTzvsinXWANBx5CFDkL6v0jj8yIuzXIc5QCjrEHdu9mlLul/NiDsowAaEuBy1
 I6p7CXXAEZ/XnNcqcTaHZq6GoXLhSplsiiVcWK9HfF+l951A0q+lbCq/YooGqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=TZd766yk
Subject: [Buildroot] Buildroot 2025.02.3 released
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(https://buildroot.org).

Buildroot 2025.02.3 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2025.02.3.tar.gz

or

https://buildroot.org/downloads/buildroot-2025.02.3.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2025.02.3 tag)


Buildroot 2025.02.3 is a bugfix release, fixing a single glaring issue affecting 
the 2025.02.2 release. A patch to the libcap package was wrongly backported, 
causing the build of libcap to fail. That commit has been reverted.

Do not use the 2025.02.2 release, it's very likely that it will break your build.

Sorry for this mistake!

Regards,
Arnout
-- 
buildroot-users mailing list
buildroot-users@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot-users
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
