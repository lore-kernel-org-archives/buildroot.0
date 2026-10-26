Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CC606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mVR3MLMr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C6680963;
	Mon, 26 Oct 2026 19:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtsJcJ79JfNT; Mon, 26 Oct 2026 19:24:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B8AC780965
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793042642;
	b=WQmuRXUrb+doPRJeX9ha+XGRi1EtjoT2xPfCxAbPiKy4iRBYCciUkOYOjj89dto+nQuG
	 q+pIkl4qxxMRp5HtjdAXRlg6V7qPUwYN9YnSERTqRqTQlfHQbDQMSJ6rvS99x4pyJDjhc
	 5NSYFrgvywxomFBPWW4W0rhzayLG6r7IVRDIf1SQUbmDp4m0IBjGE0PP25eG3tucgYZK+
	 jJ2Z8MdM5daNpSPj2uq7tp6Mg++eI6t+1xczO7V1js6dguVkVeNGFbGUfkBxy9ZwpDU2Q
	 G02g7zBZm7jVltttmdZT69swMAfTs2qyGs4DK3zBd7AHVXsPXY4qvcS00DhroxhW/XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042642;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BuU9WDFXSwj4f+CGgR0eM/s7sQYc3aVmPZ3dnU2I6D8=;
	b=ivU9aaO5vhrATrEfnVPWJkcYuXD0AfFFB543dGtWO934uiOmB0+4yAAtHT2LWJYhJfa5
	 OyFJzK7DZsE43uM0Jhx951WsQ1u+DEQjVy/KjvqP6DBulj2ksEa4sy2+72UxJeMpQxV8L
	 90v+7a8MyVPEdV9H8eMjf90tYCAq6HInfWgMODM1mJdraoNMA5WqDJ2DPdKRsLZ/Snd4V
	 /LvNoeoONOrognS/YcT9igXchP+IAsE1tN+xXQ7yBxvZStVnyyrrWK/l26FmsiL3eTSK2
	 DRrz6AdjhOuMQtLYvihkkblEeQxR4/LCaE1abd/7wjgQcV1EYs6suzQsBqRUmiH1oAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793042642;
	bh=BuU9WDFXSwj4f+CGgR0eM/s7sQYc3aVmPZ3dnU2I6D8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mVR3MLMrVkLZq7KYk90NMlACKfycRx4/hdqR5LSaFU1g3cEW5YfHOXp7/F6cdeSCq
	 c3TgLQd3OBAZJXqy7y1Kr6W0yTiVngsLnCD25l8eeU/hRnCOPhRE8osZtLmMw1A05b
	 N4BQGYWYhb+iOz3p9cWch2MCxp53kwrH80jUfA8Z/0bA4hhJbmcjlv1kHcAwYd1Iqe
	 U1H4zNjyn5qJlCDipcRjkYoQUEOxSE+zkM/9DJDkHyBl6xDVMW62jjNr3fcWXinP8S
	 EYVF3lZQeeVIzs3vLrmZC+IasM9z/SVaMG2TCttodsTirpDyUq7VLmm9bvLULguxN0
	 rNieI2669cEDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8AC780965;
	Mon, 26 Oct 2026 19:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A2F356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 485C040401
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGGLJcCpQOxn for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3245A403FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793042640;
 b=P5A6/X3OG1VoAVw/vgHPA/cU2z5fuoFplvE2wnH8ds2GsQRKk0SoBn8KHhIEcNVAnkFm
 RsLL0jTrp7BWZNKMnsIZCTgySKm36tQqb4oGtCkR7PLcSEI4lQCynC1VkcPkB7LKNSDUb
 mECuUeEWFGGW6ZcLeVnBPEm7atudmEBOcoN8FbcSFw9YoD17bpQ/gmBGCHCFJRdPsfN34
 sorBcaUn04ojSgfocRnEXzKbEaOIGp/Zn75mLE1HWpWeMIcKt1kEa3MrqmDBTu7v7IXS8
 RKNOmVpweykMUmtZ7y/vsVN3HDxGaxquycxZ0YThH+3Wo1IdEp1jOPe2ImYcyLU4jcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793042640;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=MymGfofBvDCHxAYCWf28g+PhV/kgI44qLoUNSXxvcBo=;
 b=R9RjCKCxVCjy/Y+PxUK0GPvGyArz4AxBqUFLTlxhnIbBOajl4ncc7QJT3noT+t1Jl/Ww
 ldRXD4TJZo8VIjgjTT3GmzWQUkx3kkNeCskEazQddrfe4eC1K5fIl7kNGEW4gi2HJTL90
 HCrwjV0zGU0wLtlQ60tlBAMyUoOh0bPJf1SaabNCCN41tcLeKko1nDICFxgI7ZkQILQqk
 9uTjkcWFlqrrD+8c8NKvvUDRsobyap55VeXX+ypTH7ldxx6vY47YksN0SltwrnTtcQJuL
 3MequkQaVNT2RyBM9aA6P0c4qZ1pGaFw3CMRe+c64+Ljpaj22+SA2LqgQTBLAE6AJlw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=IKvtYbW3; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3245A403FF
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:23:59 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cd5d2dafeccso1195616a12.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 12:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793042639; x=1793647439;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MymGfofBvDCHxAYCWf28g+PhV/kgI44qLoUNSXxvcBo=;
 b=r057/PvAnEqHDxNO2BS/pOWds3OM4mjNcJe+Jfi1sSfZAujJSrRDfFRvxxx85dp41q
 +VR3TTf2Xy4XA+FmBstRPiGh6bD2chaZpQcq8ZJIjBYAIZdcLv4aOBPHgnTPmfk7MiGj
 yubHf3qh29iJrMfj7tD6AvtPc15MTrhi7L264gP6igyZt3lzZ3vFhgd/XmI9+cS+Emp6
 9jMRAFmMyxdchvtrDSno2xIwfP1ZjYFfTi49WxT8ARRiCDFBEoIpMAYiF5j88KpsNkZu
 f9jq7lRGx9k59TIuW1OMaYI6SHVquZyx/yED0JqcBJerIq+U1sLjBiCy/p8VhJfTpqt7
 BMVQ==
