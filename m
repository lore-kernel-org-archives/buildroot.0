Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3099CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD3060BBC;
	Fri,  2 Oct 2026 10:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iraYADBnZ_DJ; Fri,  2 Oct 2026 10:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D84D60880
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937204;
	b=ZCQhRgJc2QwmR39TOzfRngKA+aDlGOBkSmzKqqd6exysv7lVUdz8b3OX6+QoRp6Oi5kt
	 3u1vh+2JIqwNMz0cNoe2FYog1fVDNS4pFDY5eioTRAVUpDOa2nNwiwSqvqJhWpWxhSGiE
	 BhodoX28NWkKhS8RSUVmRcbMHVfPksxox91BiiIABVbNisSF/WQe1lFJN9BMQhRDob8f4
	 kiFYWYujWSXZFRk5JNDlKeNHOWTNh1Iu0fAlRlUfZikBFp/bSo4Jsilo6laS4xO3x3qiU
	 ucLRL2TbFY/7Gqp9QQRr2sDHfN2mmeeFnE3DkFLRLkZ6HHy9E3fOvp8w/eF2Jt9Iisg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QnvGKRC58czJeHErzhCgswjqrMFcalydwFVs/zI4bP8=;
	b=EnJJWyD+DjLUFteU8IP5Ds3dqMooIwRN7oy9PTw3kFMj647q5aoYGAP6gm2QQ0nnrpsO
	 oQC8FM+2DTUfM520Opa1ni4sd3RUrNay4MdRFgY55w7rlShipk9z6yHhUOYNKvXEuslek
	 FKzC0TvLtRgDJDwFVBJ+d4ewXvaLy7myS1kwnz7sJlW3DFFaW50fP7ilMxzanN97+Hun9
	 hXwreShdasmJXYOLXwHEbI0WvhYWnUnoKkMeteniX4CCTpoIwDYsUaCt+0Vj4VUMsygTW
	 w4f9khI0cOuEUH5MgpqEaKOtnCxaaTZNbRGOSarIqSisiSBBuLj23VoOVWP1WztbplA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937204;
	bh=QnvGKRC58czJeHErzhCgswjqrMFcalydwFVs/zI4bP8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lvFG+HQfHPWEXsN8imOTQFzRzyGIuYnv4pPVs+EjJ6XQtuqmdKhWeunJxG0M5ra9X
	 PECkKZw8f+sfm+2mTTCL3enyv1jEdgfi9o1QZMTX925ySOcTSxC2sqQJ73P5uxH5aW
	 SFf8u7ZIEMdt4k5qrZCMnquivniIpW1WeVfUfaS1IEo/SIn1+Q2YjGmffcUiZyxke/
	 9LXCearbJzGppB++xMLqMQjh4SQRuMAXFsyxXWzgrS4coXVOdH0yvlthauX4FraR1v
	 vNuTOEVnjWuOOzUpcdSSx41gG4r//400mGXigo/8Td60pBT4U3wa94teg06QGsgGKG
	 ySf9IoR4/QVsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D84D60880;
	Fri,  2 Oct 2026 10:33:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D95E034D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF81B40BB3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWyu_I8XwFW6 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 90C8B40B53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937203;
 b=q483KBdsE3M6YL1Md/7mDPeE1eavHXaLBvcBEOQwC9gNHya2IPHHe1yfMSIXkfOBabin
 VgvlhIqI4/4SPFPZkWNTKbW8hJA+d6kRcIxm1eDArLyl/+wc7lX7h3/KzafiKnt+xpNXA
 hrysYP/4vFjxwkGjfoDr51L6jAbDJigg++W6m9ctICKdb0bFlNIZX9aeoA++Fwq2P/LYl
 eOpmVT2eseVzJAIXveX7ihV5qN+/OiFK1q20ltt4wprd/oUI0I4F440+7/nlGhcph3QTj
 0RZMSgEm5XZZbcQzdCTJ1H4AdOPo4nWXPyTZDOCVFQ5RWYawnzEpmnnfKvEf2R21FAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937203;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=iaCXkNrypGEDrgGTg64XgiOCLHeYlBlJmDRvCmEm/1M=;
 b=i1iH0uJgBd6WyBhEEB7fa4zhdFUBqwvNpVbTyjhf8NO2JMvRcZHB1uq1kpR7Z9w0eV1R
 iByLNz2IEorQJWVLVUL6hOdlWqhGtcaZHw/rEWWlnUOEiYfaGxHJWuXq7C2tt3+ZpQuHI
 uE8B6nvLMvXYKPU+O/NmT4LNpSo1pWengvVCmT177MUlmZxiaJvmq6PMOxAs2NFFYXeSz
 z+Kle/aukBNgFxzuNS/ngp35WHd0FJKmpPrTqNavk20mkjZgJ7hxNcI5b1uR2M0gwChOd
 Y9q0zNkhRmvECWYFQrJfXf1V8y5oM7PAEane4NJXqK2vDTkUXZlBv3XpvJKqev8gHYA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AeMkDYxF; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90C8B40B53
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:22 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48b0f4efe31so939968f8f.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937200; x=1791542000;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iaCXkNrypGEDrgGTg64XgiOCLHeYlBlJmDRvCmEm/1M=;
 b=gO+CzIGu4MR3mfneau8mo7p37FZRDmyLG4v+Ok/UfcssuH1anGHlf3KmDNKr1biX9h
 Iu+Td3sR0kw+2buCToePNyw5UHIKiKDPMKcqm997lo2pW/gMhoHuEuERfw3M5elQJB5X
 zzE0fmk5oGCv+hG+TDLjrtATtfGFEw2QN4MYtfaF61stpBqudpFf8m/7I9BfbDluvXrc
 8gqMxN5t5DusbQsUQmyrCoTgHXZGNOzSpFFiR/ZyNbEbf1fkzYkffFITf7R37D/oRxjX
 o1SKnnWVoNdBNfbUdsf0nnTy/3l+gJKWTzykw9+NspjLAmAu/6UiGScLCSB/iTCMwkpL
 WQaw==
