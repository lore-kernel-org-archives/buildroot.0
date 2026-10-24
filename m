Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3BC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lgSQ8Z/J
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C6A860AA9;
	Sat, 24 Oct 2026 11:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWHJPwuCacSy; Sat, 24 Oct 2026 11:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B9E660A78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792843003;
	b=BYt1b/iooTm4jCS/3pCTd3CJ9bbW3lNw8tzl1iJKK/dwh4BQvzv1oRRoQd+XPYjn+mXM
	 FBN39So0f+qA4VlupDvacI1tdkFZgaXp6PJVYMnYpW2T1RDA3+B5BQDP8J7bUNZ7Vr9YO
	 G1w151HU2uJGbv4+UjOUyOAYZAqm0EnFIJ6OpBZRvDohF5K22qbv/XMYCyUw5HTR5OO2F
	 JgN/eDDxZUZRB3hD979aQRFlXmwtlOvOCc6KN5i262RrAbBM+m2stthnleN/WY+zXp8Gf
	 Q8dLxbA/m80Y8BrPsAVDrVen0Nu+jr1swat05ZTcTj6//19fi+gvhlD+xbITypGcVwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792843003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=d7ydM+3ldOhMp1/9QZU5n6vnbbvkagcNeA/cmiUbHjoEx++/P2Jt9ZVJfu5gUTF6FHmd
	 sc+SDw75sBMB9NlfZ6WjB4Bujezg4TFMezXe7UIGAEyNIl29fUUZDYUJFxO60ZWs79Ca4
	 LlJqX9uHWR5SPqN1VZFs/0DrFneJvJ5b1F2o3DQjTZy8rcH8uvHZviUWuTEZwnCNG7ySS
	 tvXXU51iADID6HpXGoq5Z4r94xyIHADwOhmfcnLkIyXyWJi2/nBMRIlA7PGru3Ik9h9cT
	 AVvMPFcrV/McsaSfIYnO9pjhvWSYxWadD/2sAneWk5XQJ0MPwf54fvUFzBFd4bye72w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792843003;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lgSQ8Z/JKuO2gHme5LWewUlIc9JBSZ4ik75T0FWT64MH1JTEJ2qKdOuEL46ug/LYV
	 0DuMRFKOontUOHXBVtiSLgyp0InncDrx0iDVui4VjpjocYP2k2rg++vswlZMH5WzSV
	 MxbPRezShH6UqN4WWM+f0QTPKhEJWRhT10/lErgtiesEWHQ5ZVuH045IZGR0wyyHuT
	 i0RZk+sU2BL/sz77txOmL5QyclMMPOa7bcfiVFwU215bWDZ57V7YYEO3oHjhBecXS0
	 28y1H4r7q4l4XlXB3B4nyZt1jzLX6iOQqt3YSEgKeF/I9ldkikc03/B0i/690DP8yo
	 5KJgqFUj1o2nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9E660A78;
	Sat, 24 Oct 2026 11:56:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BD8A356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E600160A78
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxhaJdxf09XA for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4B32560746
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792843001;
 b=bhOdKh7ThBP6ZdXdVIe/75hMkw0Up2Glj6+rkYm8PnlmwiZ866Mu58FRF9xDV29LjcqO
 CwcL3eVMZcOfBqZhh8WTY1J+5h5R8D1XETVz2Uv7tNy+MRNiwYCJZWJJpEoR1dKB7e+CY
 WmJRW2piH9gBlZbyPsusd7FKxqsgVeeTS/PHRf8b//ydcDBToNY6Rg8uYNSJ5/N7rwZom
 RJAUyXP/EqKBWBrSk7oMJInWGB6Jh6JLVlHAE69nALzveOGjAfAjBxS3RVvSy70XeVnj5
 WICVXw9vd/X7wgNsc5EkU3Ixm91etxOBp57pxnzgxv60He502kHNOQ5RP0/5MFZs8Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792843001;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=DY4sgsujtcQwuqZRJEfucSKRx6B3/RNXRU+1izz/Ma0V6t4tM7M+dkEa3Bq1tFGFpjzq
 wz980sI9kLT1sKIlJ6RLpzHYwSd237YDNfnBBXr66LBXH9bSchudFx77T+1y/EInWjnU1
 juxFgYCNiWTSX4/F6ouJ4v3ZY5c6Bnoxf5bMt9nkOAK+vz/mFXTujoMsQKv429s1rqqbf
 3R5bmcURlW6EOWR0uaSmhQm8GLG1zxk8p5cQzrNxU+gkCiSJCwu5fWCE4adxtqs46MYy2
 i7/mevZ32cEscPCsq0gMST+m4hMCWGHvVVHZdQaAzCMlZ6YlwS8bHaVKOU+Sd65qwuA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eWiij5H2; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B32560746
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C267313F88D;
 Sat, 24 Oct 2026 13:56:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:56:37 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:56:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-29-james.hilliard1@gmail.com>
References: <20261023181818.920329-29-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <766fd5776bf21561e94369d7ab11580a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-vcs-versioning: bump to
 version 2.6.0
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
