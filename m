Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F61606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LR/6/LLh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK0QZdUE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA77E80BCE;
	Sun, 22 Nov 2026 20:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pyU9tO3Z7vl; Sun, 22 Nov 2026 20:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD34A80AF3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795380852;
	b=rOLzHGo7nGkhvbwdfxf7z1FT9gRCeMY3jlfYQgDlgav7qgm1vhDdeyXtuXAxjltig9dA
	 CUAm3H8DVkGGx94lBou2wOWCDadfoTXxiBs6B4+uumk2ifQyQCnHm+mGCP6/WLHqxptiq
	 fQpmGx4z6xz7JiAgZbIvgh/lfRdTL3HlGEZbJhJ57863ewz3ayO6dnzMKtLiA5PQxBD0r
	 M5XY1y4lU1JQRASME/J3bKKZ03wYr1s/kasVMX5nGpSX8VYatn3N/PZL3ZXDu23oeOtUn
	 FBF998F9wd3zwLfwEiMzHWd31PYzu0vvnwJzgf4uapAzIiEnVY2CDyhJx0kRzZyzl4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795380852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+TY7JxsviDyMrEUGocPxOdLcTqVGTKVzs5j2gh1oOJQ=;
	b=qCz96H1dmTN2iFUNumqP5BZ5yz9idNeuGpLHH33dVHTEWLtTp+qy/yywit+oL1meRwR5
	 8f33aF+ivD4CCo7HmNZcfsXMR6DzCbwZbjzwMEmro+3fzTqU+cNXwE+cr5/Ci3Fm9Ny4u
	 fBkYxfe8QP7UGpKWVXXXieAaIRsAHeCoL3zcB8Z+To+nn9rOlzZH/BabNHf+snDkmuh+e
	 laWgKKJnTCxIzlSfXZ+tUQr66Pqs8Ab9riK6hyDLSCVSsnMKsNIyQ/C62iXobrHEB8wb7
	 XA/GfDAWdkhuteM06Ww/H64x1nXDHDw1NkeK/L+TvNWlUrOBF/WUamx8jeNeezXjMoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795380852;
	bh=+TY7JxsviDyMrEUGocPxOdLcTqVGTKVzs5j2gh1oOJQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LR/6/LLhF3aZvZxF7NWVD/Cz3cnSyZiMv7FH3lenlXpLNHGooh2q28knBXLGCNTM8
	 VDahommdhVtNgv15DIozeANAAc/HMQErA+Ac0U3hf5m+buQKdnO24UU8SOhkgMx1UY
	 VfHtMV42PjAEbPwKRplL01aAPYXBn/D/mWju0bo8RYPx/t1kVCl/LYfZ9P0HC3gPmz
	 GnSyg4y0j2k7mvsBzRTRTZRlPNT6RJCNOSJGjsXO5PSYcZMW5nOcDcj1P+ryyENexe
	 CqFKpWjwIRUlGegTlX1hOTzIbCaju7zb+1QW5wvKYx91jDRUUbaH0T8FGx8mFSxayD
	 DZb0vN0nH4S+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD34A80AF3;
	Sun, 22 Nov 2026 20:54:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 500C9465
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3626B4008B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbxPXQCU2-g5 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D6FAE40081
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=IK0QZdUE
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6FAE40081
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:54:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso18367575e9.1
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795380846; x=1795985646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lB5VNqb7SU7WGXiaSNMT4TIHBLMLUpmc7xqb+kE6XP4=;
 b=IK0QZdUEbMmvm5NxG1ZY+SzK68CnrxOPEOhmn9HEdg0UuAwPKGS0JPQG7PvYcwXHNT
 RzDpW3B9gv1xUUlVO5Flvv07mHJWW12iJFPNiMnrMMe7G6rah2K92cFSaHXfAuFtoGqL
 RrMlHu4TZi3mY9Ph9l8I9qGFfcslRpNBPVj4BYD2lfiE3i01r0JOZV8Cxun9XS0Xa3gQ
 oLg+Grr3+qKrjItI1FHRsU2IaAWCBIHmZzULrxLcbN+MdkJfp6eEvmDsFkh1qh3TxQ1e
 sGQLUR7fQZ3V9F3Hn4yA1S3OS2oP+Ja4fLGLmlSS0QTJ/ThU2cf4V+B8qZkR0ehW+rZ2
 TXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795380846; x=1795985646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lB5VNqb7SU7WGXiaSNMT4TIHBLMLUpmc7xqb+kE6XP4=;
 b=gi4b0kG+99o2WChyoJ85RVEWsn/ieO6cmhnpcHxp/vLFZl8yiVixT/KRbG8hCOBxv3
 r+wH5vH5Gn2DEMjqJ940V5nMN5xssWz8N2dPEymbjwGDSDjNodbkUVnamGUdg2voMyek
 wvmFh1CMI8He8vxT+TiFXyBXgcOv3HT1GcOTBL57eAVXeHooibT4KCEcV8yhigHYoMMe
 eWFske7CVMR9wkMZluKi6sKO81NcJg9uwkWhQTUalAKTYYAcVwmugUv1FmzDRq+nDLoo
 EYixFhDbaPzNSSkOC3olf5i3PppYx4m/DAPldZGwtXRsAwtNdUfg3A0um8yUYywIf3Lg
 Ehqg==