X-Gm-Message-State: AFq9FYJWYQGtEA15wWFPjtTr+3OGsIDxXpQy4RxfSjSopXyE8Z86sX4k
 YG0lTkZwMG0A2u6VMQlYNXm/eSregQQULbK8SLNW3Gm9R9/CMpVGf2/P+lLCBnIwv3IpIUgwfHG
 EoOSvNPDrNBC/l2TnCwa83u7PmU7LIeGfhdey49SA/+p6cYn00D4UQkaRkrVHCxR6GbsxC0zCPh
 KRht0ES5jT+uzJrlem/Qa0pOJlol/O6uMid8SNQSRkXrpy5HG787xc+n2smaeoKZRTi3Ap9Ikcs
 Pq/72GKmmPatDE=
X-Gm-Gg: AYBFou0EUT+2LA7/9Yum0cfsnmg1GV6MJqYn/mGV8AoHuhZhm0v4EQNO6TlmGL78UNV
 Loo/QJ69soIPkirpFiV4lNd1We4D+Xn8PG3YBCxRWfgky5+DcZgGtsnYsa4QCIvYuM34BcTZ7yZ
 7mugky1i7Drvjj6G1xON83PGKpzL7L8I3Q4YdBG9KKk5A8+vbKWc/S+q9o8/PIx/tH3uSQno/wN
 TFW2sHUpnjeu21/e4y1LxtzO2K58HxxPilQ9U5qu5as6xowGmsr/GoiaDN8KLw7O3a5V1toAnTu
 MkODRimIlOQfjRZ5OU4w00AlXtUJsSNI0+puOds9kAKC4xjIcutb4Itu+0hDOtqPxqLfMvLFPCI
 gYb9l9PIpgYs5OCibYB2HQkRa6gcMadq1DwcSmr4qmH6VrfLA3jBCP4mAqugN5Xa4zUk4MvsuPV
 8+Gvq7cvka88JBcDPEnr8aQvZEPAJCWNxzW3CZaw==
X-Received: by 2002:a17:90b:4acf:b0:3ac:9e76:aa93 with SMTP id
 98e67ed59e1d1-3adea0b1206mr5828134a91.7.1793042638818; 
 Mon, 26 Oct 2026 12:23:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae40784dfasm327014a91.3.2026.10.26.12.23.58
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2026 12:23:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91bebff9fcaso120539406d6.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 12:23:57 -0700 (PDT)
X-Received: by 2002:ad4:5ae3:0:b0:91c:379c:98c0 with SMTP id
 6a1803df08f44-91c48ea4a49mr133377986d6.56.1793042637338; 
 Mon, 26 Oct 2026 12:23:57 -0700 (PDT)
X-Received: by 2002:ad4:5ae3:0:b0:91c:379c:98c0 with SMTP id
 6a1803df08f44-91c48ea4a49mr133377636d6.56.1793042636742; 
 Mon, 26 Oct 2026 12:23:56 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a69129sm79556636d6.4.2026.10.26.12.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 12:23:56 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id BA9ED532; Mon, 26 Oct 2026 12:23:54 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Cc: Markus Mayer <markus.mayer@broadcom.com>
Date: Mon, 26 Oct 2026 12:23:50 -0700
Message-ID: <20261026192351.224135-1-markus.mayer@broadcom.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH] .mailmap: create a mapping for my original BRCM
 email address
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <markus.mayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map my classic Broadcom email address from older commits to the new
standard format. (The old address now bounces.)

With the mapping, Git will show the new email address in the "Author"
field of old commits, unless --no-mailmap is given. Signed-off and other
footers do not change.

Using .mailmap is a first for Buildroot, however it was introduced into
the Linux kernel in back 2007 and is a standard Git feature.

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 .mailmap

diff --git a/.mailmap b/.mailmap
new file mode 100644
index 000000000000..bda50ce6c619
--- /dev/null
+++ b/.mailmap
@@ -0,0 +1 @@
+Markus Mayer <markus.mayer@broadcom.com> <mmayer@broadcom.com>
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
