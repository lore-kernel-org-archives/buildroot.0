Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F6606A31E
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q0T9CDqf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816A460A7C;
	Thu, 29 Oct 2026 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-3KX61RIveC; Thu, 29 Oct 2026 20:17:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C369760A70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305047;
	b=F2TFolFE2WwZNUAVhviqwAdOqkQAtQ4ZIeylRAaDnmAWWosoF0iWSzIkPWZatommJlmr
	 x/FgFRr8c45zk0f8Vvgv69ZF90rUtJ7vRzPfpayJPpY7i2D0ezX8WpeBUKQcYIBP8VGmp
	 fXog/SWJNUpBTNCvMfTidqVaXsaUaIGNm5lTrnhsRyN0FHre58SKHDZbsJ/Q6+fccrRvb
	 OoBuWUvJh8jVhLUP6IUFUEO8t+Y+HKeksZ45W5hekxCPivb/6lHDe/PMLSQIc8xdFR/Gj
	 mSwESw8PlLhkMp3POel4g/JEqPlaCmwfRwElUYrKXJBpA0i80rkK4p1mr3qKexff4Jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xp9XMrx6dbN2WXeCWbeg6dZL84B/y+ZtEJLjLeDrk8E=;
	b=TtInbgXVSCDJWTV+6tp0k6GnSz4CgNIK9FCUhS1hRu9oxvhzsW9N1CVNjTHlq/YZyZQF
	 /7k68TjPR9iqgcIqn34XbVZdU+6maUchxgJMomu8ubYjpRSdZvBrtMoEbyzGaThOxfTjd
	 Zz21Q2xtoO/fYa/dTtPXztqyqBKXG+2O7wfylA6iIbvuEiYwflTr2pEBpn+/t44P7uOhn
	 t6QNSrhEKRJ7XuFW4yeH26otTncFMkrjUbOBPart1PW5ydupG27wK/TqW6R58VA1O4W5H
	 jvkiVCW33Fyj0d0XVr0XTI0+NFqolW2pSBkZOcpTOqBt9LSDYQfQjUr/7Y3waGCcgMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305047;
	bh=Xp9XMrx6dbN2WXeCWbeg6dZL84B/y+ZtEJLjLeDrk8E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=q0T9CDqfqKpNd6Y4wNmTAnZKsGfeEmWaOP8Ifgq0LAOi0cxTFBPFdVZg0cqLpufdh
	 HYhARg01oQUJRatNstJXCmb2AMtbQ1J8ki/2psjlCCpzfzQYot4U/x0q9kwJtAFZ6f
	 dwzkg7OuWG//aedN51L0/AasQOzIFKNtuvCYPMA3cKeg2Y3JTZZqtSmBSy+8rQIE+R
	 xFtRoG8qzjFaPNeb46sKmAJMv2dUXnkhvReGOaNE72reFk3c2Epl7PvSd5rP63a3YZ
	 MiMaJFaKI5hXABXY9WjcD/GIzuWjklOzajM6CLtRFr2V5MFD3oQOq7mgt2ttKXazwj
	 N33kBpUvJGVpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C369760A70;
	Thu, 29 Oct 2026 20:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6170120
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE4581021
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM3lFyUmJFtY for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:17:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D04C08100D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305044;
 b=ee+FcE5Y13UTaizuFCvdfCwlDxurMY5iviUmk/e8yzOwXnnAQ1koHTh2XoMAfj8w5S/3
 g5lblMdzo67Gr42tC1gJTkyG/wdpyBOKZ8lTATS4oOKWQwdM8pL4ajenv9QP5DClwQpzf
 rKchgTEcM9rNGCFLo/pPVr5OD/pG7qL9ddiK6ELLFFfBH6g8xuySS3jtjWR78Df/i3lTw
 KD5t2CylXl4Wng1rSt1HfXaEyCMCpXij2G3J09WCZQZDfmp3/yRzH1sFo1Nz4Kxi54QX0
 OJWkeCzDiyhqeSgLMGVz//hgiCrJRScewGXSB2wtFyA17HhyUXEeytXSFApz9dZymMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305044;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=MJnVd/fN2bCQ/EzxqC93qP0WkjAx8jL1qfNL0NrXR9c=;
 b=Bl+uJMJXJCiGW10Px5wrJYhOuJ1wpLKAK8zU8heAEPVq72pfwE3BMf7PpTkzhGnCiaoT
 kT2DqfGhz0IOIbF/o/BCCKGOj7naDaA1I+Qfc+pwdhejf3uxAqWMOGlUeCWy8xr5VRbeC
 6FT6tmqdWsEGvHRm4Ot0R/Bl+1xyr2NA4fErXUpW0xlGGqWP1z4ugWz68xL5lm6xBbcIq
 A5MNr6taLEEU1GS4hjIPl2rfLcSdNGZUIkSCxMnyOz0pXTd0C+J/rdvLJ51oToHcMLB+D
 lJuGGSkXOl2VUvmt9bbAUIAE90BKZyhZzBaPf9O5OsvJtPa+k0LVTVISfbTpgWjICAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=djN2+3CD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D04C08100D
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:17:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso13724f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 13:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793305040; x=1793909840;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MJnVd/fN2bCQ/EzxqC93qP0WkjAx8jL1qfNL0NrXR9c=;
 b=HC1OJkNUXHTKn4JatQ8ip8bBAOYcTYAKiVrz5g0hHct2nSIKT9xtLv5aqZc5cdGmbj
 sHhpiYPVZ81CBWCUUpCbexU81XUJpk+mOL7PUk1qgfEn6kVGKPBDkeSau9fcB/7aXLUV
 Ro7cGrPbFvyI4gRo6xmUIXHTC8Q2PqmsXmXf7p+SgFXnwS+eAbnuk/qkxZZd6cK398H6
 d2UGlpC4UJzYguAvEUO7EEJUVXzct+XgWZMN0LSYM2GMdwAbJZWxYCIKSOBsZlcILL6M
 8EmOR8Wmm+lFqjLJzVvbe6da/5zCGOAdAvbrXygoLLgbmKwF4sju8F0plV+vTlyo0RTO
 jm5Q==
