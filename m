Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE66606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eFERiiLI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rg1Kgj51
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDE7606B1;
	Sun, 25 Oct 2026 22:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FA1CwrVc_8D; Sun, 25 Oct 2026 22:12:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0CB7760684
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966326;
	b=i/JPfgEMk5Z8HtJmbMer7EDVtqmYBLscsHsC0+XLpDjT0pAhXacIh+BqwYilWsAE0qmK
	 +KhsorqstG1JYzcG3YSw/wgGnHbj3B/HJ2PYU2fWyBBKQZ5FA26j/MgW6pPw+kAezZPDm
	 /ngXzpQS+1ncul4UcdSt0yoQBDymg8qh+n1PqMzO0I6kyzDnTVVmx9UdAd3eJRGHgThFk
	 o80yVGbgsyRf0uqA3UJG8r6jHzZLzmI2EyoFs5SVYhf5HumV8riiOj+fSKR4XSIqqpGcH
	 wFdVPQe5n7xJ2qHK3wdv5+fAoRZlF0H5m+u9pGZbihtZj2gmj9xQ34ErEg8SQZwrCnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8KpGMdPrKF2VjMfNfubsadpZtmDXDsY4LKphhcu3RrA=;
	b=V6OSlTo4xDm17Uh0iStICerKkuZVlz9DRKJNfl8NrXR7VeU+reVRwCSyNz5hUH3CHqmh
	 CijJpgWhpcpRHFFcM+DDsSZi3qVCFFw9Xi1TvME/0IyxMQdLdUieTWxGHU7Xxdc6yWxXv
	 WMoPjOckI+mK7c6J0QTTIAjPjOuxfhI6RFp8Is+bHZGd3BEC6nY9pP1FaGN8zz6zALS+9
	 xf415s+QEaCFM+c5g1LqrxBHrwQyxok0c4+/kIRRB/Q4w/059kSywc24ckiWSHwmsFVZH
	 LgF6Q6bdZHxuL8GIcMfI3GTNs44ah8hfl0aE1TSyQWEQkox8SYyd5qy7nu7YmIFQCTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rg1Kgj51;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966326;
	bh=8KpGMdPrKF2VjMfNfubsadpZtmDXDsY4LKphhcu3RrA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eFERiiLITivmqq7T2OqRF81icm5h4c3hlhyMqmjZm3q0AQl3UCuJH4yR1jJ2DqeHq
	 AjSOH2RcEmLT1ADERnoSReE4PBj7VJS0atN7348z9ylOJ8i2NY9qII6pU8Dfg1EAts
	 Zesa7xArrAnqY+MuFccyKMAtCoWDkOUK8oBp4bsxAA7AcIuqqIgky23HVe2ZgnXo2D
	 sC7xazibnQ7/kDyJfqCkQad9Zc1Fr7E8UURvwKDkKXhMj7ZJe0x+ZrNZ1dvwZtyX93
	 BLEm50ZLmnW6Cw32sSZfbr66/+V3pqvPpSRBDVm5b7kbtuIdzsLbLNffzVlCXRpDxV
	 7BSY5fknb15pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB7760684;
	Sun, 25 Oct 2026 22:12:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A991B334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B4A960684
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-dxWpEn61nk for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:12:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BBE4B60645
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966324;
 b=NgJcy0gvIRMsZz4UJ+9dTCuPN+I6s8rI1HGRVAaxsPZRskN3GYWkcZByH7cxux2QbIeV
 0qcnRvtwf6co5C6o+4gLgHMMI41XjGuNGEN+JhtUseb8NarftDAtI9571qltLPspH/Hr7
 6d5fbGS/IaIuQxzSMOeKGksvjcdQaP1dihCRHLzLdaLEDXbzxRHg3n9Pno6EaXjEYD/Rd
 W66Z3KVynF4c5HrGuI7VhqvtXv66hUjU7OJsynWuqlUIBRH0oZM8sU6wO0DV/ljAOvDSO
 wGJvQwUWvsPstrmv4Z2VSPqnY28bL6QlFK8dc7mp4gzL+85dR1TJybfm+Rx9L39GWpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966324;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=B34f1tzmvezFsMbB4MG95aY9dT7LOTBJQvqa0afidBg=;
 b=L+YTZPHgnTd2mSAGHhuJqobzEl+BZ2qNwwNGVF4SjS0LrfPW3a8EgVoohgqynwG6cLLh
 KWk6+HCLTJ421z9KzRhhnL+OEt6qQnvwQhSH1FS2a7RWRL3UW7zpGHF0IgzRi8zqUhHWz
 sajWzILM6YYo8zHkTOR6YTBL/Mu13EyE3qA/ZViaWX9fRv/n6tLjJNmrJrL5+p0qMJiMI
 iG/mGK7ywO4pTOwv1CHmPDBoF0UEpOxdmhjsw7cQZE2ao9xD392ZQRAlRAbzQNhDIRggC
 dchJKIzltd6Iku4VrExpQrkABIKM0DzZahKixnzGwTmv/tz+M/avinNqt764McaFXYQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rg1Kgj51; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rg1Kgj51
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBE4B60645
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966085;
 bh=B34f1tzmvezFsMbB4MG95aY9dT7LOTBJQvqa0afidBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rg1Kgj516y+iFcKngMdOavS0KswNbKIosJz+q8ah7+ufMndjkQkEySgLXZvIMIKaO
 lE8REJ4pvAlvBbkVLgqJ7r5Cn8P5FzMJA4ZCUy+YXFhjbDi1oxAO7ssvwpj/OtqzyC
 s4rXkuZUB4XR3iKUdr1pBBTq37nOy8D6+sQh7iQOluJMFraHLf+IssL9Zs2Texv09O
 WnOEcT0a6iDJaoFJzP/zgnk3uVe7Ea0OPFYK7jCdqerlRcTnNLeFK0Be7hRHaIV/uI
 8d/ayMI00ZTicP+4wdQIfTtpNgmDWzpITGrQqc2dJrM9sSdX2VYXfUShtagL/I6x6J
 K3ajdcnvBDHRQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 GaatOVYJ6jdUYM4GuvKpF2lH7hdU/U0AwQisxusd2xGImq2NjEmM+/dR4F8+DxzJqdIWfM83dNj
 /r6NxJp1EAuXgFM+wnBl4jQIJnGv5cgH6TTCnaqMzLoNkkauu9kmZamXJRdPksSC1Q9JtWDuRyc
 Rfgildk7vMkrk1nOnbF7W0XCVomSRvEbQrKrljLEutbN42c88wMppWZZuIU8T77zGSjXQKfEie7
 YB0frKyr0qNzoEhtTn5d9Z42b6QVqwE6PXDSR96yKWMxIFMfjaBAXIpL41bDgcSAven6RckVUyh
 caUdgSeJpcVHbsGWW6/98qlJ+j3h6L23ve5NvUzvBpWTywYySYAOdidlXceo400gAPAi7ha5Qam
 kCMzXsQNw1SiPXSb8ca5uMgwDZ3UuVi2U4wX+DhrToRBlOATpp8vMIu9cOXUJiux/hgV6Uvg3M1
 TGJzQA8G1699CNpXsl40WD5CRc+AKwFfaoTSVdelk3xx70vlG1dNHI5MpEiNh3zoFuBjEpy8Ag2
 ToVGiR2/rC/lSD9iAbkwCMTn6dzs2YhV43WKdd3A90yH3f9ebXQGw0douK6K9qwdUrJ1GMnseGW
 ZljqwvWVqE5wYhyFy51F9Z1oen5/
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 990DBA4C6A9D;
 Sun, 25 Oct 2026 23:08:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NE-000000001fP-1cGn;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>,
 Stefan Agner <stefan.agner@openhomefoundation.org>
Date: Sun, 25 Oct 2026 23:07:11 +0100
Message-ID: <20261025220723.1332924-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 22/34] package/containerd: bump version to v2.2.6
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Agner <stefan@agner.ch>

Changelog:
* https://github.com/containerd/containerd/releases/tag/v2.2.5
* https://github.com/containerd/containerd/releases/tag/v2.2.6

Signed-off-by: Stefan Agner <stefan.agner@openhomefoundation.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index e009df0de8..4088568230 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  f73a4580a869426120bc99bcd812ac723701a8c934549f70c8a6067e30e1458d  containerd-2.2.4-go2.tar.gz
+sha256  98992d2d2a652bcfaef0186d218c5ff254ba97ea1dd73425fe29be7036b3ac35  containerd-2.2.6-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 3ecff8a70c..01620eb147 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.2.4
+CONTAINERD_VERSION = 2.2.6
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
