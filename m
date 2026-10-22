Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C4606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZKdDd/88
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB3CF40801;
	Thu, 22 Oct 2026 07:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1N2AsVUhXIPL; Thu, 22 Oct 2026 07:23:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 55A9940810
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792653818;
	b=IynEz7oBenylpV0NJSzWULK4OM2mgSyvBB0mbCpKiNnePQHnt7puuv/nSSN60m8TFcap
	 vHJx4ho8wHVVps5nU6lyYcSxEG6AcH1yLOdT7vkxN4C8TokACmCL0GSDgOMijoEHWIj/Y
	 rd4Az4IZrJNW6VAi3FwSGTAFGFj70k1pZv/T9GZHPiF9hlbkAK9B2Zh/6VXUVmBi9dQof
	 hYDdkGherLcEV11/c2MgC8LmOrUXghfmWSDJhPcJi/mXKUkP6rFGJds5knDP2oreniMuW
	 QWD/9XzoZWosQRBYRt4diLZ0UIlm3LZiYOSbFetaPAxVyPGJ1pUv4D3Hg833eYApw6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792653818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8l+sfPqOKBvlthxdfeAgICnvLsftlZfmovyRwHzYfAY=;
	b=JTqBAOEgdSxvSzFWofL9N/vyGVJ0IhiaWChup9+3kVxKObid1eT9qwHc0cslCFL5vhRn
	 T3UiTfrFOKC9Dav1t56+iPT0eAuUhZ54tGrqosK40g1VFWfGm+R8cqi7OoI6JP751CSV9
	 ZeC3IobsFIIYOSyFPcLU+hnqxpTv8+sCVuUz3hesEqdrumvXTQyKUThIk0p/yW0XqdMWw
	 jGJywA13trrFP/N2srIxyXmv67q0fFNsyRGUl2rlIJavOwl4ophMhV5lplAzokwfaZabS
	 odkHTPP46CmF/Rk8JEZPoID1LfFb0yiP9qVxZ0+w0T44FSnyY4lc9HQRBKOa7ERU6GQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792653818;
	bh=8l+sfPqOKBvlthxdfeAgICnvLsftlZfmovyRwHzYfAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZKdDd/88lxvUujIGgRaI8p5ynBRgYzN5jtqF6P3E8gTKDa8nHGp0+DBYyqeVhJFmB
	 rRYWb0ZvGvpUNXJ/z1e68gzfLZ5Qr7h81pV4oMwjy48cDuytGvndSZPwnOzdWDNir6
	 IInZrZHOTtj3wAgwvT0xfpZqM6OLumYjoHdG/iBS8DXBYwqgQTjyqb/ECJnGMdJJkf
	 878UMsrUb3Xd9pGCvMZrHHvFdq1qoZOrOhlt0a3vMkBhodY+5oOdMaT8ARvqTRKrqb
	 RsFimLoNvA95sIZo2bZWwkVOK4LHv9oC3ePmJn6OTjc0bh5dVOEmxl60HsVT3If/9G
	 2IrMGwi5AXN2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A9940810;
	Thu, 22 Oct 2026 07:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C58235
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69DE540075
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igG4jFNXbEil for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 07:23:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E579C40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792653814;
 b=bpw74qpp1jpQCmZAsheaxuSKTFSgeVhi5XVFT1v2haF0VfkKT8VDLLfQRDtvzc3GcnSC
 JckikhwhM3lHgCPkE5jqe5neG/zwLyx06JghdtQAldGuSzze3IK9MCOEJp/YfN73T6XjU
 eFXdAGMRg8UchWc9qDVvvZ6KwRQ4P+Y8e/Vdo9krO0tMlFwcqeDdznxITVHXJZfE0Z0KL
 EL9usNym/3Hd01shDL3NBb5ihdN2/qngapeTt2b0rZODanOPgli6Lwroa+7dEhH7aaCyH
 7Pre7juyHIYu/P0WShRVzNynoZyKWuWRywIr8hIjSnFnCo95veJ+xSehRZu45GBj4WQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792653814;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=fin95CYfY0qGfRL/2QsMTcJNfje90W8GbIdOKqcl3Os=;
 b=Qd1pcwj5Uh+hcVsxe3iruRHcaFZM2pmdP0ExtgSyEBFcVMxg4C/8F10S78jdeEfQG9uY
 iSS/lD+xCMgCwQrB8TpWEDi3jHZf74hQYFZLkhOCUy7gafuLlxv3DVPh1swe5FDQRseiq
 wBdkQ0HKQ0OUrhQssGjCO3B/84+5L3s1028DRlp/TnQrgvtdWHtwGnB2bNG5ATpdGzVM9
 OrJXWLktYWr/wjk02OL7ko8V7O5NN25sN4eW3Up2IPuMPgeQsiyeUcxi8krysw/7drwY2
 zZLiLdUrBWEo60sPl0gzuVhOQeht+Erb9QA57h0CRvaqDat7FXK6sDlT36DrFec/Rkg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=UdredbKz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E579C40042
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:23:33 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6b170129413so3400116a12.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 00:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792653811; x=1793258611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fin95CYfY0qGfRL/2QsMTcJNfje90W8GbIdOKqcl3Os=;
 b=Z2Sc7LRXjtBGuQIB5ZCWWRKx8rC2uAGyQVJNh563RlRejZFTP4m7DORm/03P7PhRHw
 5dn5KtS3S05GhD/WFzQfBYiAJQWYRvBWgCKeOMU7Idlp4Q0fxQE41MNFrf4iS5m1/7jA
 2ghGrRycMvcJka29WB6X+fLozIDM38DgNSM3l1FRKDcnlJHlDco1kODu3TQmT3J8fOw/
 /z6J7I5BB5AdaPj7nxBdvYm5Ty3FS6gM7KzFlKY97v9Xsb7G+1phfzn9vy41wsBa6hwU
 Hu2z4C6aBXQrnDHS11mEfTqLApOIrRjLGFHv/6hUZUen0l651wlxQgjjDUJiG36YmKvE
 SzCQ==
