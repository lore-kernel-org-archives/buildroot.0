Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PfM3vDXa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70EF40BF1;
	Fri, 30 Oct 2026 14:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x11yBLhwtxCL; Fri, 30 Oct 2026 14:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 273C140C34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369297;
	b=YMzj2oC9EfdLdhEnWD9KPv2bPI3zxipRsSiK8NpbAlAUzRroR1fmuSaHJMQ5LbDq2DrL
	 n1Rk7aXk7nFTZ3EpL89Y7z5t9JX/XFlLUmPMb6VexuIIMglIwrxSjZho9dmc5Cr2K5jTt
	 I8STabaYOIV95kftubiL/SiQ1DbZfyVBRZeEWUa29hg1TuukRzVBUXb5yZu2qC/zTmqFS
	 snheF7Bd+D1eQvvuGlrHnKYk98ge4SvyzuYtXixK2v9Kf2F/sZYJp5GI+ZqN+UrdJ3Hzu
	 JDa9IMSzNLa2CU2HxJNiLelK0NcOBVMrf5M+QMa1g+A9So5U0BTuNaHfoftDBG5vl/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vnLa22M0fgV2Ad0XiYktzxufoklUal4mVpE4h4qyxKs=;
	b=DXLNkBbUs7nqH18io0+CalW9rCNsCnC1y9+e+/QyhRCudZETH9wUrNXrkIsh7wHSRXEV
	 MQBNbxmgiaronI8ZpPWhDupqFaSXvQ5t2ftchG1+bS8yxYjq3XfIMNOrCqP9iFq+whBhA
	 EVM+e/FJAazbfW97fSTIQ9krfjLwnIfIqUg9T/5RXZUbVrh0EXkTsPfb/amoH3N7AY55Q
	 FgdL42AIeY5t9mAKHXcNhQaByT/O9KqDtxS6OltspNAWiVE03Vd8Aa497EOUkAjZVJEbz
	 E5uCClGoI8vsdSWYiTWdokffGZf26Fv1e2poJJAqN4lzMRM1wCNpD9u8uzrqlDlRQjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369297;
	bh=vnLa22M0fgV2Ad0XiYktzxufoklUal4mVpE4h4qyxKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PfM3vDXal/YDGkHVwu+2jp/fMeu5/h2Bvq77woSwBQwcPoQ4b+bW2qTDHx47ASto0
	 HzazQ0fTjfwX+UoVETho1HQH1xKqe23OU+q/MDhrZvX0UkWOow2nlHJYWqpo0pV7BC
	 5XAdHxiPpoXrHzxOYrXwB7V5pPG6pYpKMNlaYnlaGmz4QEiW8EGPjWToqe13lCd/ux
	 seuL2GsuEfX/MpLzfxgn30PSXT8rfUkbtHahHA7bNV4Hzug50TU/+fDvWW8KCK2Df0
	 caHAq5RbMxYv7npekd0U5G/6Zt9Jl/XygY1ASCQGZez/yIDgrzTF6Q/wUejkZQeGlY
	 yYtG7cAYVm6OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273C140C34;
	Fri, 30 Oct 2026 14:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39809D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F9D740B38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sF1gYM5hkjK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7AAE940B33
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=q/c6qeGQch3SJVyaZhE27vOlTPkkk2nbwZHlobfQeo2fmLFIN366BWs+PpBK2mlO9k3V
 q/PI7zuSJTID28F5rANEk8JYyLuzGe59IHI5KeYnjlJnxEkGgCI2uObQZa03VidyDsW2+
 0LGX4uD5afEKK4xGSjivkPTkxypMD690G6x27TrWm5nsNcvLxtKPLYxN8lPWdKOIucONQ
 xaAMZngFjP9LwCg1GMqQqkDqNzoMECMWdkz1dmuClkZLfim4jL+hub2ZyLfeFm6n6vZQg
 qnaXvoqafNKQH7tHOFf/Hxp4LPaGyTEyhmx/hSulxKdB3fKrrA1hCthKoD6aMOPPlvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KyXWZY9xfJHjv8kYrgg+EZn/KmCEbf9ZEEaoN9H7P4s=;
 b=BrZ/t87nvVtlX1HoliLKEQ82M5JjeEvJqlFMCz3gQYwBfNhjR1deNDyz4LmnBUaT6MD6
 BCYMMtmomw/jZ9O+l/kHrvE3MhlLhfdE1GnMc5qhyZDiA4q/cUeJjZHu0eDbIFtGXHWYc
 glI7eM+MYz5whobdoIVhd5tx9mhDRicd1fOz6wl7ygMG6smS+mYP+Y76+SpzatYbK4mge
 xqBbtEUcq7tPScLxvpxZ8zZqwjZ/K956lTXnVR59bB1dtyoTTttTj8prA/G3Aj8KeCgQj
 zP6EUI8BP358moqYLbTnYn1Mg0N1Pvd+1nsOUGms64Wr4XX1ExqGODYWnHmvafuBuQw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AAE940B33
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983489D388; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 444dab5b7a93efb4e1d978ea9060e3d405ddccbd
X-Git-Newrev: 642613bf0be13863577b9ce70a32c2e13fdcab75
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.983489D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-grpcio:
 add security fix for eMudhra intermediate CAs
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
Content-Type: multipart/mixed; boundary="===============5736448455085318381=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5736448455085318381==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/642613bf0be13863577b9ce70a32c2e13fdcab75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

[1] https://github.com/grpc/grpc/commit/405e6a1c30024ffd688c38f784c34f57e36c4304
[2] https://emudhra.we-have-a-problem.com/

(alternative to commit 309c48bb224d8d403590fd1cc64c6ed927602872)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0001-Update-gRPC-repo-roots.patch              | 13197 +++++++++++++++++++
 1 file changed, 13197 insertions(+)

Patch is too large, so refusing to show it

--===============5736448455085318381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5736448455085318381==--
