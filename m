Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F597606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JTS+djTi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PAR3xwLg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376B480CA9;
	Tue, 27 Oct 2026 16:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybOslAW-uYlG; Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5319080CB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119221;
	b=MIMOq5kM0x7yHsbE0L2uqVFEodjIqrmPeX6142a+xFwxULtk03gJkaiafU8nXDyc+ByW
	 MET2Vp7BUA7nLdoWuWmlTcgM6MH8s/uYTAk9dbfD3b4/midcHQxSdDuV/1N0FOwenQq73
	 LsJ+/apTMZbWEFBqnonWap6U36BzBwJnJCBXly01QGYIbyAc403kzS4McoSJx2mvHqbdb
	 N/Ml+eDHnVQg/pt3qidBWgaQ7FPZCFA6Y0j6fEtICDydGRVPM2EOYUlXyL6MGZEJCtxiV
	 1LOuITDv6KSrhn78y/dWHzF/ON32J8UUH00fgyunC3y/OvoCfItgym0gk4+a1PAxU4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTyzdF6kPjzvMTA9y0Fkbyewlytmai84ynmtT50BIts=;
	b=pvqpHOaY8Gqa4W4R6w9ZKh4kAU4GPnwNo3CWfL9kwRHizajlFYZ8g9wSM297L/xjsxnQ
	 PN8qx986e5aRmV1rzVko2XvLiWxeirz+3y/KMIGOHiwiMMGW5iiCEZBwlNIAT7eiL2YtI
	 JtLQ78Ng4Ug0wlxFm+T94Abs5y3VXtVEDEPUKUvetdukTeAjgOr5jYmqd6QFUBaSB0g6z
	 tDZA1fL5+I2l9mpXRbWwHU2Ku8BQIa5Z7A1ks08jEvDeDIhKhDU+Xt7Ffmqwbi0/Yuqqd
	 g0C5b7ocU569IctgldKEjlBelMrbjfo6uMT65EsVj/FQXGK8KsrkQFokXo0Lro9z9bw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119221;
	bh=bTyzdF6kPjzvMTA9y0Fkbyewlytmai84ynmtT50BIts=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JTS+djTiBWGr/n+tBNSByUg/ZuDUUniSb3ZyngUXpRFmQSlSOgdCCB+unAFVzSkP+
	 fH4M2TSc+vOpbQjpUqKn8NNjGJ6WyJcEd8zfXHZG6rwijvrE1UpVjnmhkrZGoDt2q7
	 r+12WMcy9nyuysRFFIv8QcaNh2WMvKQ8WuQcRMF0hftxmQnyBjCzqI93NpM9c9Fv1d
	 1up/aGIOAbO8kkl5o5/cut1WcRAHA32GdiglRVRDzWPRafx9znATrrQvcnAuEoVDXR
	 ZBw2Kyw09sgoclfe5ukmAiUJeSTBD8QMP1bVd4Cvrp0ptU4BGvidQcESuRWNPkvGhX
	 6K30qQ1/SoKUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5319080CB2;
	Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E42A272
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E179F406FD
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Vpej12PIq2B for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87C5540534
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119219;
 b=LbCHBKb2zXSikMG3WvaW83QEMsTyux3vxArK+Thc9obf+FhYsoUm9xe7QZp+r6GrVber
 YrEcXcu89VDhbwfvZAVTvSWLiWBPHDuufcVxEqPpPkHRIyrOX+gezHrUeQZ7S9p11TTJU
 ooXGRxmcYhGslQx8ebEFIKE+vZDhsObNKCGZ81tUqTkuzHu4/UHOIAyXtDJ9s7pfaNFFl
 BfB5GYr9Oc6TrqZGHPFRuoWEs2M6UsIM0ejdbxOqYW26KUMpeRGobu/SZK8TdTkE4uCOx
 AaKbwTi27f8QCaQnNf0+5TWuQWl+wmjYBpfL6mlGI/zAeZc3b928QVeinJRVUym9bAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119219;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=KBKrzKALYP0lPLVykPV+ckcr6D70lrpKgftFGuNXu/A=;
 b=Hwuc1exOjogUxctAsWOXtI4ykkq4B6mifk9P3gfz7jKWAhG7B411anwhwuHqymTq8+QX
 DjV4TTszLhOJ9B61Ounj3seb5RSf3TvGztrrOZ+c6AcA7x6Kw4Kd/VNLc+cP04D12xeh4
 Fc5zgY6272DWC2MdLnTufMM+XeC7oztkHMNDIiEIhR6X5GPUOt52aWISU9JXpsloEogEh
 Wf0DLjrT84r9rt+dO5LZ3U1jEeDNe6aNfval1r5jhSLNXsvJixUBt2vAN/JiUHrAg0vtt
 HCxxHo/UkG+ltoQ29B0zuZJjObTJhriCd9226opVEZu2yeNxUySPiCATjuKjjlDdLwQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PAR3xwLg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PAR3xwLg
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87C5540534
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c499e0e43a9so29566b.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119216; x=1793724016;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KBKrzKALYP0lPLVykPV+ckcr6D70lrpKgftFGuNXu/A=;
 b=PAR3xwLg2aViektvrmHOV1AY7NT8Ex5QjOr+6/G/qzjQh6qFmlaKWcRQHIkpG8KrXO
 QMFQGC1BSAaO40Ug+2TY8ssUzpXulsjjn0cuiUzJ6txIFwWtaovtAY3sVvJsUXuSv9IE
 o1EN/IYEqyZGomVOk9TnNjVUggk96Vc95pjx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119216; x=1793724016;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KBKrzKALYP0lPLVykPV+ckcr6D70lrpKgftFGuNXu/A=;
 b=mjgKM42o20zNGJ6wyu++2PKdF32y4TvMC2nx5tyE5HPYim2M3jqEBVlnBDeW9WQy75
 2OUDm1uv/ICp0pWqXGVZpIAoHZbfKP5pcgGbjcOgzO7KUT2hFrLTIPsNBeQJNF/eqafx
 vfcFWA6QKHqH+ndfkD1TY/1GNLMSnubvYEqRaEprV0k8FJhkZZyzMbLHeDbvkoEtorQy
 CkP9g+TWMEGuSGPTVKF6vxfrv3p61mq/eSZVYP6G4D4/91jTFgaDP95JO9RtSeOY6Ca4
 BRgmMeL3iE70hihWLdFH6mhzhjYJ1aQllDXF/C/AXgSCXFM8wsbuAKvieGoRS6EuIk8Y
 OcnQ==
