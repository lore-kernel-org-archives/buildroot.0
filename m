Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFE606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m1+Msq1E
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C5A80DAE;
	Sun,  1 Nov 2026 17:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUEClyphbZTH; Sun,  1 Nov 2026 17:37:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E949580D88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554666;
	b=H2EfuY0hOsd6Sx1JIgqidi7mFV0hCe+fvDTYXUfwJMGhiMs8k3QHL+edo1BqrWgbGR9g
	 gbefu/9r8SomelnbZN/4q3QO9bu8VlrrMZBLhhPvIgw5wzE6Ql8sOkLSYITM+F6TORcbo
	 8cbBlDVdAp4ZWyVgza4TDqroy2Nkw9GWD/VPjwkVLIn7t/CdS9X6Mq812g/q3hNe2OzVm
	 YbOTQT4gAgGSf/CsSHuYMxWPXTNEzE65pOi/pwv82zcC0xVqAKu3UGO80tdXhFYp0ZnYB
	 kCzJhxqXkmisLmHrMLXlMKCUd/0XHkVCIzy+FgdNeul2USS6EcxRjlhQXOjJONeB5LQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=me3hYoOXjxm6KImymz1PYZiaHzkWgWoebhL/pfHGmAY=;
	b=OUsHDx2jpuj1ysmxPw0EorMNu7H2MYHt0vgfQvibWlil+P5/Ba4Ngx0ddWIrBqAsmkFQ
	 qBGq6a219IvlV/ly0FCGpkgtAwx0OlkOfP6LTdMC2UYhFU7xBH8nMEIKmHRSjIyJYssmr
	 m+8sJApSk+DjAjfAwoOKpjrWA9aT121zo1vCoPljS2V7EPKF1kQN9gOSvsUD9lMY2v+cO
	 g3w+DdFOSZGbBxgqxmzjfzexDpPr1jRZ7tA5CsTF/Fveez63s7GqM8dkm0xh2RqD4ZAwz
	 WrD82aWTp4KUEV8BfYDDTrPcMqLIW8tUhQ2D0w4/iw1g37U/mwb9/TUoozccUT17fpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554666;
	bh=me3hYoOXjxm6KImymz1PYZiaHzkWgWoebhL/pfHGmAY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m1+Msq1Ed1YMH6fmFw98X1RtqyOrvL5RxJooBIh/QBlsKXOsMvxwPRPhZFLuu64Df
	 18sR/GhMpspMcWrrxFlH93zi5MV4jG3kS+68PPaQoe2xyPaA3nMHZgm0S7XcT7i9sZ
	 GYZ+m6XmeOtJocufyAOBJ+pHw/bbM4Aj0oYRi+cZ6CWdSXUKeyU8saRizsg9OUkVoe
	 gs6d4vnhwvD5KFqalbiCK7dbOFOqkYdekyXjY1vDwSr5PQkVw9QiwqZp1cgbaDYW/C
	 WAoq1pqRWqB16cnVX5TJPA3LmrqsxlDjzLW1ghBBXI7DJ1y2NtZkKvImpVUIyLOYrb
	 T4Eo9+n4r8pJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E949580D88;
	Sun,  1 Nov 2026 17:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D38AEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02CD240574
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G05hoKclCcHh for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:37:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 656DC40556
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554664;
 b=keeZQqp/ysCsFBB9h3qt1fSPOYeirPQ9YWWHjKT2RlJQGUmy/S15OC5VwLi/qfmVfQLj
 VNMdXCnASut0KvLI9UDniujSw7n9IAb1mBll/kJMaYQhoAzkC5xhl/FYqQVuW3/0gPeF3
 j9WaNY578iZngilhnlPSTqGgCNME+f2SXuCHYUkuO2gk50VJXOKjGo+Jv6372q/2OQLKo
 2MU+UMWeZMEqoeNo2jU6AXnnr7fXNcEIa6fNyN51fpTkdFT4FyhfkIO10xRAyZ6DCul+G
 aQX9cBvKp0pHm9zObH+ogkhCQrR8XIKX//otNH9MkvRcA+XP2cU+PZbtvL+EfN2SmEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554664;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4p2TtauO6k26RNYVaMUWmADvw0JWy1PX+LfXcSX+s5E=;
 b=cRATxvRiyMKEdtY3slxdxow91139u0mcShzGkspy6jqj53dNDFA3MNXqUY5lLfPESxSo
 fgDoa2spT0JEKHPmP7FTJUFoNUto2OtLFxhXJ4Hksh50jFr8+r0ln69zqTSgfTJ0mFvkZ
 v+4nd/mKziq6XRzHJzx6qqrfpL70HAT5wI5JleEkd4hbOlIaEws8JHPs6pYfUzL12xDle
 kZ6b9aPdbvQyn9Wgub5cfmFhNwbLS4vrlReKvnO5I8t/pzBHQx3hPj1wyjZfZnxOKQaw8
 7bab6oM9mSnXK/GgHQGCkQwiNlhE5QQhecjwRjO1k3TnAedUMN3SgzTwUMMxc92BMLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UVhJJS4+; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 656DC40556
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:37:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 742052003DA;
 Sun,  1 Nov 2026 18:37:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:37:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:37:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Kellermann
 <christian.kellermann@solectrix.de>
In-Reply-To: <20261031201918.2850153-6-james.hilliard1@gmail.com>
References: <20261031201918.2850153-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <70b9f65c665f767b5fff4b60a467e87f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pylibftdi: bump to version
 0.24.2
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 21:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
