Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B16070F10
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZZTJYTm0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF49340952;
	Wed,  4 Nov 2026 21:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq-Y5_mi78X0; Wed,  4 Nov 2026 21:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 09A0A40968
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826519;
	b=UOUPAlE82on/rwB4Dm4AmuDGhX3gS4xd6FuaGxxXzXngzxZgqrCk9vqT8xFFHX9qPNzw
	 Ngmo8TMFBIUOh/oGYDuex1jHptieo9p6zbTEAOSq5MtlR349rewW5viomodWfZ2hEgyph
	 d1UfNRahKrReWVVrN4SLgyZsPQ/YDwGxSnwGcUm+3xlXbflIo+vjDfkA3uQrsj6rlVqnx
	 7/aMeSDQ+QPNkN5/enqpVOwRNOhcEJR+dNr8WCug6nV3y4Nwmbmv3oI1oitair7tuluWM
	 TsNbKkkn/fkbyvDAmfg8wZ72ARCPF3fkK94ecQT7WyYzZVNDCWcKaaQvwXKpySFRmKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826519;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UdMe/ZP+BBcB8ZsRiMMm6kMq38gKdxVymkZkdldOs78=;
	b=J3+we0g56nwVBm5rkc5/Tub4bJlBhPxzirbtWiPZMnxiFP4zWu3eWIuoCHRqor0BvwG/
	 Xqz7HKJiosP8TH1YuqXQ/yLWTV9nNLj1NaCZW+SKZ5yFSV7gQTDQKM69wPwHMqE52K1Mu
	 Eu7+x+ckibTCQ1mk/YVVyFGo/WGwEFfIgubzn518bKlFOWp/rUjIJjDJzSdskWmNNeEVD
	 LhMh4ZzDh9C4cJLPZW/GMKCjrOA/zmN7KnIsxD7pUParHP3sym9fylMbkPIp5cXbUvDsS
	 jmi8McteWb31JWFOk7mzI4G0uOoiZIYyoOgK666RwYIdUwJGW+i+Y9g5U4l8MzsKDyA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826519;
	bh=UdMe/ZP+BBcB8ZsRiMMm6kMq38gKdxVymkZkdldOs78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZZTJYTm0RNElncV9NYvscVe5TUwYAf1DZCfaV3uJg3rmou/VO89d2SSS1IfmN+Wsu
	 HJdHo77JALQ0JVzPFDgxLvu/tT/Wdyxp9G0UpWs5GqKpU4P2ITmQuZqDyc6EUzPQiB
	 wdi/Zj4cGmnF+M0E2Y7WnDFnmiISKhM0L4+5Eq2ShPSws5asCV4Jt9cC1vHWggy9h0
	 30uzBdh1yORnZN+A2QnwQfxjdAyVVdx2ZNd1QueD+b9g1AYjkC1eW1Zek6v4Vs/eDv
	 Ex280Gcot5HWtYMioMU4bIJ0zXL01IiQxo5bsW10xyZZvtHj1/uIjGl2DwYxq1TiZ8
	 xgFJkNPPnQPHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09A0A40968;
	Wed,  4 Nov 2026 21:08:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9607D3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0F940217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDMUhSVH9tJI for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 338064013C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338064013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:08:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 585D79DE69; Wed,  4 Nov 2026 21:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:07:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fead9bc6853081f90554b8c4fe6516606d442a2
X-Git-Newrev: eec6313a54ae24e463dd6cbc058e00c981047e24
X-Patchwork-Hint: ignore
Message-Id: <20261104210706.585D79DE69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: hv: fix build on
 non-x86 build hosts
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eec6313a54ae24e463dd6cbc058e00c981047e24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Linux 5.4, commit 9b5434196529 ("Tools: hv: move to tools
buildsystem"), the Hyper-V daemons are built with tools/build, which
first links the objects with "$(LD) -r". We only pass CC to the hv
build, so LD defaults to $(CROSS_COMPILE)ld, i.e. the build host's
plain ld. That only works by chance on x86 build hosts, whose ld
handles i386/x86_64 objects; on an aarch64 build host it fails:

  LD      hv_kvp_daemon-in.o
/usr/bin/ld.bfd: relocatable linking with relocations from format elf32-i386 (hv_kvp_daemon.o) to format elf64-littleaarch64 (hv_kvp_daemon-in.o) is not supported

Pass LD="$(TARGET_LD)", as already done for rtla.

This issue has been present since commit 2703383c7201 ("package/linux-tools:
add hyperv integration services"), which added the hv tools while the
supported kernels already used tools/build for them, without passing
LD. It therefore affects 2020.02 and later, including 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/86c33797a5f09dbb1162a554cb6019f7c0702fbd

Fixes: 2703383c72011d38a1e3559cb7a5a2b0071b35c6 ("package/linux-tools: add hyperv integration services")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-hv.mk.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
index e638fecfc6..3aead40178 100644
--- a/package/linux-tools/linux-tool-hv.mk.in
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -16,7 +16,10 @@ HV_hv_kvp_daemon = hypervkvpd
 HV_hv_fcopy_daemon = hypervfcopyd
 HV_hv_vss_daemon = hypervvssd
 
-HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
+HV_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	LD="$(TARGET_LD)" \
+	CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
 
 define HV_BUILD_CMDS
 	$(Q)for prog in $(HV_PROGS_y); do \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
