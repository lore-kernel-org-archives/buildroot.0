Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC17606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ml1HkOWC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZQ/CTAUE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1A44054E;
	Wed, 28 Oct 2026 22:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L193GtLqjlt; Wed, 28 Oct 2026 22:35:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 75F1D40839
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226938;
	b=X4dzNb59lwVJvVbcWChmdTWfiCpp/nd2egfwWtXEVOQiD4l3AfXgCjjh4gQOsJrqQ9B2
	 zV+PMzU+7o62ku9wz7E5yiJ1KbqMx5sm7DuUpOjySQf0TvsWr3paPHNFuXz2DE/VkQgw9
	 QcVRzjNgFEYzhxBdTTLWLmnVQNRxE2rRlI4iUZmx3UbusXzTW198xK5/uE4ki9tuscboF
	 4aK1sWA0Rka0wM04STykMXBnbgb0DwxVyvT0nRYSgrC77nBT3sKsoqYnFOmNo1I520G7j
	 GclTOF+wbd4KgEVdA0v9GeoPhdI0gDGPPX4KkWvMbefsN61KowYsjbS1eaul2jQnAHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aEtlX1oqNnTnB+oUITuBr04fPXS4mr0TbGhpiP7nv9w=;
	b=WPM7vUG5vVBy3hAHwVFQVMyTKcnHW1TxZXgiv7+ccqk+ujRtWl6F7X4FmyDhMYAcux21
	 0ElOkX/4R95ZHGbFoSOijz4f//AAPlSQ2zh9aoENg7q61QOLFR8HHNoofceRnW81e70Tt
	 yDPZCYZ8u3j26LYNxGLy24rCaQuZBP7lAx/Dy1jzTJJvVj5yJXPaInQScvkVRUOY0XAck
	 QDjuJh7XdpE5W7qs9HX6i3ymbrRyZYkAEBRNfK1TjX1l/A0CRKQB0oCheDsB+eStbArSG
	 EbGnML/1+2oId9YjApZifP9mw+hieSOSFB9ByIZa4pNyUE5cAGyJOOPfYCxWhr7e+Og==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226938;
	bh=aEtlX1oqNnTnB+oUITuBr04fPXS4mr0TbGhpiP7nv9w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ml1HkOWCbw92bEfDohjPme0gP55RomOo3+gi4dZt60a1PJHJwhuQ8P1AByblKeV+C
	 t77THXBuedMD8fEvh5x/iinRRxwxluXGrvCHaekCknPDR8QZJEvc+9ux/d7cJ2TIu7
	 QZyaX5zW2HvpVieamgRHPuQkHkRM2vHEZKFB0CWZ/127D746p/5NehCMrY+g47Zynv
	 TzfLwjuYWWfAMTD4+MiZr9wSrlbXc7a0A1bLFg0Z2APqHsQcAEAt3PMmws3LxROiCN
	 /k9cHu4vUQpcrg5n0mbokp0iwQRJK1ao423l5ediSR8qCOp5kp4d+4lJN93sGK4mCY
	 qkzrBgn+OA+Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F1D40839;
	Wed, 28 Oct 2026 22:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 023E62A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCA5081160
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLbTIEKpv52h for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:35:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E43D81149
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226937;
 b=CaElZPJEmo3IKdReM6GhTiw677IPd67YD4Kfx/BnCt+IlxyputFgCliE/ciSzpLlVEDT
 /4YI446ArWA1wCgf3VfjpRmWWZM96pXwoRHUxLEp8xk2Vtz6mYqmui0rLhFiLhjZ2+EyO
 rbqSz7zwFo8WFiPtGpK5TQHqG6Z/PCipl97ZrTfxYeyAG2cH15a25GDLjeB67UBO3vYea
 Mi+nNmyO61lHO3cbQzbQwIz8LgRIG4+VylWONVsqw9nVJBZzevn8bTCVq1GfNHzdO+pIS
 qMcCt9juINtQF7CL8oT5E8Gfy8xhA9DaXDp3iDNb5pHnOJKgf/bOEYXR4s+HgEB5E2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226937;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SXYCIxlMLQZR42EIMam9mQ7ep7Gps1w/+ObvCSlLOIg=;
 b=FhpwP/XVtD5RjiUxG5168daZqQ4YgLKPyvtqYisIMTH/aXrJK7ZAtUmejLHKGdnkM/3L
 zgbXQBpofPbF9jLeR6ehNvT1KGTn67ON/f2F5bTedBpd+SCqeCDcnXxWitXHA0saVRCq2
 HnehmCmjJf5Nvl5O24TXhftup8P/MoRw0WhxCEPqJkBes9ywIH1R4OpnxrgzpqnQ8g916
 80pyC/CAaP5t7ehQ6aNCI1gM816TxRh3+SjPME1wZie5lhB5O7rrJROPsRHJzD4XrRYuu
 ypsgrK9NMrL+Wr2Dt4Me+LMXVmhpb7+c1ve6XCQqXofV9yzRPv85fAi034BovuLb7fQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="ZQ/CTAUE"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZQ/CTAUE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E43D81149
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226602;
 bh=SXYCIxlMLQZR42EIMam9mQ7ep7Gps1w/+ObvCSlLOIg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ZQ/CTAUEE5EZaLGLwscNf7/N7uCiXhkszPnIRUn2On0YcYubdPcWq31UUnyn+5Ofa
 +YmAyUgaQIqq9iMhNm0M7vcu3Nz+HSetm3lkgqrzdxTLMDZsxt4Ggz2Xx0EJEEliua
 EjvlEZRCN5cQ61WBxMj7zp/0VSxSAlO85W9VCPUt2+QiXp8RAXGDBsccEVJ/gkrh04
 qoQadcqTPjw6BdxF6qeCGzupsewnD6EXPewuCYXCgjd1kdFelQVq5aObqmzs8cy2rw
 JQWn94o2zuiO8EIBdp9s3syo5HxJEBWc6UYV3Zhfz4fOJVagr0bPN3ppGVt4kemUlJ
 AB+Ktd0QayuNw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 V9arE1LwPfKyZIN5Z1WNC237WkDQTQWkBDYwo1OnbTPKdV9lnXb0OSo5D29pknTGbboV5Md7ueQ
 RMTJhqmJPRwofyATJBLdXcvisaYTc7o0UOybCVnTEInurvILDy/jaMU6vMPBdzQtrUMSWEFNFMm
 GqPV7UeFGJQ1NiT+/Bqf+gnhR1ecBMfeHDOoZNBNmQwJcxO4nL/ZciUqk/QSqLLRjuKU81Ov1O1
 qWhV51KoKQgvoRm07/5XSgAuB78rChx61kS9CgZC0FsZhHEpMJGIHqPsGRGSh1xnrld4hJoHL39
 zXL2erzE/DjugnJCbSC1onjuRc2gQHEgqgKHEj35XLDekqWIk+htT6Pz3cvnHJmUkctQRJSSH+P
 FdG4AQ6tgGoIlYcUW+x8CCVf7CcIdmrrv7NpiS7z7TnXrZ5t3rwOiPjzDLYFpAC5Bt4BEenLJi/
 r2BGMHTf5XfC6crK9JeG0rlGfghIHRdgWwWMkJSKREgfxnmKQtuMHg5+gTcDeuS+Sbs0liOANzZ
 AgwT/zs2TFSrHPJjqa7UzxhJ5bBxu0mgcq/bCfkbnludCQcDohKnbgNjBTdQCI9t1M6kIcPz0Gt
 RZc2Sg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D77CA4C6FEA
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9K-000000001i7-42dZ
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:32 +0100
Message-ID: <20261028222936.514451-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 15/18] package/kodi-screensaver-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash  | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk    | 2 +-
 .../kodi-screensaver-biogenesis.hash                            | 2 +-
 .../kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash  | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk    | 2 +-
 .../kodi-screensaver-matrixtrails.hash                          | 2 +-
 .../kodi-screensaver-matrixtrails.mk                            | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash    | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash        | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk          | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash      | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk        | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 0210157d2a..a68c3ca3b3 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  468527220845a411af4dd021a907c6449327015fb848e61adfb46b47edde331a  kodi-screensaver-asteroids-21.0.2-Omega.tar.gz
