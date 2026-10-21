Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3F606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gm60DDB2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=APQAvTeV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2193482014;
	Wed, 21 Oct 2026 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuVxObtI5S6y; Wed, 21 Oct 2026 20:34:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 290C7819D2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614871;
	b=Cworg5jO3I/XV3015KHTD8fydRKK6yY2yRUuIEn4lTY7q/aNV7b7ffbsMLNGmRHqF0q7
	 ujKxqEhO5leQWzn8+UWKdZDBfRzv/x9TKj6vSRoD/jJmyExUmE9G0vJQyuLyOHNxO2Vcu
	 xgJOCjnwFD4VQZLMPvIwTCCG92Yh75LoEPo58+/pXppmzgfxs2Fol6qGlH/+8iRdwqNv0
	 3OjSHExLQNgJZCJDyFI4QO6SG5l+9rn5FdipPFDbhprTyTQ7AQjC1gw/YXF/tmOpO9ujK
	 QAFpFvYajbYrc4A94uC5GsW+M4OPT5NELaJI2UKre5/wEDSZmlvs1ztjt7sBkva4cZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=z8xR9V2W553mEHAzf/Ht1sMu6bHTh3Mu1rbcwyxprbU=;
	b=V/UuEJmYFvdZo1E1Dzy6GXUHXe7myNBpQUI9f1uWIG54Zz+8N+a5a9DlLyarrqou55/g
	 xZD6d4ZRRbH4C+utmzDZCzWhdkh2MV6ZSy8iJirc7WEB5RA9viMJiB7UeyMbLrtBRLXEI
	 VDbI45WPeLDg4ZEeX8G/dKv92yvkG5hcsA8ZMDIX8tNBt7g0E82L7wKG47Gc7DJwMgwqH
	 Oi8dxNg0ar0VYFBa0JHlL7+jAaNFjkYCwUCLA6OVGcy1AIO09JY0zlIha9oY0kgEcBAxL
	 6u6zAI3paMswFclVEZRHTE3UWO3qD//fv1mVAdTKZrtWsereSx1gJrCurxFuReF9Dng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614871;
	bh=z8xR9V2W553mEHAzf/Ht1sMu6bHTh3Mu1rbcwyxprbU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Gm60DDB2vvohqyRxTMMTFhmZAUsIk8EqwcVRfJCjXiZWNQcQ/boUKUYGVOrr7HsAy
	 rxi+p4R1O5baMagVX7EMX3+WcI5rgU0vdPp16TTQWBWQjFpnMd+OqUrd0rpnN/aMEP
	 /zQnSysEpX+PzlcC/1jAOoazYiYzvtFDAAcNf4MCt1i5F+U+O4RJGvQRYmeTaI5Wyb
	 eNT2FDPhJMmbsjIynnJ/EPjlbtQNEKhilg2rJTbIfXl4R10xf9f+J1lbFeUbqj2jZT
	 X7jjFulsPMEAX07Dzg8eSgZZyaj4v1VWadCKJkXHJvQ33R9oVr2dWpHs71duU/HjrV
	 0dV8vIoQ1tAfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290C7819D2;
	Wed, 21 Oct 2026 20:34:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58883769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EF6961614
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6cLUpwWn-lF for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 923C261611
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614861;
 b=kCPoXpKyyHor2++ePmeL01o5A9ExaWtXBlPA5EJGXQEfqsTfoN39EKlxI7IYVtl+/mHB
 0Xt1t+5pcs5jc8yj0aNGqAEIOfR/qpDzFU/MJrwAEZEudP0w1f1ryOJlv5bUgA95f6Z3/
 KIbprrKVcYJS3T3ACCHN1mCHMncrIy9XykA/hCQUewu4Hj6Qg746OWozV7g7dlw/Klws1
 Iwr/Th/hbfb4Y4HrzOneGKcVWIUQ0fsB2LcBuaAfyTsmgGKEEq6AioHplSBY7iUi/LUk9
 d5wsth/64pfnJKvBU5RHtrPquEXkgtEVlQBB/+96UmCn6Mpv5+BYOWr3OPRmY7Hjb2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614861;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9r1jfnaSK+PHmM3H0b/BzDReh+zUzCp7B4hRMLAq2CA=;
 b=hQlJ7UUoW3Z39sW1AlqRh/wjWhs4tSejmQaotaAoDDOosJsjHL8NL2M4lkDIHZVuafKm
 /dOyWpelfWqXQ9tXE7rXPSOpuaj8MnrYJOlumJvugBJxmXVZ58j3uDLg+gQkNIAwMhBzR
 JWF9aS4qk1yXzVu7oNoIetQXUot5X6tRlAABs8yebCtktqSl5teKgiAVIjn9c5jZH3q1O
 ljJJ0iJ779mSkKBDBAaTl0nCTSyh8SYHdS6vuGzZ6PdHHPq2xb1hiVvcBQ77OrwBA8Vmq
 JNlPUF+RUGHQs52BzRvtkyURWHoPhRb7m34mx3xcIMyYH3W8etjNx2q4C9YOO/LEi6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=APQAvTeV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=APQAvTeV
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 923C261611
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:21 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-8253bc5a613so772889a34.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614860; x=1793219660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9r1jfnaSK+PHmM3H0b/BzDReh+zUzCp7B4hRMLAq2CA=;
 b=APQAvTeVoDF76woVeHkL9qn/H/W6UqIylme0anP8s/33pU4QFlau203UtaaTC4jmbO
 9ivI28932wlLvA6Gj4iKhjR56KKUpKsL8iAUiSU4Yldi6DHqFGFuohhib3hIvjBw37rB
 NAReivpDJKCBxS+PxFVHL5ILuKD6AhA67EAHIDNo4IIe4bWdgBvc5GaI1+AoY8gRSk9O
 qxfJg6P3jBCdI4qgoN2fDSVD7r1eDsquxjcOlOYQ4Pq3UrZg+kwiUMJwRoNV4vmRb6Uc
 4qU72DwYWPw2xQJORKYlSlWxnJdYI7xCX1K4iJhVbJpJZwxn1SGbN/QmJnqF5IK97vfV
 AJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614860; x=1793219660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9r1jfnaSK+PHmM3H0b/BzDReh+zUzCp7B4hRMLAq2CA=;
 b=jU8JS9EpiKvOmDCgtqjawzRV952Th/T1oGTSQ96OMgAInq/LBZdL45xvdGme1lAj85
 0uOL+87jVmxFr1R9gsaiutOWAIiuPNY3Rzp/sWMkzlcG1u0pehN0Y6OqwlyaHxUmVeQL
 lwB52GeK1PeHbGndaB9JuDKopIGv7tuP5EW0d6/e9M3VVep+OuxhHeNxTR6Ql5+9e2Pc
 qDR47N3MuwfS+/wlnpqEgUghD1ATWoQUGlmXCc7d8mrcX5uf69JPaBex0OI50SMD5TIO
 KiPtCRSLSlpAIiDlt7ThqRMpzFntJxMEsJNO8Om7NZsO94dCX4z998PoMolJanxRwuF4
 G6rQ==