X-Gm-Message-State: AFq9FYL8WH0q8s4a5cBmcttfoM1Z+0mypUpSCN3pXMd+uPeF2EnswoFg
 4RmbRn+7dMEI0DYqxiWak4t+GcL2UYps+BBr6HC1iFOLJ2u2tySvsZMXi1hT3qU+NFk4OLj/Tun
 JLxNcV64=
X-Gm-Gg: AYBFou0Cvlp0Yde/use0zLTI/g6SMR57IEPo5cDy2jg7Qd/LH3HLixHFDPDSaFcjcq/
 jGPSwvT1g+wa10QQCbPHsS09lUwsO60kKukL44LxNe47d4Y+NCUhuvJgV2FYOpPbXwSM+tOgyL5
 UAVqEj92H5+SyADwN/kXgl++xJbJLJDZaqzrzqT9EQ4+Gws2ZSeOFjOddKaas8gitfbnQXz4avl
 A0uoqogjTVDb5p1/YRYJXSZPsOLp6Lc05l+O3esQ3AbueAotVk+GTQUkdcwpYo5idYwldrZ/R+2
 8kJ7vLmb2ppK6mkI+wKaA0zm2wXKEJdizmnmOrw6UYiO6M3Cvz0c6I3pTfU71RVOuRIkrq96KvC
 MROuvTaarkhT9lRO1PqysErs1MP6fZqg/YKJHlXfH8r5eqfEue7kJK6Yx5pzKpwekXCcaD+/0q5
 AjAqwOqPo2kJnjDa5OT9ql43XoDYGIX8xTaE3wYb0I2kigWsy6QaWJcNR28fwp+4XlgdoLCIlT5
 ebPNHEmwQXbse+d6/inyUAaw8N/7g7FQKaNIZOIzLMEJkxQP2rCLW91AuDm4yQXI+gphSHN489T
 L819AX7YEwl27hE8YkU9kImXNwRqOPR29VHFW7w3T6hnvRE51hNzhDOr8SLUz60P2HpbtrzyLCn
 Guf3SWVUXA0dS6wSUw5V8Bpj7/zqhbXLiYws+W3MOG/R1LONC/1CHuS0Op7y5yw==
X-Received: by 2002:a17:907:e00a:10b0:c32:8cbb:fac with SMTP id
 a640c23a62f3a-c46bde93534mr1157231966b.3.1793119215884; 
 Tue, 27 Oct 2026 09:40:15 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:39:58 +0100
