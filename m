Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0964606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pVWwg8yw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvKmysCi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EDE16071F;
	Sat, 31 Oct 2026 17:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo3x0ZBj7bpT; Sat, 31 Oct 2026 17:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 78A95607CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467238;
	b=GJmuFVz1JpqDbPXKOdE7qJAiBw+1FgeymhrB90bYhJ2QzaCQD1fjWhVcIhKbCrPnxA9a
	 B16g/4+sCvpHEFWzRji0w8hPLQqyO6ycMJH1tIkpdHPxxjOmvQLTEO2dn+L3rlk8rrXoZ
	 g6TGa2DpYcdZgpNhHqhOjDhOM4m0S5Q3kRL2WniD1Tr/jO+4/BmvIe8Yv5rR1HcfFOXZn
	 O3Qk/X5FcT/HzdO873/mXaO/zXu8q70spH6C3oV8tv73Zi6a+VvNP/xuX8uY065JLfV7A
	 1gGeJVQaxytBKdHoS/n0GvkX61bz4SAIGIF6hIGswoyHqGOWMS5zEgwBwXcifKG5Fjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dfAw/QnKb0OWy3LpLOIls9zCm/gucgN9LFXJ8UuMiCY=;
	b=QZLABhKRCA5BRlNAHllqUVTDNKkrCyq7hcN2y94je7aATkAyL7MLZj11qOX/PTsgSiTp
	 ugFtj5GsUZOTnD/jYDPBqjFT9RF/3fQZiV24aJ3ryjNoBHEbV6foFWPYSZgGcMxyUGdxK
	 bbb/QWfBOlyQp6mufwxTUoKW3JWNjW2obSrc8GIM4vXKvNgyfKH9gdwzRomxyEmJuBqkV
	 Skj1snqOfjvOFfoAKcWcfeCWSR24VJ5udE7HF3TvSypRDTebrxRDRrv3WEbuw3xwH1zJs
	 5vKZt90Iz9zKaApyg713aIORWEKFTzrvMrm7yZKBJzaYinrSDoZDFh5EhxdzuBd9DJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvKmysCi;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467238;
	bh=dfAw/QnKb0OWy3LpLOIls9zCm/gucgN9LFXJ8UuMiCY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pVWwg8ywGcEKNb0NKnD2+5FMF07dABLJ9dv1kzad75DUZxRkhXmgilHXADWMC5Gfc
	 G+yavPSDthpHBBG1Nj6zHidQ0xB/rEq90jxwVrv4NWI2U/28pp1r/2W6J7KAjaGVDU
	 K92XZlLxEQu0h9IVuqjbwixEgnsVigIDIx5yRxXs8Ae2w/zz+cACb2RvWhONmtvcHq
	 rWy6GmZymHMhe3JQ4/jx2NeG9+6crY23F9GKmyotmsyLuMpnvVA52uVY7zb/HMqXXe
	 9N5q1Ai9HvqH6d3hiK7MkXXs5V+pZ4F85vep58b0jPuu2mdI93pFl/vtb1AEgbNE4W
	 Qo0QsrRfRvALw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A95607CF;
	Sat, 31 Oct 2026 17:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D96BB4E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC142607A1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWARq_dL8Mmn for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC8B160787
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467232;
 b=SfJL+TOmYFjgH5WmtIhu7V1HiK5yoa2z3QFaiuFmLOo7sOQyCh7jUF+XWY2Iv9CE3zln
 zag8Kt2z2XSKL7RjhRmbbNjwfp+QkvEWkL5EcoaMjIuIBzsWmoYCq1wDFaVlU5nLAypJ3
 V4jUKX1k3bY9PyfA5UCgV2cilsLtYceowS8sTTnhzEjZKOm7Bgfdu5A/q9yDgp83eIRPH
 NmpxT2Nr5Aqtfku94NFv4/m2jCFC5FHGqIDmYg2VlIE234rEV8RAylF40UP70UNpeFzVe
 HBT2nMHp+Rw4geqZ4BpXU0OKYJJtf/L3mL72Be5uhm3z4drTqha1/TNqaAaVqFPzKhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467232;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZUvk6y4IobrRrGITbrEZa47mZ15y0hTAgBVPLEhf2fE=;
 b=VQpua1zHY2yh7nqBDoHiUjAjbIVnmag/ehmSly1uAZDtLkgz1iLsWW8421dqm9gUr0uK
 dg27dwAqag590HA5RrzybxRomPmYNZvwsbnSCLRKVGVl048nDatJ0e7qyhBLX0GYpZyO9
 k12hHALv+7V2wOzyTwjJTFhFWX2XcoJufnBoBfG10sToJkXxRRLB9kiRqBi/ej//qwg4A
 mMFxb1d6LHaWhsqmibUcN4nZBciPnXZ9TvM7zOfaMjBP5Y0Xqey5P0RbMmrf4CxfHylMI
 DbKx76+ZnAB7Zyn0BxxhkbNJfO28vofy03iT/Wvk400t674in4bIoMmmkmyd2bikPUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gvKmysCi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=gvKmysCi
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC8B160787
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:31 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-844a8bf7e25so1284196a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467230; x=1794072030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZUvk6y4IobrRrGITbrEZa47mZ15y0hTAgBVPLEhf2fE=;
 b=gvKmysCi0HZH1nDmHxwOmxEhESx1Ngf5Asbve0KvYOaFBX+8XnLaID2YGCjtvZ8TR5
 ClCYU2gyZHIQZgapKl1SlaAQV/lDIMLXJtP84YOrPZerkaFNOvuHKuiCW8KILpg90kVh
 qQOpR5BNYKu2tZVxTLM5ckz4xk4A2YZ1GDVBcE85g6TAT50YwaPz/cochHsg4odu9BqJ
 M/0KDmMoMvMZXebNwBfqVhyVL4WSCGkHe4/4uyx/ER+2UrY+Nl8S2Ph9yRXAcpgFjzN/
 zmIKE4waeiDgJmcT41pF9REpW9MIFuIjaJrVb5K4H1pOg9v9NpXS/9Ez5l2OASvFF3JZ
 pIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467230; x=1794072030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZUvk6y4IobrRrGITbrEZa47mZ15y0hTAgBVPLEhf2fE=;
 b=YsajsYA44wUMHPQYTKvMxvSFNx00HQ0mkL3zpdU1hEFmxlHhNDn1zdo1SwgcbDR+DL
 8phumri80eqf+AMbN6yE8Nn6O5/DHQrkOBb/45Qd+LxADbA6jfevAwm1FkRH9zkeUQh/
 9wCBwS87CuBDXzSRB9sC+CNTjyxHHatlWDKRnrv5YXg18jdBW+DjL1NP+2JWiBC5F/YL
 oyvL1S8CMpMEmYd9/NZzPKRu2TuAKWm3wR7yuw3Wvxuw1l/1N8w9EkilSd8zdK7XSliB
 LGQ3kkoahDZ61ybhrx3zbmhknSeTZv0Vi8Uuq07cFqztomE4bdprdn5Hj4V0+S0X/rvM
 BsHA==