X-Gm-Message-State: AFq9FYIbWRj/ru39/BPY+UbpjE/tw8aEOiPHb/iVvDS9nc4Lw0m2mDzB
 0SuAG65bD/sCkbHBdtUvAYlBvYgVyZ9csk+LdLVON6gOx3M9uZ5Qxx1QrL+N9Q2yBoNmhgtww3r
 PwfGysgA=
X-Gm-Gg: AYBFou0wwtxIf5/UWpxrv80fjAy3NVFQ/aHRHKkQ1isna3pv5Sg5M2L6mi6/uAJGx4v
 DWvsZT3RpQS+J0Hp2+tUfsHoqnFWAuFVXd61oEbR1gbTeohGcU1mmQ3wVT2c2I4tVB+ba0IrjlA
 0RmxOvDiRw727dDbtUXQ3sr+tMrlmglLA3GhmHu/csH6B+JgKsfZkl6PhTDMjz4XCg4+j7hZ5qu
 HkD8q+oi7IVxbmGgAwp+XNh9iPmhVlkVQUvAnVw7sAWL06jfL5UYZnsQ7G8cb8sPKfZTM7se2xU
 jRQksujMB1QsuS8Yo+26chQ7SKvb96O76OFn4h4l0LeGU0CTGmMph/CGTv9bZgM0D3VeXC+eNgT
 Slxs61nCNp0Mwr4xAB3yw5buGWZXCV7B+cGN1v9Xaq94I4mKzDoyszq/KVawfMBSHalKScYHfJ/
 1nz47hRYOQi8q7tl1XXX2amU51SA+625T2xscduqbz9HRDUkrdMT9KhnVMFQLDlSyOHti8HvKq1
 gb7CjgpI+GQEp89QFdiDkceXXm+Ca2t64dN4bkY2WKn+zAekgHy
X-Received: by 2002:a05:6000:4b0c:b0:485:8c16:a34b with SMTP id
 ffacd0b85a97d-48b1271dc35mr4595775f8f.35.1790937200192; 
 Fri, 02 Oct 2026 03:33:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b382f8ab4sm4595158f8f.35.2026.10.02.03.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:33:19 -0700 (PDT)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:17 +0200