X-Gm-Message-State: AFq9FYJHobqQYrVU2u3dtHgKVJ05iTWFEGDipo0Z69Fu1AFbSqFSO32o
 iY0dVtDNITS0kJ23znQejvur6GEGRHDtW4XlPsqcWBVv6VXahk2nJdU+IKxenA==
X-Gm-Gg: AYBFou1v4xdUy86QKMWiZssYymbkOy+NtnZc9K2QHNgVYYB7m2jR4+Z0zFMpKhPqLBX
 6iL4+vdTfQQ2v7iGXJv7IS6TKZs27GXfp6ZZDKz9kXtXBZP/9yMcFSWz8ozVQJg6na9CKam/+nl
 UZfUC+aCvEJ54mLbAT1V+JIETGbJbbI/L7JeCC8AvGye6V/FhHSINbFrTQ97a6CLlDjyMEa6FT9
 6iRVeWQe427nEgY+aonU7SxcnNj8qoVrwh2rUM8DClvvZUUd9DvhISK1UTNy0LzEnFR9A4EUFMc
 405PkbWTBcu2l6JXc8D85fgBUiLtYkj7po6eiQd40K4dSOFHsdl3wrd83bSBLco6bAb9+oSaoYM
 p9kh5+wkPKUyFSsO4OhZphAPychDdPhMwg3IhfQMcAZ1n9k37hIQgaVqBn5oNplnWOl06rUrE41
 +otUdDkrV7KjdfED3JBg22QOMzZHiLOAY+O0zS95VSbn+IIVw0vFMvvX4OFem1XJzX/Km5cJRwD
 TJbXerBf6V+JoJKKUGmYcQfCcSkec6yZLHN0Ia4wEVAEFX+imhUcZYCeWlywt6FLEihnA6JYfoo
 Y19XiuV5kJqj8JNMd6z+yGtFjDmdR9Ftgug=
