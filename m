Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA30606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o+E4LXU5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16E340620;
	Mon, 26 Oct 2026 09:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ms6HYzshYEq; Mon, 26 Oct 2026 09:48:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 191E2405EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793008116;
	b=A684KNiIbI9kJrU3QDyIjf1VRZJ9Gp/RNheifuTVlLnmkSUJRYTVKZ9/B50VWlKFZ1cS
	 pqJ/4UduDcp1BxNbLchpLtcR2z/dBKQNAXaDBR1scImodDzNRlo+ZhAXhP8cx/9DSTEx1
	 fcxO08WCSnCn1nStDphJyw1dhBpEhp40SQ52gjIbTNYVK2HRcpx9NWdLJ5gFGEtV01Xof
	 LU/H8yDtKf3wvWp4NFFmS+QUX/qY0xqoRXL9rqkBGcf6F6D1NEepOi/s3IZ8+EZ48XWI5
	 ivsCDxYa/e+pWCXCbCi6TlM6RI/EsMgDmbGF29nKr0ye0sKZzbFZvK3SFXzAinVBHkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793008116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3qrOohMUalqcr50DvmqbMWTQ1T6F6j9VpvYqOXEjX/0=;
	b=QWn/OZkOWwkpdGp/+2BI8Wv7I/B/nMpC2z+tLo5cpgBktnhlSWDY+z3WNAHisEvoRUh2
	 3CsjkeB6lxwcu/M3wPovTvpVNbLthTq1zyzigaxFbUnIcs+10eX0no+Vh+ZjdknfgG/0U
	 xWGmygeDM4SUGixhVdIvRarLPK/Nqtwg84BcJGEHeZEiOHbVzNz11hVdj6bZBpk+RaV+M
	 Jwepp4mXM6u3yj+jICTn+nE3P608DTd+twaO/MLq8yjvGH6b9f4iK2T5tJZ6FoRdp2O3A
	 Vk89oUeXMKvCe/Kya2Cv8B/6pt7sa7RXwpLxs+qphyNF7R2YHFKKhXjA25BPMBeF71A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793008116;
	bh=3qrOohMUalqcr50DvmqbMWTQ1T6F6j9VpvYqOXEjX/0=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o+E4LXU5ZVQM4WjPaCzNWVv+6y7J+lZJ2lv9+nBKaUCFVPbtng+zDMX4IsKtrgW/V
	 SIs0JHU913FLAy9vMtCwmcpADMxMPUe5WG7oZmsX5ctHmFoM+rEtVjKQY6ftXqyggx
	 YLYmE7drqMpy395FcHH5Vou5P4T+VwKX7KUVFREegneytZ++pKDiswW5qo4CBkgtm9
	 WA9ArHB7VnC1LJlY9nX0vPTt33cEXT8I9DllAkx+g37N1fajebw0FlfV5/NBi5uSMT
	 uu68QL5fiNOWuc8Xj9DOlrMMvf9PUAcfXbLs+ScJ8EQDmVeANq4Kc8H68TaMEy0xlM
	 V62CXdAmjJpYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 191E2405EE;
	Mon, 26 Oct 2026 09:48:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FFB6334
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 669464004D
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUOyxvNl93OC for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 09:48:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 075A340049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793008113;
 b=NlbJcPa6GF60wx1d+ba5I3ebbJcDDth6nCuWWnUXwcU24un/Hqg+7vYMOZsHP/4uUntP
 YiGGCYI+ZSeF+1NVwdUQpdTO/Y88MbQIyyH04gf2XMqb1ka0rIxbOO1D5ajQqd63k74NU
 M8yFlc3t5aHOM6ZPB1dCXURaS1sy+oLCg+CqqCPDW7Mpq3UTiZsnEQIyFtN4Ia+lla6be
 IkbHv9nckS1NVOyd0Gr6EbrQ93vMXHtmIe403Lw9RcvJYdy2rNmJJtohzCGYJ7VX7celG
 x1y5m8pj2uEiLrViIy2vAFhk4a3Lgn9xQVf5j7vMW9R3OCQdj72rbxXqav2Mh4tL2KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793008113;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
 X-Last-TLS-Session-Version;
 bh=sMhaKhdJUAgo3xdxQLzRoz7122ccNfr17YwmzVWVqeQ=;
 b=XSJ19EXZpGj6qPfK7Yhpr8cNB7nU0TYIfXsD4P3gbHGzP/Lhi8wTc+/Y6ohCDpeHEoCI
 Xlf556DxPYFPl+ZPCNL522894mw4/QoX+ON6uLhPW8ZPbYzkorHOkFZ0vagM+vFl047nQ
 ZfDQoVN/ZCK3p0K3iB0pqUuyXbOh0uuzUV7tOm7wJlVPRVnljD4DuIAVKtcGMP4GT1QjE
 bzfBkzaO0AFuYxxGO+azbtC5mabTJGYXHbrhL7QNg7nGdMVlCMq151h3sEtaISq5B19iv
 jN4ZMziiK+c6owyUq21MJH2QoK8EOGZT2EdnMra8uZZpn4LJFGtO6A0bxkP48gcMF8g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="cy/+KzcV"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 075A340049
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:48:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C60C14E41319
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:48:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 933A260740
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:48:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D82E910329042; Mon, 26 Oct 2026 10:48:27 +0100 (CET)
Date: Mon, 26 Oct 2026 10:48:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-bump_openscap-v1-1-073bc9dfba91@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubayyYpXkcQcHGXWjknJuxsuv
 ovfxfe/gNETMlTJBR4PYtpshEwTMHNnJxQ0RIPKlJZxog+razeHlk3nhDal1CWqQucZxI/zONL
 59ermN4d+QbO/EbjvB511Ue9xAAAA
