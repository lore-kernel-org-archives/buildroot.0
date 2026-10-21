Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCE7606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CBKpelc0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 239194C1FB;
	Wed, 21 Oct 2026 18:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEuMseZEUssp; Wed, 21 Oct 2026 18:36:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00D60414F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792607754;
	b=asrtp75jGEYJ84VWP/NjaoC3GLXPXToXQ712ZfGKl0dig/IhyUkFkTqChnemuxWP2+HW
	 XyvTTKYrhDyBc3VgmvQu+DN+V3l80Bw6zwovX3WE9bDUNKHsdjHWUZX6JJa4VcLy2jRQE
	 CsYEqpAr+8SQyrk+v3u6Pt9Lz+763LiVBWt6/Zsq+5b2TGZeIgtzDrUVZHkwOQBSpnHQ+
	 tJceO+oY/dN1Ge0RBa0wNfFPXPM2DXdwwsaLHJjo0+G4yLGiYzM4M20RMDP9bf7yHbany
	 2UmBAsT7rIHwWWMCm057uXN7WK84T0/0ZY7FR1DPs8HKtfQA4dKbxjXEShJulFXViKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792607754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=gYLtDfFxlpg1o2STgfUoZz3Rnk6IzxN8KQL6ZqIdqzE=;
	b=XJIwF/OBQZ4ue66J9IV/EyErF7mKcjeu07LW2lWdnKCBc4SuwLuWwzIre0b9p1m0g9fO
	 NMFEFrEvzzDbrxXBHD9yrJeiL82cJv/Ha9qvv2PXDHW6ds+T9YrRslknsE4q9ZIKZDL9H
	 ag+sdrMvNYi4CBxKXml8jLk7a7CxifINZZv/R5C6/QdhPeyDJ7HOH2oEVv0e2sSvSbbON
	 JPlk0NxtU5E3CxFvQrhKs/fb9nLu+AwuX/FWPbMDWBwkXLBfDPqQlYOTBU8mdUiGPMKWu
	 ABYmJLzcEWb5aBgohY08s2JydeBGQ4gtZJzpBDgWFhH2ruEr5vb+3lYqOHumsRGE4lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792607754;
	bh=gYLtDfFxlpg1o2STgfUoZz3Rnk6IzxN8KQL6ZqIdqzE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CBKpelc04fo+oIbt1YJ0ee+zjTo4CPXOkKmaVP7cgrMpJ3N1C8FR8uzk4DI68dmxa
	 XyFSroK3qZOzuuZgIEYb7ZsZdgiuQvalwevrPl+t3BdUOgHBlNsHJOVtD8K24+arpg
	 YVXwHbjzWtOlAT6Z1Y4ZNHotcMnpb4bXCrLFDjR4KHNyZF1hJnXRgwaDJuKuj0f6C5
	 ZnJlWS1TRdvObvJ+gRNdI7/D9M8wiAJIlaKsAFJkQJKEuDTG9iB8rmKHGwZxpjpGLE
	 7mwp0lzzlYLIy4zxqSsT2t5xeq2aSgE73ZrB9miLjDZM4Jj0BbxzmUCPd/Vl5yqsUu
	 Oc64AEUfMrjdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D60414F9;
	Wed, 21 Oct 2026 18:35:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5546769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A39E42BF8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o72Q0yqi_m9L for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:35:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8229D42A94
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792607744;
 b=fX2wQvLHsso85fsGK8Hd0HDYnd03qtm08inQt7y0IdeGpASg8J/T2RZvHEjtci9Ku1EW
 DiNhwo5DO7gB5kYTl7xA8t5yk60BL9G8AZ13M+V5jZQyDdzuNKSCsQ1fz9PP+hokTMKxK
 f7YxIM5BE9NrALeX7b1EFtnVDFqKRBahT980Wopdq+wlWQapSxhBTKYGLc+mMXhAPQsBR
 6F8TU01SE2VB7kG2V8/opRMDtTMOcxx226tz20I6aqSVA62dkGXnhn/WD6Zykd64H30FW
 YzCUcGMo3jd6FmH4INrE8KzcR6OuzJ/PHhexLImdrD0uEk1FUpsz3IbGzGDdlIC/8qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792607744;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=51VDriSBqUssrXPAKZ9z4MU7YxzlSAje2wNdaWyi77w=;
 b=AZUj9ZO2K/A5/gGA80BEH7QR9sfjMR+tPt7UHWkVYJfzG4vvZQsZypBjO9DnJ1WfGDSK
 fujAK3wqlUs0TqY+bZXmmwOMFuUREQRwwaQCmC3H6sSV+iRhSSXdMNFRWw2HNQgkugQUj
 p0MPm4BOBTW5Gef78m8jag1jfMVWVUEgsEtYeW7zt5rROQY9OJFPrzKeNJ0Uyre7oUKgd
 DmnqHIx0Pzrmf9/5ktxa4JJ3ZyV7vcajr2vt0zDymNXzyl3sQ8d7j05UDWTbZZL9LDdd/
 KuE1QpzmuKLVggvrZgHu/LDQ8WQis9zP6cz6RUqhaXAgExXF1PtYNIEMSxzhaij45kA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tDAGV8YG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8229D42A94
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:35:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 23CC34E41266
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D4C79606E3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAD59103289F5; 
 Wed, 21 Oct 2026 20:35:35 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Oct 2026 20:35:32 +0200
Message-ID: <20261021183533.2649298-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/xxhash: make sure installed .pc file is
 correct
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The libxxhash.pc installed by our xxhash package is incorrect as it
contains:

prefix=/usr/local

while the library is installed in /usr. This causes for example a
build failure of libplacebo when xxhash is built before:

output/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR: Include dir /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/local/include does not exist.

The problem comes from the fact that the .pc file is generated during
the build step from .pc.in template, and we don't pass PREFIX=/usr at
the build step. To fix, we pass PREFIX=/usr during the build step, not
just during the install step.

The problem has probably existed since we started installing the
libxxhash library in commit
cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8 ("package/xxhash: install in
staging"), but we tested in 2025.02.x, and the problem exists so this
patch should be backported to 2025.02.x.

Fixes:

  https://autobuild.buildroot.net/results/344af8504a77ae96e4009d76a77572180cf49b14/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xxhash/xxhash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 51bf6ce855..fc2084c878 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -31,7 +31,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
+		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