X-Received: by 2002:a05:6402:2b88:b0:6ac:b013:8648 with SMTP id
 4fb4d7f45d1cf-6b408ee9375mr3856984a12.35.1792653810914; 
 Thu, 22 Oct 2026 00:23:30 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b403110a23sm1438956a12.17.2026.10.22.00.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 00:23:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 09:23:29 +0200
Message-Id: <20261022072329.2255438-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nuttcp: bump to version 8.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The change history is available in the header of nuttcp.c.

Drop 0001-susv3-legacy.patch: it replaced bzero()/bcopy() for uClibc
configurations without SUSv3 legacy support, but Buildroot's uClibc-ng
configuration enables UCLIBC_SUSV3_LEGACY, and 8.2.2 uses these
functions in many more places, so the patch is no longer needed.

The tarball hash is now locally computed, as the FreeBSD reference
only covered 6.1.2.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                    |   1 -
 package/nuttcp/0001-susv3-legacy.patch | 264 -------------------------
 package/nuttcp/nuttcp.hash             |   3 +-
 package/nuttcp/nuttcp.mk               |   2 +-
 4 files changed, 2 insertions(+), 268 deletions(-)
 delete mode 100644 package/nuttcp/0001-susv3-legacy.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6c026da328..bdeef49192 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -651,7 +651,6 @@ package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upst
 package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
-package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch lib_patch.Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch lib_patch.Upstream
 package/ofono/S46ofono lib_sysv.Variables