X-Gm-Message-State: AFq9FYJWyVEtdBcpxkrtTICQZjhjkAmFHWxa/WyuHrNH7xDu/2F96t84
 ZhvMqbC0rm+K5J77MGKFymgteNjYvRy1k39BL8n6g28o9ARQUNfLbv/mhyyx0nI/Q48gbx3vAa5
 uAWu9pJSjbQ==
X-Gm-Gg: AYBFou3Nvz8Xu8v0xJlwgwb1Bw+q4reom1glx4LmlMxZqKYjB7LiayJV5SoThTd45UF
 cDyqBKiRdFJGVOmyliyDX7ThSL0F1amSwe5TWg3cLS8eLR9qGnobQsqR47IxFWM3M3PAPg/jJmz
 W6n1cW4X4mqNZfRJ9/Q/sNWeH6CM1oMB2ZzZSmoeCTcbaqk0BhAT7EqzsRiu7pgCMTTazQRyIL0
 27zVYDW1oPLm/pXj2pHNLOKq/ozlNdJOniAVWkTpmdqO1jQ4BuNNeFqXUFwbuSw6DZcsm+gzNd9
 bYaETkzVvAo4HyMlpzJjgk/dBhpS08YoJrjtzAGEVbkBp28v7GoVKrGmRy5Mvu7Eip3v7rFgVae
 vBaMzq6fd4oh+KTTPWqGlMw5zUyyK8ks+werLhp5wClSqkhS9cY9WvUGNOT6VfI23e2zlxaTnUl
 Zcyfmti8TS5h3QE3yKAuH0RqB58tKNrRZghZo3/R8xZ5XmQpdFLs01puLgm2X10+IyGQcMMa39t
 7QkVQ92GPtMMGX92LM1QRs/J2iHqjDZchvh8aMdUMD3KusgRvFmxxRXuR1U3eMlMiRTZNuj8gSZ
 CvftBVS/nwRAuFOzhp8oRbkX6bIvb9kajWS9C66dsd2h2g==
X-Received: by 2002:a05:6000:1a8e:b0:48e:4395:2dc with SMTP id
 ffacd0b85a97d-48e6e30b9a3mr988213f8f.22.1793305040638; 
 Thu, 29 Oct 2026 13:17:20 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6eb8d50csm444146f8f.41.2026.10.29.13.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 13:17:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 21:16:49 +0100