X-Change-ID: 20261026-bump_openscap-6c9169e25630
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/openscap: bump to version 1.4.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q2hhbmdlbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3Bl
bnNjYXAvcmVsZWFzZXMvdGFnLzEuNC42CgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kg
PGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIHBhY2thZ2Uvb3BlbnNjYXAvb3BlbnNj
YXAuaGFzaCB8IDggKysrKy0tLS0KIHBhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAubWsgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAuaGFzaCBiL3BhY2thZ2Uvb3BlbnNj
YXAvb3BlbnNjYXAuaGFzaAppbmRleCA2MGIzNDI4N2YzYmIuLjc0Y2QxM2JhYzRiMyAxMDA2NDQK
LS0tIGEvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5oYXNoCisrKyBiL3BhY2thZ2Uvb3BlbnNj
YXAvb3BlbnNjYXAuaGFzaApAQCAtMSw2ICsxLDYgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vT3BlblNDQVAvb3BlbnNjYXAvcmVsZWFzZXMvdGFnLzEuNC41Ci1zaGEyNTYgIGY0ZmMwYTU0
YjUwNDQxYjNjNmJiMzUyN2MyOTIzNDVjZGIzYmVhMTZhOWQyMzQzNTI5MmJlYjUwOGViOTZlNDcg
IG9wZW5zY2FwLTEuNC41LnRhci5negotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NB
UC9vcGVuc2NhcC9yZWxlYXNlcy9kb3dubG9hZC8xLjQuNS9vcGVuc2NhcC0xLjQuNS50YXIuZ3ou
c2hhNTEyCi1zaGE1MTIgIGNiMzllNTNhNWNmZThlMGJmNjk0MThmMDRmZjIxNzVlMjU3OTY1NjYy
MGQ1OWFlODRiYWI0ZGU0ODJiY2IzNWE1ODU4MGQ1OThmODZkZmRmYzc2MTNiYjdjMWMzN2RkOTlh
YTljOWJiYjhmZjAxNWY0NzcyYWQ2MmZlY2Q2MjY3ICBvcGVuc2NhcC0xLjQuNS50YXIuZ3oKKyMg
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAvcmVsZWFzZXMvdGFnLzEu
NC42CitzaGEyNTYgIDdjNjA2NGVhNTJiYzAwMDJhMjFiYThkNDllMzNiYjI1ZjU1YzM4OGEwNmJh
NjBiM2M1YmEwMjc4M2I4YWNmOGUgIG9wZW5zY2FwLTEuNC42LnRhci5negorIyBGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9vcGVuc2NhcC9yZWxlYXNlcy9kb3dubG9hZC8xLjQuNi9v
cGVuc2NhcC0xLjQuNi50YXIuZ3ouc2hhNTEyCitzaGE1MTIgIDRmNDAwOGFiNjUwNWJjNGY0YTY4
ZDJjMTU2MTEwNjJmM2M0MTc2MmY1ZGQzN2EwMmZjZjFmMzdhNTQxNTc3NmMwZDUyYjRmMzJiMzI4
OWFkYjRiMjJkOGY4MmE4OTIxZmM1OTM2MmEzY2QxMzA5MDVmYjcwY2Q2OGRlYTk2MzI1ICBvcGVu
c2NhcC0xLjQuNi50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICA1ZGYwNzAwNzE5
ODk4OWM2MjJmNWQ0MWRlOGQ3MDNlN2JlZjNkMGU3OWQ2MmUyNDMzMmVlNzM5YTQ1MmFmNjJhICBD
T1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL29wZW5zY2FwLm1rIGIvcGFja2Fn
ZS9vcGVuc2NhcC9vcGVuc2NhcC5tawppbmRleCBmZWI3MDA0OGVkY2YuLmQ5MGU4Y2JkZDVhOSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5taworKysgYi9wYWNrYWdlL29w
ZW5zY2FwL29wZW5zY2FwLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotT1BFTlNDQVBfVkVSU0lPTiA9IDEuNC41CitPUEVOU0NBUF9WRVJTSU9OID0gMS40
LjYKIE9QRU5TQ0FQX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAv
cmVsZWFzZXMvZG93bmxvYWQvJChPUEVOU0NBUF9WRVJTSU9OKQogT1BFTlNDQVBfTElDRU5TRSA9
IExHUEwtMi4xKwogT1BFTlNDQVBfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKCi0tLQpiYXNlLWNv
bW1pdDogN2E4YjJkNjk5ZjQxOTRlYWIwNmIxZTI2ZjY3YjRjOTRhMzk0MjNmNQpjaGFuZ2UtaWQ6
IDIwMjYxMDI2LWJ1bXBfb3BlbnNjYXAtNmM5MTY5ZTI1NjMwCgpCZXN0IHJlZ2FyZHMsCi0tICAK
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