X-Gm-Message-State: AFq9FYIAVxHyLq3aRHGKrYqO77CqRameZJ/T3B88YLOUTLhzskVHBvOP
 8oQrhnUZJmDsz3WZ6SDuB8uDdSiLlqOfOO4X+cBhkoT1sLwIXETJ+xGi92Ifdg==
X-Gm-Gg: AYBFou0W9c7LOV3GHola0+v3XVvTww77UYqAX/I1BbuHlv+C7Pz6kFdwfpWwuudyZGs
 fg86Vr9lf6Zfmhh3xFsh8XdXmsLERbHDqqHrv52Yezu1Kpfb9IDQEUZzf009tmp6d7rGUH0ENvN
 8+OiFbW4dCQg56gtu+13F0mpTc8XsJy2oTA5PvZdfhSqGHtxQMJ2gfjQmY7huhAhjCCACj4Kp8U
 BTafJgZXYNmqQ7e13zTUvTrr826636tVagCptbM4GRvZU5N2jIgDeslI+9ajpYGlUrFomRy9COo
 B4+kVdidWqIaSJY+ZWXMtexPlCqHfX65aiHszxkhh36GCpdHm9ly7ictT6PHbBMEP/ulIemI/iL
 V5gLWvbB8Oipr/fEzEQzqYslQfQiyu2uksyAVeFK0aNSR/sniy97KN0ENbQQ2FMuFmlVpCBSO83
 kj4lwKrqCCoF2UnpzApCRqjXOiAyXcmsI6beOKS5yiMIBUiVYN3VyVchMVhCjOhqtquuQhLMhsJ
 no0Qkhqxax6ccFQ6SyPENV0nCLeWUe1Vq2AtIR2++awgqN7BwP/k6IdLgENDvOZ3XXW5goZo4k9
 itDfBgF1SZiXAovZsg3h5yh2nRIJBXyAc/1UDyG1CXbD3aUxOL6WuXwLvjLNRPjzsg6lr4jhDBd
 O//EZJRwM9vS7v6I4gth5pZ6orJ35VmgtKgI941KBZJd9UwA7xV9jfPuqTD33K4rje6CiXUbwhv
 /fzb5VgfzPObcC07sqeISMEUFN
X-Received: by 2002:a05:6808:3501:b0:50c:bc6f:fba8 with SMTP id
 5614622812f47-55361baadb5mr2080747b6e.65.1792614860089; 
 Wed, 21 Oct 2026 13:34:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:03 -0600
Message-ID: <20261021203410.3114473-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 09/16] package/python-annotated-doc: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-typer and carry over the
pdm-backend build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-annotated-doc/python-annotated-doc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
index 6671db2f1a..192814a9cf 100644
--- a/package/python-annotated-doc/python-annotated-doc.mk
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -11,5 +11,7 @@ PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_DOC_LICENSE = MIT
 PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
 PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
+HOST_PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
