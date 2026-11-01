Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C8606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C3OTt1ZS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62DA80E0E;
	Sun,  1 Nov 2026 15:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNkeNFIiGbxr; Sun,  1 Nov 2026 15:24:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 531E380DBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793546685;
	b=p/jWrAuXDgeF7IJHqOMbwRPvRCgbV1QHdUpgqL7xyqEH2uF4bgFMYGYr0+vSvRFyYEsg
	 jKC+dLQy9HfV9XjDO9kW6oi1MquFFwhLOjadNY+eFUJZQVc+mYq7BZuRvTYD1O+jdD3ru
	 Q6lnfWHhIQIYCNrIr41/10JUMYRfUQgCTPRCt59mkcyXv6WTT8xGRm3ziltQVSOtA65EW
	 9M9jFIBTGkQ1a/N0IxqJJvUAr05YDcdV2DT79vcQcC+8mswhhaoZvUiHvzat12zFLvu14
	 SkOi/7FnVo9NtG5Slfm2PffSupGdsg3FlNucxmNd+XQ9L/Iffvln9FZb28zfAtbeH9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793546685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=YPXJYWlsVBU2woblumqRtHRC/0N0/C408IYY2iPEZY0=;
	b=YXpwxuOkY+6yAr2VBy+hNa4+iyuPJp0KXUsGaRNeW8QMcV3Qrwh4ck4De2EUnjak8CKK
	 8hk6AOyniHWAW4Me+tAbXF2lrpe3KKhNEXo8L8FnAqrnrrszXmj77cvONwv98DacVom45
	 Qg9dhA/hzsLxnYME0kuB8L/l2808kMHm8xPr2KT3An8FhL/hAbB3j4qyKySKmTyVZzvkd
	 kr/XGPXcaHfDUePNDnSlJ4KIj/fgNXYoEaXcEjsc5DOOkBAgl4dTqxEjbkmyL3CM4hGLn
	 XT0vXaCswrvk5xHtsVJAH9Ngdv1iuFtrfXsMPm/XTuEgpISfdq9Bimk555wEJ5MvGHw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793546685;
	bh=YPXJYWlsVBU2woblumqRtHRC/0N0/C408IYY2iPEZY0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C3OTt1ZS16krO8J2vE/i0/tirQPJ32FSz/NDcRSXz7aOxlyu6j3hYlARQ6OYXE3mN
	 SokvVznRmNRSK0XpkUxgbmR4LfsdkfpmF48/MNnyj+77+cH+2vMScmGV/UVaWd2jKp
	 PON/VqJ4e4uHp68BTl2Ep3RCHpCzStDQlmLU9jJRHrMfpgaTK5n3VAOonBx/+csX+R
	 LFfEzTIHn0DdMcn4HAjPS7uZ4SFZT2rgiz+kUujupEyNKPkco7lSc6zwLoAHbKK50O
	 s1XZbCQa8pV9PvVBJU2w42igyI33u/N/PlQiZyzhtcCCmHPVxSCoX90RM3NhY2rK+K
	 8P91e/wAS6vIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 531E380DBD;
	Sun,  1 Nov 2026 15:24:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C39380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 287E740462
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wthWxxLqRbfa for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 559C1403F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793546683;
 b=qc8imPHjVfDnCjYN+twT6ircN2wWcQQEFtGHN02qx2VMTwkmwQJrB+HgU6KYBf9YyaJ1
 Xlb9HP/yMPv4j18KOFjRSTOhgeYJf5UxNm7iYl2N+DmsIhB6No2x6mwXeq2Toz1rLzuNO
 HURB6NP19iyA6YyUhscxYCzOjnUyWkUsfXfzYBwsn1eBtsbLgD0gevCTHeUufJ7fkqrXe
 pbcgBj/9edoUYzEHdrIDpC0N7jD0MLmtXcktbwAtyQ3N/xER6kd0BF6F1Dw3Xm/CphasR
 Y2HNJt0BzQXTUqIyoBCIiegSITSf3K4b7S/LugZ3KM08YP+1/jcb68XioEdmA57RlVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793546683;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=IMATio2d7af0szwl3HVBsZQRsZI5ukJT7XvZvMyZqgE=;
 b=VuiCCHOwNaeLNiSA427DChqRKq62LR5oNYkR0lAaen4Ypa3PeEPtx6k1xIUFqzT5z51/
 K+dNp9xXS3W9AYKfy+YYejQZvEwtBsD4qrn0RzspXlKdnouMuHofstIREL0OEm+73v8ge
 8Loqt+ivd5HJ3lFvQ0EcbF/Bt8alIWYSlTXNuVMRTRkYwmlbwrEm3st4a199CMDFmVBg6
 8lye6Slc9KJWMW2g/qjuiZW088BVkkKA6pwMOVZ7VQ7sihxisWuIJzRV5iZI4X6DXJBNt
 kmcKtIufdSeie3xQKa3//NI/+03B8CaIJDP+/w8ZS0YBAq1+RQT+76MHM93EB9YSPbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X8Ijh2k3; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 559C1403F0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:24:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D4BDC13F8A2;
 Sun,  1 Nov 2026 16:24:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:24:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:24:38 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261031074840.373331-1-yegorslists@googlemail.com>
References: <20261031074840.373331-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <947c67ff960abdba337c1e184afa89c3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libcap-ng: bump version to 0.9.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 08:48, Yegor Yefremov via buildroot wrote:
> https://github.com/stevegrubb/libcap-ng/blob/v0.9.6/ChangeLog
> 
> The new llvm-strip requirement only applies to cap-audit, which is not
> enabled by Buildroot.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
