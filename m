Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6849B606A338
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cwlIHCAF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=a6P3TUdJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8EC40661;
	Mon, 26 Oct 2026 16:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csOTdoqgq5ng; Mon, 26 Oct 2026 16:30:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5539540708
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793032247;
	b=h+/50KnNBwsnDsdGeJw8bv3sl6RWoMuynlAhkjlQXmR8UeKnREPYm5mLPYHt6eY6RIgA
	 BLuiViuY5p9MIZOJe7GZR773nn8VNpCR7wrPVUG/7tl9YxM45WYAzf5omknNHFUvp+4K3
	 MN3wvb73Jjcdd1YjXRFRx3ZW7X7tEWqrQ8QEBmM/fqOk0ruxd01syQ6uOhvReMNkxJ4fn
	 lFbCYsV9eAo+HvHn8OvS3kaPzqdS8gdKHj5HcOYbrMpMdC2NkfJYjse0AvINEV7XQdfAn
	 UUjHjA6FeEuMvJLldNoUj9oIFDGYe5KCcqOzrFrgJQEs8F9BOg9Y+zXSlaMyiK0YcSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5BsuAR7tQU4WUcf8weZu3zMPIRDkdAbSdCayryifQTg=;
	b=HjDmd3f3134/1b3o6ak7HAmCjfh794BnIdIBLx+0rASlngsqpiwd6PPbiYDWw59ot2uf
	 9KUHunaRUfDgk5VqmPsxLFAS3LwsNyPQ5Ox0rVNpkxacbCp599NjNVNKVyQUg/Zm/LFrY
	 qvvVx6DEpODb/T9Ajh+Ymsde+3FifZ6gBaDNwZqQ1Y6UuD5Xun7h5M2le100hhqr8tWDT
	 E94Yi04c/1gWtzr248+TQVEvoSDwaflfB/lKgz8XlSf2LuHoqEWDEv2uQ1CbZUkejX1ov
	 56cBohfIRkJnyjKqZYshGc/IOymnRWULkYRYyD0NXqgNav+uc7yro32pz8TEVCxmkdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793032247;
	bh=5BsuAR7tQU4WUcf8weZu3zMPIRDkdAbSdCayryifQTg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwlIHCAFUHsosGYZ09/lXi69+8JNrlWdzDGbDX413B5eopnb/S+Ct1/Zx2txLPi9l
	 R5vm7hM61ImyOJkcr75KaKD7TrnT3SyuZZhdDK1diqiv5AtitjYTOvm0CIqyGW2KwP
	 jcqz/lGCbs8HK1P/+ePDZdygWSAeTqYvfSlXJ4JFLpB70hEVxw2sXA8e4N9gyvF094
	 Z/BOLe3i4jIVyg29loEXRyg1e3ivbH4t2NRHnet6jCu0jJrftHY96mJ2FosAgKCg5Z
	 oH+qMZqLYnW9YhfaaxkswzJDTukq4ils9LO7CVZqQNrUdY+0SXppAt833Q+R8O5qic
	 gzuuARVxNqY2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5539540708;
	Mon, 26 Oct 2026 16:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 854473A7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76DE060635
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujmEr7KtAczq for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 16:30:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3636B605F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793032245;
 b=Mrd9zIfP9m92986g+3Uc6FLCpIz34DjaCIPRdZ3A6kAncuLbER8W68UWztSvdz5nMdK5
 TpN6h0dQrIqdSAsTUONM89e9y0Zsf077X6en/yY5CdsmExjSSCcIPtq+KUWvK2EquKDNB
 pBtnodmHcVN3rzLplUOu0PY+jyhsJA/0F+AN5QduXf1ya+O8KxhediKWDTHI1lecLORlf
 ueSv7rrYjlKVYTM70yBg+Q3M+SvjVggdd6uvEBZNb8n80JKMJOdwSeavfAivG5/i90tQj
 NxkUcPbLHnCyOf3s1wX9Bsd6Fc1wb3gXrlN4yt/46pReTWeFe7bB34hl7BmFuEPzkQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793032245;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=2FQcie07bLTeSM+sBRUaft5bksNr0o6RPa3zsbvl7z0=;
 b=Q/PO2msC414urWujUDoDRDLkgZco2o97VUZMaL7Z6Qtga255feo6JIvRVZ421au9CuwR
 z/RMgU+e3X/NWAo2e+zoiQKe0dKAt2rKbBjw2cvYFq48cljqF2M/5w/UfiNV1Y+wP56h+
 GAiwFZR50aLkKtzB+sRfusF1l21GnPphCZZk+Gjp9ewp0wAn6+HxWTkQYsNNeBIGfxzaX
 fiKjmNGH4TYCAUm3bHzW1lusVAaFvCO5iBC1UZNntxkHkOn8DuTd/gRjXsGK2mVHZl+iq
 qNanF7zVC5BYTKqNV6aMvG5EiGEHbDhGiJBqApN0ue4nsAm/RX5T7/451hVn770izdA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=a6P3TUdJ; 
 arc=none smtp.remote-ip=62.149.156.71
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=a6P3TUdJ
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3636B605F7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:42 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LNaqxB7Yx6WK8LNaqxS9KA; Mon, 26 Oct 2026 17:30:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793032240; bh=8vGP0KbgbXQTkcsuF62te3BC6yHDIwSDIfUeqHcvmAk=;
 h=From:To:Subject:Date:MIME-Version;
 b=a6P3TUdJ2apP4KswxkhJvUWMAcJdRnqARU3A9zL1btN+YN7KLOTEPtTSQlmY+BwYV
 Mx/mSNLSUxaCbKYy0Jps+Az4HoE0wgJ6R9C4oKvKYgb7KZOEHUu5RLsRmytRIx7OLR
 71P0lght7eGXBH1lDrAUJh4mUQBy25ycWvyVoNErgCi/QiK6yXSbz17H0FslBELNxO
 JdxqryMQqaOzUBsD8KT/ZEsygpxsePOxs4Pcr6T/0B7YmFael4Q7iBcUBPpavJxRF9
 fUgy4fa5EDlMemP1Ifpcz+uOq0ajZJtUZG82OX9QjK+Vsk5/Tv/b6favhAZLUaEfbk
 2gX4uDpjTRy/Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 26 Oct 2026 17:30:39 +0100
