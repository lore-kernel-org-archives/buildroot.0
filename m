Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415DB606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gtgas6IM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18704812D9;
	Fri, 23 Oct 2026 12:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fAppu8zj0Sn; Fri, 23 Oct 2026 12:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0E5DA814C2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758284;
	b=UPIvwnLc8xqIkbfXeXDiOftYOiQLBpxRa38IJXYhjbOqKRhbEzaRF1qVJJz1LajIMlG7
	 tTQL4NzQa0z938GA1muJF64CLyn0zG9xpHr1Gb4hwcJHjclCoUgSXSo5EXhXtXGrhCG4H
	 q6aZ2D1NBZ0ewpPt5Pf2aRvBrX98BIzkgnPvlITLAO9VM68tXGCuDsWfQQrcRoayo8z6F
	 FGsF16oezAcO/ndH6/KSmMEAqmUvn4dGsS0gFxKCVMip7de3Vvi7LDPpfArOKbCgH7haE
	 busMm8zee8eBtDX/qWfw65VVKtjf3xhR3sU4k5+yMq23mrMWj+ELlCWUTnbMCeQhuSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=i/x5AeLg4M/P03TG7zuwm+iauNbgT0cghIp1XrWaoKU=;
	b=dtIETW81k4y1xecP2VR2ImizpDD8uAk2TcuZTT9otOrpwLfjs+VZ2J1bIm5NQnvj/Yvv
	 0fWeRhAIrw8lKpkPmHcgq9GQz3yMwEyVHQUIH/XBg5zkcSZrE4JVPTOcbfw1MYnhudzfV
	 r8+sSpaZQ2xatO5YiW8/c6I5BcDZjjTuy4i4ERilO3HJIH9JJbJsZPNFHg7ZHCc636tzl
	 Ndn5Hs3m5llRvNseXjCeRDl285QLoydKp0yfZjrCtTGUyvWjhFBC3nO94YWonFICwozAn
	 t0xGKggdluO8aRq5ibe6LXN1xpo4tJ2p2nY75ID312wlVNXqlcB24S7/8H/+QXRsWnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758284;
	bh=i/x5AeLg4M/P03TG7zuwm+iauNbgT0cghIp1XrWaoKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gtgas6IMbjvXR0A7mCC6YjkgMigrx2MqiRdMsbgtpt6Tr9KXqbS2OFlVbY267ygK5
	 pRkBRhoYoWv6k2QowqKKabqMiruPTZeJgSo1GnJRGfB7Gs/+pP9Whg2fNqhuc6PkuS
	 NKjUFgiuBkJnUoduYhUhlsO1fGjvbW+hdFniykz8USCk2NmlenHKlI6ckTDekE22hL
	 fiF57F1fiqSvYrlQfkSd1tKj74kTD48h24UZ0NUFpemE+KPSdryjh/K0OyaAfhXV6a
	 iZ9cEgB40Zw0GKy4qbi4e06A5ksn5pSvF76MN6Y6i6NBVPWpt7K5JaVZZYYEAVNtW1
	 lQ/M9XtftlxcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5DA814C2;
	Fri, 23 Oct 2026 12:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA07A23A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFDD6400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOtOG2-GvnYI for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3175C40119
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758270;
 b=QuHb+DxrswhlDdD/bCaegt0ptmMFV/QWODZtpkTj8xbnI/HnoZe45egz1/pptCW4R80m
 PyuIvWsqCjjk0Lq7msCTyg6BWY26WzaHdLe4/Ud6qc8bXhkxi89E2EwwR9LLh9ZXtsJ51
 kH0H7Fdsz+95deDjnrfC82ypx2T725w/e8oF/NyjUbHv2+mfkgdT4h+Ugd6Do6gJAyJld
 wQ6gUgQKjAk+yq/fs1lXFtvbu51VDcUNy8X8cV3imP5x4TxkfRxtntMQ6Arytd905DdK5
 fsiZFNUZ+5XcNaOfYBNke7JxIeV+Uoyy/12NzBpglkCQi7fj0xQRGNSbzY5Fa0j2cRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758270;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=T3tbA8OKpNV1+5EQGqTSNtlL3j2cpl981Y8tSyqtIOc=;
 b=OFYg2E+ojM9guJsqWbj0UJ1YTJ5hi7z1FyCPUohSU+m+hcVkL4wcHqHUQs211E9FaCWz
 U9k6hBV89W8t+cJx/Hn8RL5wx/hpjgiJZav63Xrt4bNaGeSCmVznFpmtnuqJDjVGqK/c5
 QjalXSYTaK+trHFMTNyUQ9ciY71EQmDY73RSGoX5plP1z/9Sw44u1k3+fBjx2tYd37pm2
 cDtayrS2UBo/BPJMAAJ268J24lgBvYNyndRG31Y2+jo35pgcXBt/fn3TkDFI72yixyyS6
 ur6mcGf0fqbYBc1MRYCiGTC0/Yg+8DnrspXkq0YuoKyrk+rs9LX/AsLcGilBx9PRUgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3175C40119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC8FE9C669; Fri, 23 Oct 2026 12:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 74432125e4abf2250b29ff0d817dd613f2329691
X-Git-Newrev: 6fd4d25da2f48ead295fe8a5e3658fba7f558d4d
X-Patchwork-Hint: ignore
Message-Id: <20261023122305.AC8FE9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/librecomputer/lafrite/readme.txt: document UART pinout
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4263526512305436902=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4263526512305436902==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fd4d25da2f48ead295fe8a5e3658fba7f558d4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The lafrite board exposes the console UART on the GPIO header.  Document the
pinout for ease of use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit d6243220d771684129a8db85add129fee4a61712)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 board/librecomputer/lafrite/readme.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index c439c5e91d..86afa855e6 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -32,3 +32,10 @@ How to boot
 
 Insert flash drive to the USB connector furthest away from the IR
 receiver and power up board. The system will boot automatically.
+
+A serial console is available on the GPIO header with the following
+pinout:
+
+- TX: pin 3
+- RX: pin 5
+- Ground: pin 6

--===============4263526512305436902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4263526512305436902==--