Message-ID: <20261029201652.1748886-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions: only
 move existing headers directories
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
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
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2luY2UgY29tbWl0IGJkNjMzZmU1YjQ3ODU0MzVkNzgyMjI1MWQwMjI4OTA4MmEwZDFiNWUKKCJ1
dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnM6IHVwZGF0ZSBmb3Igc3BsaXQgaGFzaCBm
aWxlIiksIHRoZQpzY3JpcHQgdW5jb25kaXRpb25hbGx5IHJlbmFtZXMgcGFja2FnZS9saW51eC1o
ZWFkZXJzLzxvbGRfdmVyc2lvbj4gdG8KcGFja2FnZS9saW51eC1oZWFkZXJzLzxuZXdfdmVyc2lv
bj4gd2hlbiBpdCBidW1wcyBhIGtlcm5lbCB2ZXJzaW9uLgoKVGhlc2UgdmVyc2lvbi1udW1iZXJl
ZCBkaXJlY3RvcmllcyBvbmx5IGV4aXN0IHNpbmNlIHRoZSBoYXNoIGZpbGVzIHdlcmUKc3BsaXQg
aW4gY29tbWl0IDBlM2RkYzlkYzg1ZTI5Y2QwMDMzOGNjNzllYTRiZTFkNjM0YTc1YmEuIE9uIGJy
YW5jaGVzCndpdGhvdXQgdGhpcyBzcGxpdCwgc3VjaCBhcyAyMDI1LjAyLngsIHRoZSBoYXNoZXMg
YXJlIGluIGEgc2luZ2xlCmxpbnV4L2xpbnV4Lmhhc2ggZmlsZSBhbmQgdGhlIGRpcmVjdG9yeSBk
b2VzIG5vdCBleGlzdCwgc28gJ2dpdCBtdicKZmFpbHM6CgogIGZhdGFsOiBiYWQgc291cmNlLCBz
b3VyY2U9cGFja2FnZS9saW51eC1oZWFkZXJzLzYuMTIuMTEyLCBkZXN0aW5hdGlvbj1wYWNrYWdl
L2xpbnV4LWhlYWRlcnMvNi4xMi4xMTQKCkFzIHRoZSBzY3JpcHQgcnVucyB3aXRoICdzZXQgLWUn
LCBpdCB0aGVuIHN0b3BzIGhhbGZ3YXksIGxlYXZpbmcgdGhlCkNvbmZpZy5pbiBmaWxlcyB1cGRh
dGVkIGJ1dCB0aGUgaGFzaCBmaWxlIHVuY2hhbmdlZC4KCk9ubHkgcmVuYW1lIHRoZSBkaXJlY3Rv
cnkgd2hlbiBpdCBleGlzdHMsIGFzIGlzIGFscmVhZHkgZG9uZSBmb3IgdGhlCmxpbnV4LzxvbGRf
dmVyc2lvbj4gZGlyZWN0b3J5LgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJh
cGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHV0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJz
aW9ucyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3V0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucyBiL3V0
aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucwppbmRleCBiMDJiODU0ZDk1Li44YjkzZmZl
OWVjIDEwMDc1NQotLS0gYS91dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMKKysrIGIv
dXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zCkBAIC03OSw3ICs3OSw5IEBAIHVwZGF0
ZV9saW51eF9oYXNoKCkgewogICAgICAgICAgICAgICAgIGVjaG8gIj4+PiBVcGRhdGluZyB2ZXJz
aW9uIGZyb20gJHtvbGRfdmVyc2lvbn0gdG8gJHtuZXdfdmVyc2lvbn0gaW4gQ29uZmlnLmluIGZp
bGVzIgogICAgICAgICAgICAgICAgIHNlZCAtRWkgInMvXHRkZWZhdWx0IFwiJHtvbGRfdmVyc2lv
bn1cIihbXHQgXSspaWYgL1x0ZGVmYXVsdCBcIiR7bmV3X3ZlcnNpb259XCJcMWlmIC8iIFwKICAg
ICAgICAgICAgICAgICAgICAgcGFja2FnZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0IGxp
bnV4L0NvbmZpZy5pbgotICAgICAgICAgICAgICAgIGdpdCBtdiBwYWNrYWdlL2xpbnV4LWhlYWRl
cnMvIiR7b2xkX3ZlcnNpb259IiBwYWNrYWdlL2xpbnV4LWhlYWRlcnMvIiR7bmV3X3ZlcnNpb259
IgorICAgICAgICAgICAgICAgIGlmIFsgLWQgcGFja2FnZS9saW51eC1oZWFkZXJzLyIke29sZF92
ZXJzaW9ufSIgXTsgdGhlbgorICAgICAgICAgICAgICAgICAgICBnaXQgbXYgcGFja2FnZS9saW51
eC1oZWFkZXJzLyIke29sZF92ZXJzaW9ufSIgcGFja2FnZS9saW51eC1oZWFkZXJzLyIke25ld192
ZXJzaW9ufSIKKyAgICAgICAgICAgICAgICBmaQogICAgICAgICAgICAgICAgIGlmIFsgLWQgbGlu
dXgvIiR7b2xkX3ZlcnNpb259IiBdOyB0aGVuCiAgICAgICAgICAgICAgICAgICAgIGdpdCBtdiBs
aW51eC8iJHtvbGRfdmVyc2lvbn0iIGxpbnV4LyIke25ld192ZXJzaW9ufSIKICAgICAgICAgICAg
ICAgICBmaQotLSAKMi41NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