Message-ID: <20261002103319.77352-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927085308.2871714-1-giulio.benetti@benettiengineering.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6Cj4gCj4g
LSB3bnBhLXNlYy0yMDI2LTkzIMK3IFNDVFAgcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgo+ICAg
aHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTkzCj4gICBD
VkUtMjAyNi05NTM4OS4KPiAKPiAtIHducGEtc2VjLTIwMjYtOTYgwrcgSUVFRSBDMzcuMTE4IFN5
bmNocm9waGFzb3IgcHJvdG9jb2wgZGlzc2VjdG9yCj4gICBtZW1vcnkgbGVhay4KPiAgIGh0dHBz
Oi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi05Ngo+ICAgQ1ZFLTIw
MjYtOTUzOTUuCj4gCj4gLSB3bnBhLXNlYy0yMDI2LTk3IMK3IFNQRFkgcHJvdG9jb2wgZGlzc2Vj
dG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNl
Yy0yMDI2LTk3Cj4gICBDVkUtMjAyNi05NTM4Ny4KPiAKPiAtIHducGEtc2VjLTIwMjYtOTggwrcg
TWljcm9zb2Z0IE5ldHdvcmsgTW9uaXRvciBmaWxlIHBhcnNlciBsYXJnZSBsb29wLgo+ICAgaHR0
cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTk4Cj4gICBDVkUt
MjAyNi05NTM5NC4KPiAKPiAtIHducGEtc2VjLTIwMjYtOTkgwrcgQ1NOLjEgcHJvdG9jb2wgZGlz
c2VjdG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBh
LXNlYy0yMDI2LTk5Cj4gICBDVkUtMjAyNi05NTM5My4KPiAKPiAtIHducGEtc2VjLTIwMjYtMTAw
IMK3IE1CSU0gcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLiB3c2J1Z2xpbms6MjE1NDksCj4gICBo
dHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjYtMTAwCj4gICBD
VkUtMjAyNi05NTM5Mi4KPiAKPiAtIHducGEtc2VjLTIwMjYtMTAxIMK3IFNoYXJrZCB1dGlsaXR5
IGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0y
MDI2LTEwMQo+ICAgQ1ZFLTIwMjYtOTUzODguCj4gCj4gLSB3bnBhLXNlYy0yMDI2LTEwMiDCtyBG
cmFtZSBwcm90b2NvbCBtZXRhZGlzc2VjdG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNo
YXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTEwMgo+ICAgQ1ZFLTIwMjYtOTY0MjIuCj4g
Cj4gLSB3bnBhLXNlYy0yMDI2LTEwMyDCtyBVU0IgSElEIHByb3RvY29sIGRpc3NlY3RvciBpbmZp
bml0ZSBsb29wIGFuZAo+ICAgbWVtb3J5IGxlYWsuCj4gICBodHRwczovL3d3dy53aXJlc2hhcmsu
b3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjYtMTAzCj4gICBDVkUtMjAyNi05NjQyMS4KPiAKPiAt
IHducGEtc2VjLTIwMjYtMTA0IMK3IFJGNENFIHByb3RvY29sIGRpc3NlY3RvciBjcmFzaC4KPiAg
IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDQKPiAg
IENWRS0yMDI2LTk2NDE3Lgo+IAo+IC0gd25wYS1zZWMtMjAyNi0xMDUgwrcgVG9zaGliYSBmaWxl
IHBhcnNlciBjcmFzaC4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25w
YS1zZWMtMjAyNi0xMDUKPiAgIENWRS0yMDI2LXh4eC4KPiAKPiAtIHducGEtc2VjLTIwMjYtMTA2
IMK3IFByb2ZpbGUgaW1wb3J0IGNyYXNoIGFuZCBwb3NzaWJsZSBjb2RlIGV4ZWN1dGlvbi4KPiAg
IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDYKPiAg
IENWRS0yMDI2LTk2NDE5Lgo+IAo+IC0gd25wYS1zZWMtMjAyNi0xMDcgwrcgVElGRiBwcm90b2Nv
bCBkaXNzZWN0b3IgaW5maW5pdGUgbG9vcC4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcv
c2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDcKPiAgIENWRS0yMDI2LTk2NDE4Lgo+IAo+IC0gd25w
YS1zZWMtMjAyNi0xMDggwrcgWDExIHByb3RvY29sIGRpc3NlY3RvciBjcmFzaC4KPiAgIGh0dHBz
Oi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDgKPiAgIENWRS0y
MDI2LTk2NDIzLgo+IAo+IC0gd25wYS1zZWMtMjAyNi0xMDkgwrcgSUVFRSA4MDIuMTEgcHJvdG9j
b2wgZGlzc2VjdG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0
eS93bnBhLXNlYy0yMDI2LTEwOQo+ICAgQ1ZFLTIwMjYtOTY0MTYuCj4gCj4gLSB3bnBhLXNlYy0y
MDI2LTExMCDCtyBDYXRhcHVsdCBEQ1QyMDAwIHByb3RvY29sIGRpc3NlY3RvciBjcmFzaC4KPiAg
IGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMTAKPiAg
IENWRS0yMDI2LTk2NDE1Lgo+IAo+IEZvciBtb3JlIGluZm9ybWF0aW9uIG9uIHRoZSB2ZXJzaW9u
IGJ1bXAsIHNlZToKPiAgIC0gaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9kb2NzL3JlbG5vdGVz
L3dpcmVzaGFyay00LjQuMTkuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRp
IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKQXBwbGllZCB0byAyMDI1
LjAyLngsIDIwMjYuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3dpcmVzaGFyay93aXJl
c2hhcmsuaGFzaCB8IDYgKysrLS0tCj4gIHBhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5tayAg
IHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLmhhc2ggYi9w
YWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsuaGFzaAo+IGluZGV4IDNkOGZkYjYxMzEuLmIxN2Y0
YmNmMTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLmhhc2gKPiAr
KysgYi9wYWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsuaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+
IC0jIEZyb20gaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9kb3dubG9hZC9zcmMvYWxsLXZlcnNp
b25zL1NJR05BVFVSRVMtNC40LjE4LnR4dAo+IC1zaGExICA0ODJmZWNiZTIxYTg3NmY1M2EyNmJm
NWJlYWE1YjBlZTBhZDE2ZTUwICB3aXJlc2hhcmstNC40LjE4LnRhci54ego+IC1zaGEyNTYgIGY3
N2E3OTM5OTgzNzU4MzgzNzk3ZmVkMGEzNGE0OTFmNzg1ZTU0MWNjYTM5N2E3YTQ0ZTljZGQ3YzZm
ODQ3YzYgIHdpcmVzaGFyay00LjQuMTgudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL3d3dy53aXJl
c2hhcmsub3JnL2Rvd25sb2FkL3NyYy9hbGwtdmVyc2lvbnMvU0lHTkFUVVJFUy00LjQuMTkudHh0
Cj4gK3NoYTEgIDQ2YzI4MDU0MDcxOTcwNDhkOTBkYzdlYWM5ZjBhNGExOWQxMzgxNWEgIHdpcmVz
aGFyay00LjQuMTkudGFyLnh6Cj4gK3NoYTI1NiAgMDQ5OWRkZGMwYWVlYTUwMGJjNjUxOTY3MTRl
MWUwMTA5Nzc0MmVmYmM0NzlhMmQ2N2E5YThiNWRkNTdkNmQwNCAgd2lyZXNoYXJrLTQuNC4xOS50
YXIueHoKPiAgCj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgZWRhZWY2MzJjYmI2
NDNlNGU3YTIyMTcxN2E2YzQ0MWE0YzFhN2M5MThlNmU0ZDU2ZGViYzNkODczOWIyMzNmNiAgQ09Q
WUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsubWsgYi9wYWNr
YWdlL3dpcmVzaGFyay93aXJlc2hhcmsubWsKPiBpbmRleCBjNTAwYTQ5MzM2Li5hNjdiOTE1YjVi
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5tawo+ICsrKyBiL3Bh
Y2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1XSVJFU0hBUktfVkVSU0lPTiA9IDQuNC4xOAo+
ICtXSVJFU0hBUktfVkVSU0lPTiA9IDQuNC4xOQo+ICBXSVJFU0hBUktfU09VUkNFID0gd2lyZXNo
YXJrLSQoV0lSRVNIQVJLX1ZFUlNJT04pLnRhci54ego+ICBXSVJFU0hBUktfU0lURSA9IGh0dHBz
Oi8vd3d3LndpcmVzaGFyay5vcmcvZG93bmxvYWQvc3JjL2FsbC12ZXJzaW9ucwo+ICBXSVJFU0hB
UktfTElDRU5TRSA9IHdpcmVzaGFyayBsaWNlbnNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