X-Gm-Message-State: APuU4Z+EnsCdwxi/ZKCWahw69paqgbwjZBflLxusYsoQ2ShxC2v6f85H
 qDOj0ktSx7KpUS1M1MSC+0liyy/+knX8T0Szz5cOVQzVE78y3/TC1dw+DOAiWqFm
X-Gm-Gg: AZFdTZdFfDRUzW6UQVw71T6Zxb8IG8TOXsmcjx7wXqiGj65RyqHQ8aYOhkWafuamSBj
 k+eFFWgkabZKLwfsp9J9JJYrjR7YYkDz32yN4DIxER/jua5QkISLxpgCizV/Z6lASug2zdmdgR0
 rOGf2rnuqHU8R+LqQbMMGDbrO18hQswSLb0Ev5TDe4R60ugZj+4acAU67sHsQYgPO7PtAItzZU+
 /zlmzk/BfuPPF7s9+Yy9gg+bkpTy8TxcJr8Cu2mQMmfzhjbWvcl+e2EpJ8NQIRqzoOaEp8Pq/hd
 EgrK/uKhaeuPyCv5u/x9I1ToiRWyVK4loiVvzeygdM5VOmRvDiGxh0Kxsji26c/uK2+80SF8TDA
 R36Q2rx6JnRbb1oyRE+1wXOv19if8Xfp8iY+H4QlGMJ3OctgMIMT0ZdrRjPbvIKLvKQxRKWUI6Y
 clvNe59EjeiVYnXzKG/H6AyKVDybutmKwam90UgtTAC38h37MSR08qbtQX0Ox8ExtcI0aXxq5sI
 UyIgcj3YTNWVWpmopxbELxDzbiUHjsAVE5OQ1jUwfkiHOxn8Zm3/RLt/Q8P8TTEpu3flpu5xWDK
 6VSZSENoOZ23CRd/PZcJ4QLgJVAhyZ4NL9oP7cej7s7geVY1NWMFCwAIQtAtWTYpZ5+743+k
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4bb8880988cmr211856385e9.6.1795380846305; 
 Sun, 22 Nov 2026 12:54:06 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm249135255e9.1.2026.11.22.12.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:54:05 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:54:02 +0100
Message-ID: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/qt6: fix license information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes the license information of some Qt6 packages.

- Patch 1 drops hashes of license files that upstream removed from
  qt6languageserver, qt6mqtt, qt6opcua and qt6websockets. These hashes
  were never checked.
- Patch 2 completes the license information of qt6multimedia, with the
  third-party code it bundles: tlsf and dr_wav, always built,
  signalsmith-stretch with the ffmpeg plugin, and resonance-audio,
  pffft and eigen with the spatial audio module.

Both patches apply on master, with Qt 6.11.3, and on top of the Qt
6.12.0 bump series. The license files they use are the same in both
versions.

Angelo Compagnucci (2):
  package/qt6: drop hashes of removed license files
  package/qt6/qt6multimedia: fix license information

 .../qt6languageserver/qt6languageserver.hash  |  1 -
 package/qt6/qt6mqtt/qt6mqtt.hash              |  1 -
 package/qt6/qt6multimedia/qt6multimedia.hash  |  5 ++++
 package/qt6/qt6multimedia/qt6multimedia.mk    | 28 ++++++++++++++-----
 package/qt6/qt6opcua/qt6opcua.hash            |  1 -
 package/qt6/qt6websockets/qt6websockets.hash  |  1 -
 6 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
