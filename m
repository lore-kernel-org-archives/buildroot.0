Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA34F606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F+yLkhVd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=Bol80TGm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BFE40685;
	Sun, 22 Nov 2026 09:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMMecJB6CZf1; Sun, 22 Nov 2026 09:35:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9DF0F40642
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795340104;
	b=ooefjfxnoyyYRt2pkJTCDa9OImfKUMYA5HHofSTtLqiWUf/cgIy+zrR4cSsAXBc8iLBt
	 Lunx0YWAxCFI2eYTQbiqckbyHX6lJixDKfysvmbHR6J4JnnQFlD3uzaOXvtpHs+mjKktR
	 1lIhxkL0z8vY5mnNvd5J3FmR4ncXLHt+KRLdlumWXAdcyTujptlHpXk6wbMPHZXdpTnIz
	 2vBsBrOwrgEEiY1FMyrxaQlbedCmgWyRVvnK2czEyGzjNDODxc1WHNQiTW7Cn8ybbA2x0
	 JuEpX2MVuFyUYJHX2yZIuTqqrrQanhJS/JllwpnftbC5FMjp/x+mrXwHXof4EOQ5qMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795340104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IXTbwmbUpNcj+/J1R8OHy4SMCHsqdgVKs8UsKhiQSbU=;
	b=QYtYUTBjQtDtw5hqqVBDwvFKVxGrE9g7V9k86V5D4h0KQnJgDDu9cmxRbp3JQA0ufqEE
	 yZojMWIO/0FZCE3Nddm2sYFZ/CsntJlvnVp/vxcv7BTHlphpqAFnHiuNlO8jiyewe/BGs
	 HkSHJ5eAy1uizUCuMeY7RycJb2pGAgB0cr0nfJ3jw3LDhR4KhxGtdUdPS0EpLQ4yZ6xL3
	 ujfVbr5I3/Lj7r/YpdKhWgodmWK3KmVvbBb7W42K/TgovI0k2XBHQm/AEZbxJvVlJUOUe
	 L/lBJk0JLy3MBMZAPkIFzaSIqVfDvlx9zS5mblZ0mhhCkNmevG3qvbzJPmurFrMpLwQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=Bol80TGm;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795340104;
	bh=IXTbwmbUpNcj+/J1R8OHy4SMCHsqdgVKs8UsKhiQSbU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+yLkhVdbdSLPawuB0VwHxYNFP3bLZJrh8IbpEzyqcYZavE9LWAgbwcV7THevEBqQ
	 TQG/E/mPfYyMabm3Uaw2f1S1nklev+CD6eQgevYZ4FUt8VNrVZypEgFJ2NofbgTfCY
	 13ynFniYXeF93nu6eArdHCOBwfu8DXFhHLfGYkzqm+uOn/e7+wIN3CH35Kw92R7QkW
	 xwqcvl+Sq0vOHUUQWwMPLGo79dWtcStfrcBfgAx+2lAF4LY3B1rnO5G6cQuyEM4UdW
	 3AtlJ0x9XidbbUsiy3DGFCTP06q5JUYfwAfsqQxKLIsvFisqsQEB2VpqsmmeMHbTpy
	 1OWkHlYDHr4sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF0F40642;
	Sun, 22 Nov 2026 09:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C77ED15D
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD3F94063A
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u03E57RFMF6Z for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 09:35:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 62F0540637
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Bol80TGm
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62F0540637
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 09:34:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Bol80TGmfWvlAC9/HqW4QIDa+EEw9N21KJyX53wb92SSLMW8pF5PsayN+5LQSKQj3sHmxYULQhUjCSurOElq7nl8Er2gjLb5XupEO2FM/QTDS1wVHRgXyA6VAcRd2+aAYsTOUpXwz5HswG3CtAZyt941F5eeUmtZrNc9yJbWmZuYOzirHBfcl0n0m2fmY4sw85cyTHBVi+1d2IpKdTKVk+JOKDGvFkwL0v+iixgTVd7EWabaqh4mz8nEwMIDq+yXCiAfc5/vL5t37s3aQ7kfBBXRfj5dwJDcDz0LAww7VItiyQlbq6fGKPleBQ/SoII4H7h0HoohN7iOyxkNeFtgEA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=EXMrIt9LB4DtStC5dnkASf7M/nihpMuY5cXWL3wsH1c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1509998320; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 22 Nov 2026 09:34:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xV3yH-00000005dSx-1i1l;
 Sun, 22 Nov 2026 10:34:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261121165114.964464-1-fiona.klute@gmx.de> (Fiona Klute's
 message of "Sat, 21 Nov 2026 17:51:14 +0100")
References: <20261121165114.964464-1-fiona.klute@gmx.de>
Date: Sun, 22 Nov 2026 10:34:53 +0100
Message-ID: <871p8dqkea.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix documentation
 URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

 > The official documentation domain is docs.u-boot-project.org, see
 > upstream commit 7c419d4b578492e9781d4d7e755809c78c2c3661 "global:
 > Update URL for U-Boot project" [1].

 > [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/7c419d4b578492e9781d4d7e755809c78c2c3661

 > Fixes: 5ada3a14425e5c5b8ecf120924b7014f80fa9ef1 "package/uboot-tools: fix download URL"

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
 > ---
 > There was some quarrel over u-boot.org, but I can't find details
 > publicly. There is a disclaimer on https://u-boot.org/ that it is
 > *not* the official domain, though.

I used the URL we had in the boot/uboot/Config.in help text, so I have
updated it there as well and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