+sha256  5682dd86180706b6bee99a3b16797378b68d64832abf8fde180e6e5da741e07a  kodi-screensaver-asteroids-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 878ab22c3b..f680a69cf5 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index c63d3be3e8..c7bd9973da 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de92f8773f23c77f388201d316273f1a06103965bdb9684cbda19a73180c1488  kodi-screensaver-asterwave-21.0.2-Omega.tar.gz
+sha256  049ddd84606576439531a76f04bf6732ecab1776d151a5bfe7b69a1a488080ee  kodi-screensaver-asterwave-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 90507bf8b0..90518360fc 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 865f31b201..9f163c5dd6 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fdd5a5abf98318e01e22c88f81ae3838b2f3b76f99b39e01fc94af528a200849  kodi-screensaver-biogenesis-21.0.2-Omega.tar.gz
+sha256  a67269b38cdb3d9d39f8c7ae5c014af6496159ede7701fdfc102e78280e1ac56  kodi-screensaver-biogenesis-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 4455caedda..25cbfb8cbe 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index bb6918a03b..35e6186c19 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f56b57dfc8535331e36527462bd820e06e287a5a48ffdb33d00bdf1a2dc62b90  kodi-screensaver-cpblobs-21.0.2-Omega.tar.gz
+sha256  c611deff379023ef3310f3a4eb75f0d1ae694310efa857fc79e35a178c751c01  kodi-screensaver-cpblobs-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 8154bda2e1..0b97d3271e 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_CPBLOBS_VERSION = 22.0.3-Piers
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index df652f3286..034993ff3b 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ed9dba2040268bfd82648856b3e07da5cf51f39909c71c2579475221477e3a6  kodi-screensaver-greynetic-21.0.2-Omega.tar.gz
+sha256  cb87ccf7c3cbbca7682196e0ed6b5556662a9b630cfa462536fe019ff8e7cdaa  kodi-screensaver-greynetic-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index e484305485..1049386374 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_GREYNETIC_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 27bba5d3ba..a339fd3932 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cc342d201606e682fc9def894a308784b74633f981209570c87d1bd206894311  kodi-screensaver-matrixtrails-21.0.2-Omega.tar.gz
+sha256  906de731f0b1f559d27c874c29f3de8bcd82551a99547181ba5a3cbf4ab9dfb4  kodi-screensaver-matrixtrails-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ab51a5bc2b..21b1a652b9 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 867ebf865a..2dbae3ef54 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d7c15a0070e4792b4b56726d9a37ab6ca8c569186e0beebd256a57203d5e362  kodi-screensaver-pingpong-21.0.2-Omega.tar.gz
+sha256  b2d773288bc4e07e695ba847805a498b43d35784fbc066f878f8d0217d422cb4  kodi-screensaver-pingpong-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 5d1854b9a2..63b89a18d3 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_PINGPONG_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 23d1e1b1f3..7a3f8c0642 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a6b5d7efd789be40226ffe337bac8f64c47335c40085d940d624d42cdaa1be0  kodi-screensaver-pyro-21.0.2-Omega.tar.gz
+sha256  70e519246b05bad18ef97f0973a082bc4796a438fd6054532b44a8af3bb4dcfc  kodi-screensaver-pyro-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 72bbf2e913..6ffbf563b1 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_PYRO_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 6f9ca93d8d..c611a7cfd8 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  86a479a4c6d0b27723a701330b83704f223566eabe7a25302ecf8f0a66e5b27e  kodi-screensaver-stars-21.0.2-Omega.tar.gz
+sha256  45da0470fd95cc059356f87ae34db32a117ac11c9e30e4b65c7f018b942bc534  kodi-screensaver-stars-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index cff60ae5db..4dc7577b6b 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_STARS_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