Message-ID: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 01/14] package/boost: fix asio.hpp compile
 errors with gcc >= 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBjb21taXQgdW5pbnRlbnRpb25hbGx5IGZpeGVkIGEgY29tcGlsZSBlcnJvciB3aGVuIHBy
b2dyYW1zCmluY2x1ZGUgdGhlIGFzaW8uaHBwIGhlYWRlciB3aXRoIGdjYyB2ZXJzaW9ucyA+PSAx
NS4KCmBgYApJbiBmdW5jdGlvbiDigJh2b2lkKiBtZW1jcHkodm9pZCosIGNvbnN0IHZvaWQqLCBz
aXplX3Qp4oCZLAoKaW5saW5lZCBmcm9tIOKAmHN0YXRpYyBib29zdDo6YXNpbzo6aXA6OmJhc2lj
X3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90b2NvbD4KICAgIGJvb3N0Ojphc2lvOjppcDo6
YmFzaWNfcmVzb2x2ZXJfcmVzdWx0czxJbnRlcm5ldFByb3RvY29sPjo6Y3JlYXRlKGJvb3N0Ojph
c2lvOjpkZXRhaWw6OmFkZHJpbmZvX3R5cGUqLAogICAgY29uc3Qgc3RkOjpzdHJpbmcmLCBjb25z
dCBzdGQ6OnN0cmluZyYpIFt3aXRoIEludGVybmV0UHJvdG9jb2wgPSBib29zdDo6YXNpbzo6aXA6
OnRjcF3igJkKICAgIGF0IC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29sdmVy
X3Jlc3VsdHMuaHBwOjE0NzoxNToKCi91c3IvaW5jbHVkZS9iaXRzL3N0cmluZ19mb3J0aWZpZWQu
aDoyOTozMzoKICAgIGVycm9yOiDigJh2b2lkKiBfX2J1aWx0aW5fX19tZW1jcHlfY2hrKHZvaWQq
LCBjb25zdCB2b2lkKiwgdW5zaWduZWQgaW50LCB1bnNpZ25lZCBpbnQp4oCZCiAgICBmb3JtaW5n
IG9mZnNldCBbMjgsIDEyOF0gaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDI4XSBvZiBvYmplY3Qg
4oCYZW5kcG9pbnTigJkgd2l0aCB0eXBlCiAgICDigJhib29zdDo6YXNpbzo6aXA6OnRjcDo6ZW5k
cG9pbnTigJkge2FrYSDigJhib29zdDo6YXNpbzo6aXA6OmJhc2ljX2VuZHBvaW50PGJvb3N0Ojph
c2lvOjppcDo6dGNwPuKAmX0KICAgIFstV2Vycm9yPWFycmF5LWJvdW5kcz1dCmBgYAoKQmFja3Bv
cnQgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYm9vc3RvcmcvYXNpby9jb21taXQvYjI0NzhhOWJh
OWVkNzZkN2M4NTg0MTllM2Y2NzdjYzQ1NDU5MWQ0NQoKRml4ZXM6IE5vbmUgcmVwb3J0ZWQKU2ln
bmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Ci0tLQogLi4uMDAyLXJlbW92ZS1GT1JUSUZZX1NPVVJDRS13b3JrYXJvdW5kLnBhdGNoIHwg
NzUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Jvb3N0LzAwMDItcmVtb3ZlLUZPUlRJRllfU09V
UkNFLXdvcmthcm91bmQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Jvb3N0LzAwMDItcmVt
b3ZlLUZPUlRJRllfU09VUkNFLXdvcmthcm91bmQucGF0Y2ggYi9wYWNrYWdlL2Jvb3N0LzAwMDIt
cmVtb3ZlLUZPUlRJRllfU09VUkNFLXdvcmthcm91bmQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uZDA0NGI2MjY3NgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2th
Z2UvYm9vc3QvMDAwMi1yZW1vdmUtRk9SVElGWV9TT1VSQ0Utd29ya2Fyb3VuZC5wYXRjaApAQCAt
MCwwICsxLDc1IEBACitGcm9tIGIzZDg3ZGE1Zjg3ZTI5MDdlZDAwNGVkZjFjNzJhZDM5NDJmZjEx
NjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBDaHJpc3RvcGhlciBLb2hsaG9mZiA8
Y2hyaXNAa29obGhvZmYuY29tPgorRGF0ZTogV2VkLCA1IEF1ZyAyMDI2IDE2OjA3OjE5ICswMjAw
CitTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBfRk9SVElGWV9TT1VSQ0Ugd29ya2Fyb3VuZC4KKwor
VGhpcyBjb21taXQgdW5pbnRlbnRpb25hbGx5IGZpeGVkIGEgY29tcGlsZSBlcnJvciB3aGVuIHBy
b2dyYW1zCitpbmNsdWRlIHRoZSBhc2lvLmhwcCBoZWFkZXIgd2l0aCBnY2MgdmVyc2lvbnMgPj0g
MTUuCisKK2BgYAorSW4gZnVuY3Rpb24g4oCYdm9pZCogbWVtY3B5KHZvaWQqLCBjb25zdCB2b2lk
Kiwgc2l6ZV90KeKAmSwKKworaW5saW5lZCBmcm9tIOKAmHN0YXRpYyBib29zdDo6YXNpbzo6aXA6
OmJhc2ljX3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90b2NvbD4KKyAgICBib29zdDo6YXNp
bzo6aXA6OmJhc2ljX3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90b2NvbD46OmNyZWF0ZShi
b29zdDo6YXNpbzo6ZGV0YWlsOjphZGRyaW5mb190eXBlKiwKKyAgICBjb25zdCBzdGQ6OnN0cmlu
ZyYsIGNvbnN0IHN0ZDo6c3RyaW5nJikgW3dpdGggSW50ZXJuZXRQcm90b2NvbCA9IGJvb3N0Ojph
c2lvOjppcDo6dGNwXeKAmQorICAgIGF0IC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2lwL2Jhc2lj
X3Jlc29sdmVyX3Jlc3VsdHMuaHBwOjE0NzoxNToKKworL3Vzci9pbmNsdWRlL2JpdHMvc3RyaW5n
X2ZvcnRpZmllZC5oOjI5OjMzOgorICAgIGVycm9yOiDigJh2b2lkKiBfX2J1aWx0aW5fX19tZW1j
cHlfY2hrKHZvaWQqLCBjb25zdCB2b2lkKiwgdW5zaWduZWQgaW50LCB1bnNpZ25lZCBpbnQp4oCZ
CisgICAgZm9ybWluZyBvZmZzZXQgWzI4LCAxMjhdIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAy
OF0gb2Ygb2JqZWN0IOKAmGVuZHBvaW504oCZIHdpdGggdHlwZQorICAgIOKAmGJvb3N0Ojphc2lv
OjppcDo6dGNwOjplbmRwb2ludOKAmSB7YWthIOKAmGJvb3N0Ojphc2lvOjppcDo6YmFzaWNfZW5k
cG9pbnQ8Ym9vc3Q6OmFzaW86OmlwOjp0Y3A+4oCZfQorICAgIFstV2Vycm9yPWFycmF5LWJvdW5k
cz1dCitgYGAKKworCitPcmlnaW5hbCBwYXRjaCBjb21taXQgbWVzc2FnZToKK2BgYAorVGhlIHBy
ZXZpb3VzIHdvcmthcm91bmQgZm9yIF9GT1JUSUZZX1NPVVJDRSB3YXJuaW5ncyBpbmNyZWFzZWQg
dGhlIHNpemUKK29mIGFsbCBJUCBlbmRwb2ludCBvYmplY3RzLiBJbnN0ZWFkLCB0cnkgZml4aW5n
IHRoZSB3YXJuaW5nIGF0IHRoZSBwb2ludAord2hlcmUgaXQgb2NjdXJzLCBieSBsaW1pdGluZyB0
aGUgbGVuZ3RoIG1lbWNweS1lZCB3aGlsZSBwcm9jZXNzaW5nIHRoZQorYWRkcmluZm8gcmVzdWx0
cyBmcm9tIGdldGFkZHJpbmZvLgorYGBgCisKK1Vwc3RyZWFtOiBCYWNrcG9ydCBbaHR0cHM6Ly9n
aXRodWIuY29tL2Jvb3N0b3JnL2FzaW8vY29tbWl0L2IyNDc4YTliYTllZDc2ZDdjODU4NDE5ZTNm
Njc3Y2M0NTQ1OTFkNDVdCitTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0
dEBhbWFydWxhc29sdXRpb25zLmNvbT4KK1NpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIEtvaGxo
b2ZmIDxjaHJpc0Brb2hsaG9mZi5jb20+CistLS0KKyBib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29s
dmVyX3Jlc3VsdHMuaHBwIHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQorIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvYm9v
c3QvYXNpby9pcC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcCBiL2Jvb3N0L2FzaW8vaXAvYmFz
aWNfcmVzb2x2ZXJfcmVzdWx0cy5ocHAKK2luZGV4IDAxMjc0NzNlMi4uODdmYTNmYWRmIDEwMDY0
NAorLS0tIGEvYm9vc3QvYXNpby9pcC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcAorKysrIGIv
Ym9vc3QvYXNpby9pcC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcAorQEAgLTE0MSwxNCArMTQx
LDIwIEBAIHB1YmxpYzoKKyAgICAgICBpZiAoYWRkcmVzc19pbmZvLT5haV9mYW1pbHkgPT0gQk9P
U1RfQVNJT19PU19ERUYoQUZfSU5FVCkKKyAgICAgICAgICAgfHwgYWRkcmVzc19pbmZvLT5haV9m
YW1pbHkgPT0gQk9PU1RfQVNJT19PU19ERUYoQUZfSU5FVDYpKQorICAgICAgIHsKKy0gICAgICAg
IHVzaW5nIG5hbWVzcGFjZSBzdGQ7IC8vIEZvciBtZW1jcHkuCistICAgICAgICB0eXBlbmFtZSBJ
bnRlcm5ldFByb3RvY29sOjplbmRwb2ludCBlbmRwb2ludDsKKy0gICAgICAgIGVuZHBvaW50LnJl
c2l6ZShzdGF0aWNfY2FzdDxzdGQ6OnNpemVfdD4oYWRkcmVzc19pbmZvLT5haV9hZGRybGVuKSk7
CistICAgICAgICBtZW1jcHkoZW5kcG9pbnQuZGF0YSgpLCBhZGRyZXNzX2luZm8tPmFpX2FkZHIs
CistICAgICAgICAgICAgYWRkcmVzc19pbmZvLT5haV9hZGRybGVuKTsKKy0gICAgICAgIHJlc3Vs
dHMudmFsdWVzXy0+cHVzaF9iYWNrKAorLSAgICAgICAgICAgIGJhc2ljX3Jlc29sdmVyX2VudHJ5
PEludGVybmV0UHJvdG9jb2w+KGVuZHBvaW50LAorLSAgICAgICAgICAgICAgYWN0dWFsX2hvc3Rf
bmFtZSwgc2VydmljZV9uYW1lKSk7CisrICAgICAgICBjb25zdCBzdGQ6OnNpemVfdCBleHBlY3Rl
ZF9zaXplID0KKysgICAgICAgICAgYWRkcmVzc19pbmZvLT5haV9mYW1pbHkgPT0gQk9PU1RfQVNJ
T19PU19ERUYoQUZfSU5FVCkKKysgICAgICAgICAgICA/IHNpemVvZihib29zdDo6YXNpbzo6ZGV0
YWlsOjpzb2NrYWRkcl9pbjRfdHlwZSkKKysgICAgICAgICAgICA6IHNpemVvZihib29zdDo6YXNp
bzo6ZGV0YWlsOjpzb2NrYWRkcl9pbjZfdHlwZSk7CisrICAgICAgICBpZiAoYWRkcmVzc19pbmZv
LT5haV9hZGRybGVuID49IGV4cGVjdGVkX3NpemUpCisrICAgICAgICB7CisrICAgICAgICAgIHVz
aW5nIG5hbWVzcGFjZSBzdGQ7IC8vIEZvciBtZW1jcHkuCisrICAgICAgICAgIHR5cGVuYW1lIElu
dGVybmV0UHJvdG9jb2w6OmVuZHBvaW50IGVuZHBvaW50OworKyAgICAgICAgICBlbmRwb2ludC5y
ZXNpemUoZXhwZWN0ZWRfc2l6ZSk7CisrICAgICAgICAgIG1lbWNweShlbmRwb2ludC5kYXRhKCks
IGFkZHJlc3NfaW5mby0+YWlfYWRkciwgZXhwZWN0ZWRfc2l6ZSk7CisrICAgICAgICAgIHJlc3Vs
dHMudmFsdWVzXy0+cHVzaF9iYWNrKAorKyAgICAgICAgICAgICAgYmFzaWNfcmVzb2x2ZXJfZW50
cnk8SW50ZXJuZXRQcm90b2NvbD4oZW5kcG9pbnQsCisrICAgICAgICAgICAgICAgIGFjdHVhbF9o
b3N0X25hbWUsIHNlcnZpY2VfbmFtZSkpOworKyAgICAgICAgfQorICAgICAgIH0KKyAgICAgICBh
ZGRyZXNzX2luZm8gPSBhZGRyZXNzX2luZm8tPmFpX25leHQ7CisgICAgIH0KKy0tIAorMi41NS4w
CisKLS0gCjIuNTYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