X-Gm-Message-State: AFq9FYKZhUPemXbU75Tr52yhex4D7tb8q7rwHcK6UJGeIye2Iy3qLTTX
 MxiW5CRxlGA6fCWSuqV4GVV7TV1SCBxR27RrQT2t4Us6/giZx015qFTx71KTkg==
X-Gm-Gg: AYBFou1jcC7hQ1gpmaSEMSRcWtl8fDesXTo5QJkDM3XXk+X/s8XXRu/lK7+qD7hdCI4
 p4zrm5o4yhRUPDB2cnwrfnWGy/vs73FbocndCdPMDb+QBSkfLftRsEuEj3TnvPOkkHCpgJ6Z+aW
 klPKcJqEp6bb0p7OSPudMDs0AqygKQv3G15X8BCcxYMQUiZktn89+N+McVw10yfEgIfuTeXEkj5
 XzDLrf8TNB+1fqHMUfoYgdv6WQhZwmcUiciVDG3nByLX09kPdL1EJLRIUETvvvfl3BEgR4L+JYr
 8NihpzYUqYmseg9mUcfoqQu5s3t7vIxs2oQ3vWTKELb5i+F5evQryvPHx9iHixeyBY4F1I0u9R3
 fpg43fBT7aHVJ9nFOX8RCXcIbpttWwQ1kSZvAWPE72HWGYiAIBmsMNFIHQtCeXP8Qe/ehd48urn
 lrKdk50NPjr15ZA0YlzdYVO7ZBKCDIHfLybXXQ3qhQwGaEHmtRzYEUOLrVNgf9PGWREpr7m3CJ9
 sQCEYhuaixNJCikMSemlhLbeqlozt6RAWiNmRS6AlnnzG6XvV49czvBy7prjZWBuesGa2CBBZFf
 uRDawxcZBbynhabkOXWDFEDcaux77DQOGwLsehv+QCJKT1m9zDMlr6zAxrsnR8kpJChT1kCbHwo
 4LiSXPD9BZ7huUlsPv4/M88Wi0mpJXzp6FDqcxEgScH3HTdva7ut8cchbdVch1SURM5BlR+uiAh
 /aXC1B3jV/dxyhCZxS+CLp6vGaKHhQipSQkpLokEPYAuRI2avhBPkvJkQM9nLVN69vBhRdJr9qt
 Q==
X-Received: by 2002:a05:6830:25c6:b0:81f:827a:b1cf with SMTP id
 46e09a7af769-85d3644f500mr4443738a34.22.1793467230265; 
 Sat, 31 Oct 2026 10:20:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:35 -0600
Message-ID: <20261031172019.2683287-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-google-api-core: bump to version
 2.43.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 2a619a6c1e..be09a0a49d 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  2ac450a1a704ecc4b73951dcdb69f7d4  google_api_core-2.43.0.tar.gz
-sha256  d67355a22d995a009b6c5ca98744ea35fbf4f9c2c006aa0588c0941d1ceb5216  google_api_core-2.43.0.tar.gz
+md5  ca991e5ca3103553a8798db83c30be5d  google_api_core-2.43.2.tar.gz
+sha256  5dfc5e9d52982bcc03bd6af380a893365b5fdf907dc527f63d3a372833c33329  google_api_core-2.43.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 0ee2d158c9..9d58e498e1 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.43.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.43.2
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/bf/1c/83011225511b8a0aeee9633d58d8e6b5d858ea5502e76117bcefb620245d
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/a4/74/307919972c4dc84598f4128a8d6ae05ac3d9e6ca73fe60a7bb93c670931c
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
