Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7AFC83F1D
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 10:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE6A608F6;
	Thu, 10 Jul 2025 10:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yoBAKB3iH-Li; Thu, 10 Jul 2025 10:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEAF860D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEAF860D7B;
	Thu, 10 Jul 2025 10:42:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D917112E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA921608F6
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_NCBMDjUDMp for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 10:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.157;
 helo=fhigh-b6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03DA060761
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03DA060761
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03DA060761
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:42:04 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A3F177A01AB;
 Thu, 10 Jul 2025 06:42:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 10 Jul 2025 06:42:03 -0400
X-ME-Sender: <xms:-5hvaGrPTBazb8c5vXDjiJFoXUVNvvqCk_zFwPQBrjgyRk6m_C5M7A>
 <xme:-5hvaOQ-Wn4IKqFO1NPsu7CrwTrgp-picUzss4WAuKBWJiTF1rPm6RSk0_Fg5l3J1
 _LuTmISc2Kk6vJxTi4>
X-ME-Received: <xmr:-5hvaLOW70S96bp5YLbiiPW1NCLTpVtkwMKNjbUkOVH6bJx1f-dpjEcNReuKH2jlpLnXj1OMx9nU0OWnIhTBDptlGmwtGAtGdBMcOjIIf3djYtaKRXXc0ghjxgKkt36TSwYKVa6ihboJuSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffufffkgggtgffvvefosehtjeertdertd
 ejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetle
 ekhfeugfegvdeuueejkeejteekkedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdr
 ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeef
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprh
 gtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:-5hvaJME6vbcSvMsW9ySiklod3hFXWeGj48v6jaQu79WjN4SApX_Eg>
 <xmx:-5hvaDuIDvwuCEzRQZHDYrWzt9EZTy1RLENZFpeVyTGNREiaprZOUg>
 <xmx:-5hvaLV-WouD6DHNv9PV_3LuppR5zGBEUfXwPFDbZ2EbDGk6EWFlcg>
 <xmx:-5hvaDsSzHKiOiyKjDjul7XrtiJ44nWUIb3-5EtBRTvBYziGLLOMGw>
 <xmx:-5hvaFtlskLKBEc0zkSQzB5jEDN4spqATcJAFyeiaXro9SRKbp4jrbYx>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 06:42:02 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 10 Jul 2025 11:41:55 +0100
Message-Id: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPOYb2gC/3WMwQrDIBAFfyXsuZbEWBp76n+UHIyuZiHVoEEag
 v9em3t5p3kwc0DCSJjg0RwQMVOi4CvwSwN6Vt4hI1MZeMtv7b0d2BKCdyrqmVk1EdMohJFDj1p
 1UKU1oqXPGXyNlWdKW4j72c/d7/2byh2r03ISxvYGUT7tsrugtqsObxhLKV9LabbUrgAAAA==
X-Change-ID: 20250708-loongarch-fabi-ce44d983eca1
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=owx0Oc/yju5djxHUbP/syJveyVv6BZSmyhhV7kYlrMw=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoz8GT85nqTLfJzxwm3mE+4PbzhvSnH+zTyx+d0Jy69Kf
 vv8RGSOdJSyMIhxMMiKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBE6vQZ/iloz9O161m1r5Xz
 cLVI3dwV/RrufgxSgpuvvK0ukjsz25GRYX/IeYUfHBvYepjq3lasTvhZKL9U6O6WebEaW27xOXp
 58QEA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm3; t=1752144123; x=1752230523; bh=ys
 2N5Vwy6ZAo+jhC2TBsQ7lgLKvqtjW+xrALkl2LPg8=; b=Tesj3zJ3KJ9onCRG9X
 e0GyIwhIeomhjB1TRIZjWe8t7hHMaEbgsDV9BVDySx8Ki49g9YSTyDBiTHIToxzk
 1ZR5NjVctURQaWG5vQJ23uOtXtdapZ/LyiL6HCYzb4u9fuCtgpFdZDhaOcH1er70
 ijKKw2kJMRxueWBC2mrKroBbnSGpveOXyN7nYfVdRmdJfk/+pA0p4pQGlzhntSXB
 +an4d9ZTWSBijIHBrr9fmExr+pMz6+YSP89D+QssuK47x4I47ALDepQz9Q7KGmx6
 fZ7eUEn8THWPGhZD3+t38hDTitIjwiT96Bg9vj35yLoB1QU4k4+VqubOhtJq94ur
 e5ww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1752144123; x=1752230523; bh=ys2N5Vwy6ZAo+jhC2TBsQ7lgLKvq
 tjW+xrALkl2LPg8=; b=MiE9aoMd5wCa3OfbH1g9pTwa3/X0eykcqtLheYBuQ7xC
 cjmRocxcN+CgIB7UHeH4DCwKHs9XWAtqFUtU0ywF2WpmWM5qIEDSQi/VXvB+AyOx
 ZWCuO5FBPvG3qsXYOb4PA+iizVWfVe7OONDEJaO9pqqEaRHzFOwvuLC9PRyywBJd
 pVruyIVXAGtHcP3DNl9xFkpgGpnCV3n2/JGYu8VClHJUt2Te8nDzju1Mi3JLzLeG
 k2Af0gYUYPzwtbYH6T4APC6quOyWXQC1kVcgqjDBCqvzrrO5T9AclDqtfaFGTRpO
 xQ+hoNeUExpUHVOD3XgxkEacnxj3A02Q/EDY0wJIbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=Tesj3zJ3; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MiE9aoMd
Subject: [Buildroot] [PATCH v2 0/3] arch/loongarch: Fix a couple of
 toolchain options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This series fixed a couple of toolchain options. many thanks to
Julien and Thomas for reports and suggestions!

Thanks
Jiaxun

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Make it a series
- Link to v1: https://lore.kernel.org/r/20250708-loongarch-fabi-v1-1-1c9b4df3dee9@flygoat.com

---
Jiaxun Yang (3):
      arch/loongarch: Fix toolchain triple ABI suffix
      arch/loongarch: Mark lp64f and lp64s as broken
      arch/loongarch: Fix minimal GCC version for taget arch options

 arch/Config.in.loongarch | 8 ++++++--
 package/Makefile.in      | 8 ++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 09880508cb26260f30608137f697b6bdf11483fa
change-id: 20250708-loongarch-fabi-ce44d983eca1

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