Message-ID: <20261026163039.664191-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
References: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGjCWGsj51h1AKzdm9qXoHKawtUDN/P2ZwYYU2a4SeZEqLZu1laVuzEm1vHPfibLF3859+nOoWFAG+mh5jRG8+KD/1hx+vVFba6BdLX5/Dcpu/fvZGH2
 4zakjOtEbTAGFFFp3C8YpqivJ96MT8U+Cktt3bl13JTpQa2nJRZd3BiTZ+JGs0L7VO+ciD20qZApJdXYnSXZ31i0B7qxaCi//90sG7Q4SpZTMRMhM5XvgQA9
 OIsLREm7n0w/lFlYaDM5kUQTL/fFTzoy5pxxPusG3HF55UhVjCo9B13iFJPMaXJ3bci9kACFOlu1d+Z0q8FxY+Epzd5V4Cti851K9bZ7RLBCUNvUMzw5Y986
 ys2lyZO3ZC+05JvM1q8VGCe4Rvtjog==
Subject: [Buildroot] [PATCH v2 3/3] package/trace-cmd: bump to version 3.4
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

Release notes:
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no change
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index fa61654fd5..ee63bdc55e 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8ed41f61010998e4a1ba54778f9077ee7afb5311d38dca9781d7a397dd70c9d4  trace-cmd-v3.3.3.tar.gz
+sha256  604085ab395cc2cb84397dc3d209ea0d0b15ae506f8ea91ff45c86e5a050213c  trace-cmd-v3.4.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index a1b17289cd..f976176a5b 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.3.3
+TRACE_CMD_VERSION = 3.4
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
