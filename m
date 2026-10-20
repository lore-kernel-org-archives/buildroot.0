Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB0E606A338
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M5MnvT96
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF9581103;
	Tue, 20 Oct 2026 16:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3egwFIbzosX; Tue, 20 Oct 2026 16:40:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2CDDC810FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514401;
	b=jcEmpgb2tv94MuhOL40DfyDx4YDuVLKbLbRzBmEhMDd6JgOfUfL6wxAYnpU52dQUpJFy
	 QOpL6y6qzwnl5Yr2Oq77LIRtjjQ3cekqwrkaIXnWNcApcczyHfAbF3jbiuBkYpBAXTWAe
	 zK5VhQjwsZM70G4rP00Cz3X099TIQodLG0GcQ6veIQdiTcx+UVxqnHCpc3gNAMIu0LPux
	 xy/2FSU/xT6QKuyLoYCn6VTv+sZy3TJaWKZ3ZakcSfZ+3evI4OUxhkjM2iYoOUs2DS0U1
	 jHhgCdeqKjiFDWAo4mCcrchhJkNrLvMfqUu+yw4yjn0mNH5qks2hAZrDcE5T1wO/yEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=M2gu9PIN8ZeEXSaLr3iYMp4EB4OJUluKylVcpUINnrM=;
	b=MSvAXHeqsvLvaJ/2yJMAly0Sh4Vl+W7zXLckD6NAU0saer/y3hNN6l0kJR/NXNbb4AyP
	 7oM1yzIdyHQbhUSvL/d5uV5DDBGbZvj3o4ynTj2y4DjFQpjqDAHNB+5Sle1z0qaIZdp5r
	 hfmDzKC7exzTctEk+wt7Z1bNg4WfEgMH8BOvC5CyQ9Zwkp6LwEp+W19xzWczbrTiajhue
	 qlNgy3AuBg+KHFLlXWckJWGbP7jNKqAU/Sq1vjGpSZMzKfeDVnTmTL/xzcisR6IU7+pEW
	 LkET67cGUul1L7ImpP8GUhAiYZX5/IHS+MyfxyjWFv+pjVzKidUor9+3JgBXqdR40ng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514401;
	bh=M2gu9PIN8ZeEXSaLr3iYMp4EB4OJUluKylVcpUINnrM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M5MnvT964QlYQJo9hyTsL8iFSV34+PoHI/cxn2fTC8BPTFsBTEDbKQMJ7fnRFdzt5
	 poaFf9WHdlXFrXlFE6IMhp1XYEoYwDzQ+mGQKSG5UeW9ZRCgQk+iUrPBt4ev/w9v5L
	 zlXkpJdcDmrBts0t019axHWJowj19KPa7yYQlOjxeuxOl5Lw0uD9PLUWUdjxUwukKz
	 4Js7bp0fg1eCgPa0csppN7t9bxOaCSqEc1cXlFz+yCVlB9UdlmAhnBXMHCkwlOetFI
	 UwGJaIeizy2zjQSLV6pMeBOMdwEZEv3UOYRLGKTkUsqA5fPfw5Oqb+PGuDuAGt+sTM
	 HrpkAgFhMYPuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDDC810FB;
	Tue, 20 Oct 2026 16:40:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81033930
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72E11810FE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh-wXgeePmIv for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:39:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDBF6810FB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514399;
 b=ZE54+/D/qHts8l9gvQJBwErQxfmzhwAyPkrf8GERdBKY5SwWgnobuZd+Y/zcXe148lO4
 9FLAfULXrtvIFAK4FNm2xAjIz/bMNbikfoZPAWuXLHWUkkzfZ1jlv0D4UA2a2rGQ4sMKp
 TEzmDOtOiQ3GeeaF8rFhtqlzeTF1Hwt1hfJ9i7kARHFIX1e2CK5bgJpURR/jHIiqLkeFi
 DUZKQ2whNgUAyIcY12sRlqxlTmb+0BYDPASRbg7u7+SnHBPuGOYWo8eNU9muWsPJ4zPG7
 1SiDw9JvfzCBS01l8lxlTQx7e/t+XY0q5ncgzKpdzSweiOgAD4lNDXHirpfbgW5HLkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514399;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dzsF1fBnMko5i/EbTwiYjhNVohPv3Il1rdaVs9WQyLs=;
 b=ouxmhEVaR9uSAcX+yT9BzhQwHVCrszRsp0yrnvakwSyke+drCMm/tkgUWp1T3eeWumIQ
 tw0zwO01c8JRxOcgI31qv22Gi2K6qEMfoFqydEV0m90QN/Mc+oJXIQ3LsESN7kvkXBj9A
 KW9gXStgpKar5i2Rwju8bRCS6IEt1WfiAWW3rlm4rLRbGezCGhtP/R0oa89+Eu4gySymQ
 2WiKe9CNmeEMZBHS76nyjyufvFIRwckVwZHPWFML24FtNlcjx/Y5fd82TCA/422x3PUFt
 CGM+9PjzuTQbyTnbz5TLzIQsx0ePOQ3uzsO5zvMZHhvdtyunKCrTH1DgVjO+ysQvfoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDBF6810FB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:39:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABF5099913; Tue, 20 Oct 2026 16:38:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 18:38:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 623e94b061d78a2589d73cbae03be1b9d3a87500
X-Git-Newrev: 450a2c4857f381251f5613e1c6234462c4521ab4
X-Patchwork-Hint: ignore
Message-Id: <20261020163836.ABF5099913@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: rework jansson
 handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/450a2c4857f381251f5613e1c6234462c4521ab4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
BR2_PACKAGE_JANSSON), but practically speaking, network-manager's
meson.build detects jansson regardless of ovs=true. So we make this
jansson optional dependency explicit.

This commit doesn't fix anything, it only makes the dependency more
explicit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 5071546c27..2a562db726 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -107,9 +107,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+# No option available to explicitly enable/disable
+NETWORK_MANAGER_DEPENDENCIES += jansson
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
 NETWORK_MANAGER_CONF_OPTS += -Dovs=true
-NETWORK_MANAGER_DEPENDENCIES += jansson
 else
 NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