diff --git a/package/nuttcp/0001-susv3-legacy.patch b/package/nuttcp/0001-susv3-legacy.patch
deleted file mode 100644
index 9a215f8a86..0000000000
--- a/package/nuttcp/0001-susv3-legacy.patch
+++ /dev/null
@@ -1,264 +0,0 @@
-[PATCH] Replace susv3 legacy function with modern equivalents
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- nuttcp-6.1.2.c |   90 ++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 45 insertions(+), 45 deletions(-)
-
-Index: nuttcp-6.1.2/nuttcp-6.1.2.c
-===================================================================
---- nuttcp-6.1.2.orig/nuttcp-6.1.2.c
-+++ nuttcp-6.1.2/nuttcp-6.1.2.c
-@@ -1925,11 +1925,11 @@
- 	if (udp && !haverateopt)
- 		rate = DEFAULT_UDP_RATE;
- 
--	bzero((char *)&frominet, sizeof(frominet));
--	bzero((char *)&clientaddr, sizeof(clientaddr));
-+	memset((char *)&frominet, 0, sizeof(frominet));
-+	memset((char *)&clientaddr, 0, sizeof(clientaddr));
- 
- #ifdef AF_INET6
--	bzero((char *)&clientaddr6, sizeof(clientaddr6));
-+	memset((char *)&clientaddr6, 0, sizeof(clientaddr6));
- 	clientscope6 = 0;
- #endif
- 
-@@ -1985,7 +1985,7 @@
- 		}
- 
- 		while (stream_idx <= nstream) {
--			bzero(&hints, sizeof(hints));
-+			memset(&hints, 0, sizeof(hints));
- 			res[stream_idx] = NULL;
- 			if (explicitaf) hints.ai_family = af;
- 			if ((cp2 = strchr(cp1, '/'))) {
-@@ -3013,12 +3013,12 @@
- 		if ((stream_idx > 0) && skip_data)
- 			break;
- 
--		bzero((char *)&sinme[stream_idx], sizeof(sinme[stream_idx]));
--		bzero((char *)&sinhim[stream_idx], sizeof(sinhim[stream_idx]));
-+		memset((char *)&sinme[stream_idx], 0, sizeof(sinme[stream_idx]));
-+		memset((char *)&sinhim[stream_idx], 0, sizeof(sinhim[stream_idx]));
- 
- #ifdef AF_INET6
--		bzero((char *)&sinme6[stream_idx], sizeof(sinme6[stream_idx]));
--		bzero((char *)&sinhim6[stream_idx], sizeof(sinhim6[stream_idx]));
-+		memset((char *)&sinme6[stream_idx], 0, sizeof(sinme6[stream_idx]));
-+		memset((char *)&sinhim6[stream_idx], 0, sizeof(sinhim6[stream_idx]));
- #endif
- 
- 		if (((trans && !reverse) && (stream_idx > 0)) ||
-@@ -3028,15 +3028,15 @@
- 			if (client) {
- 				if (af == AF_INET) {
- 				    sinhim[stream_idx].sin_family = af;
--				    bcopy((char *)&(((struct sockaddr_in *)res[stream_idx]->ai_addr)->sin_addr),
--					  (char *)&sinhim[stream_idx].sin_addr.s_addr,
-+				    memcpy((char *)&sinhim[stream_idx].sin_addr.s_addr,
-+					  (char *)&(((struct sockaddr_in *)res[stream_idx]->ai_addr)->sin_addr),
- 					  sizeof(sinhim[stream_idx].sin_addr.s_addr));
- 				}
- #ifdef AF_INET6
- 				else if (af == AF_INET6) {
- 				    sinhim6[stream_idx].sin6_family = af;
--				    bcopy((char *)&(((struct sockaddr_in6 *)res[stream_idx]->ai_addr)->sin6_addr),
--					  (char *)&sinhim6[stream_idx].sin6_addr.s6_addr,
-+				    memcpy((char *)&sinhim6[stream_idx].sin6_addr.s6_addr,
-+					  (char *)&(((struct sockaddr_in6 *)res[stream_idx]->ai_addr)->sin6_addr),
- 					  sizeof(sinhim6[stream_idx].sin6_addr.s6_addr));
- 				    sinhim6[stream_idx].sin6_scope_id = ((struct sockaddr_in6 *)res[stream_idx]->ai_addr)->sin6_scope_id;
- 				}
-@@ -3113,8 +3113,8 @@
- 				 * to the multicast group
- 				 */
- 				if (af == AF_INET) {
--				    bcopy((char *)&sinhim[1].sin_addr.s_addr,
--					(char *)&save_sinhim.sin_addr.s_addr,
-+				    memcpy((char *)&save_sinhim.sin_addr.s_addr,
-+					(char *)&sinhim[1].sin_addr.s_addr,
- 					sizeof(struct in_addr));
- 				    if (!client && (irvers >= 50505)) {
- 					struct sockaddr_in peer;
-@@ -3124,8 +3124,8 @@
- 						      &peerlen) < 0) {
- 						err("getpeername");
- 					}
--					bcopy((char *)&peer.sin_addr.s_addr,
--					    (char *)&sinhim[1].sin_addr.s_addr,
-+					memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					    (char *)&peer.sin_addr.s_addr,
- 					    sizeof(struct in_addr));
- 				    }
- 				    else {
-@@ -3136,8 +3136,8 @@
- 							&melen) < 0) {
- 						err("getsockname");
- 					}
--					bcopy((char *)&me.sin_addr.s_addr,
--					    (char *)&sinhim[1].sin_addr.s_addr,
-+					memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					    (char *)&me.sin_addr.s_addr,
- 					    sizeof(struct in_addr));
- 				    }
- 				    sinhim[1].sin_addr.s_addr &=
-@@ -4197,13 +4197,13 @@
- 						&melen) < 0) {
- 					err("getsockname");
- 				}
--				bcopy((char *)&me.sin_addr.s_addr,
--				      (char *)&mc_group.imr_multiaddr.s_addr,
-+				memcpy((char *)&mc_group.imr_multiaddr.s_addr,
-+				      (char *)&me.sin_addr.s_addr,
- 				      sizeof(struct in_addr));
- 			}
- 			else {
--				bcopy((char *)&peer.sin_addr.s_addr,
--				      (char *)&mc_group.imr_multiaddr.s_addr,
-+				memcpy((char *)&mc_group.imr_multiaddr.s_addr,
-+				      (char *)&peer.sin_addr.s_addr,
- 				      sizeof(struct in_addr));
- 			}
- 			mc_group.imr_multiaddr.s_addr &= htonl(0xFFFFFF);
-@@ -4330,12 +4330,12 @@
- 			if(udp) {
- 				strcpy(buf, "BOD0");
- 				if (multicast) {
--				    bcopy((char *)&sinhim[1].sin_addr.s_addr,
--					  (char *)&save_mc.sin_addr.s_addr,
--					  sizeof(struct in_addr));
--				    bcopy((char *)&save_sinhim.sin_addr.s_addr,
-+				    memcpy((char *)&save_mc.sin_addr.s_addr,
- 					  (char *)&sinhim[1].sin_addr.s_addr,
- 					  sizeof(struct in_addr));
-+				    memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					  (char *)&save_sinhim.sin_addr.s_addr,
-+					  sizeof(struct in_addr));
- 				}
- 				(void)Nwrite( fd[stream_idx + 1], buf, 4 ); /* rcvr start */
- 				if (two_bod) {
-@@ -4344,8 +4344,8 @@
- 					(void)Nwrite( fd[stream_idx + 1], buf, 4 ); /* rcvr start */
- 				}
- 				if (multicast) {
--				    bcopy((char *)&save_mc.sin_addr.s_addr,
--					  (char *)&sinhim[1].sin_addr.s_addr,
-+				    memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					  (char *)&save_mc.sin_addr.s_addr,
- 					  sizeof(struct in_addr));
- 				}
- 				if (timeout)
-@@ -4361,7 +4361,7 @@
- 				fflush(stdout);
- 			}
- 			if (udplossinfo)
--				bcopy(&nbytes, buf + 24, 8);
-+				memcpy(buf + 24, &nbytes, 8);
- 			if (!udp && interval && !(format & NORETRANS) &&
- 			    ((retransinfo == 1) ||
- 			     ((retransinfo >= 2) &&
-@@ -4372,13 +4372,13 @@
- 					tmp = 0x5254524Eu;	/* "RTRN" */
- 				else
- 					tmp = 0x48525452u;	/* "HRTR" */
--				bcopy(&nretrans, buf + 24, 4);
--				bcopy(&tmp, buf + 28, 4);
-+				memcpy(buf + 24, &nretrans, 4);
-+				memcpy(buf + 28, &tmp, 4);
- 			}
- 			else {
- 				send_retrans = 0;
- 				if (!udp)
--					bzero(buf + 24, 8);
-+					memset(buf + 24, 0, 8);
- 			}
- 			if (nbuf == INT_MAX)
- 				nbuf = ULLONG_MAX;
-@@ -4423,12 +4423,12 @@
- 				nbytes += buflen;
- 				cnt = 0;
- 				if (udplossinfo)
--					bcopy(&nbytes, buf + 24, 8);
-+					memcpy(buf + 24, &nbytes, 8);
- 				if (send_retrans) {
- 					nretrans = get_retrans(
- 							fd[stream_idx + 1]);
- 					nretrans -= iretrans;
--					bcopy(&nretrans, buf + 24, 4);
-+					memcpy(buf + 24, &nretrans, 4);
- 				}
- 				stream_idx++;
- 				stream_idx = stream_idx % nstream;
-@@ -4523,8 +4523,8 @@
- 				nbytes += cnt;
- 			if(udp) {
- 				if (multicast)
--				    bcopy((char *)&save_sinhim.sin_addr.s_addr,
--					  (char *)&sinhim[1].sin_addr.s_addr,
-+				    memcpy((char *)&sinhim[1].sin_addr.s_addr,
-+					  (char *)&save_sinhim.sin_addr.s_addr,
- 					  sizeof(struct in_addr));
- 				strcpy(buf, "EOD0");
- 				(void)Nwrite( fd[stream_idx + 1], buf, 4 ); /* rcvr end */
-@@ -4532,7 +4532,7 @@
- 		} else {
- 			first_read = 1;
- 			need_swap = 0;
--			bzero(buf + 24, 8);
-+			memset(buf + 24, 0, 8);
- 			if (udp) {
- 			    ntbytesc = 0;
- 			    got_eod0 = 0;
-@@ -4584,7 +4584,7 @@
- 				     * goes off right here */
- 				    if (udplossinfo) {
- 					    if (first_read) {
--						    bcopy(buf + 24, &ntbytesc,
-+						    memcpy(&ntbytesc, buf + 24,
- 								8);
- 						    first_read = 0;
- 						    if (ntbytesc > 0x100000000ull)
-@@ -4598,7 +4598,7 @@
- 						    }
- 					    }
- 					    if (!need_swap)
--						    bcopy(buf + 24, &ntbytesc,
-+						    memcpy(&ntbytesc, buf + 24,
- 								8);
- 					    else {
- 						    cp1 = (char *)&ntbytesc;
-@@ -4627,8 +4627,8 @@
- 					    uint32_t tmp;
- 
- 					    first_read = 0;
--					    bcopy(buf + 24, &nretrans, 4);
--					    bcopy(buf + 28, &tmp, 4);
-+					    memcpy(&nretrans, buf + 24, 4);
-+					    memcpy(&tmp, buf + 28, 4);
- 					    if (tmp == 0x5254524Eu) {
- 						    /* "RTRN" */
- 						    retransinfo = 1;
-@@ -4661,7 +4661,7 @@
- 				    }
- 				    if (read_retrans) {
- 					    if (!need_swap)
--						    bcopy(buf + 24, &nretrans,
-+						    memcpy(&nretrans, buf + 24,
- 								4);
- 					    else {
- 						    cp1 = (char *)&nretrans;
-@@ -5327,10 +5327,10 @@
- 		itimer.it_interval.tv_usec = 0;
- 		setitimer(ITIMER_REAL, &itimer, 0);
- 		signal(SIGALRM, SIG_DFL);
--		bzero((char *)&frominet, sizeof(frominet));
--		bzero((char *)&clientaddr, sizeof(clientaddr));
-+		memset((char *)&frominet, 0, sizeof(frominet));
-+		memset((char *)&clientaddr, 0, sizeof(clientaddr));
- #ifdef AF_INET6
--		bzero((char *)&clientaddr6, sizeof(clientaddr));
-+		memset((char *)&clientaddr6, 0, sizeof(clientaddr));
- 		clientscope6 = 0;
- #endif
- 		cput = 0.000001;
diff --git a/package/nuttcp/nuttcp.hash b/package/nuttcp/nuttcp.hash
index c7d0148e12..a43081d632 100644
--- a/package/nuttcp/nuttcp.hash
+++ b/package/nuttcp/nuttcp.hash
@@ -1,4 +1,3 @@
-# From http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2009-August/170685.html
-sha256  054e96d9d68fe917df6f25fab15c7755bdd480f6420d7d48d9194a1a52378169  nuttcp-6.1.2.tar.bz2
 # Locally computed
+sha256  7ead7a89e7aaa059d20e34042c58a198c2981cad729550d1388ddfc9036d3983  nuttcp-8.2.2.tar.bz2
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 2636f950aa..a33af9bf87 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUTTCP_VERSION = 6.1.2
+NUTTCP_VERSION = 8.2.2
 NUTTCP_SITE = http://nuttcp.net/nuttcp
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
 NUTTCP_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
