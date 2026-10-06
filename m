Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8619CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 14:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B26607E6;
	Tue,  6 Oct 2026 14:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-AQDfd2_QwV; Tue,  6 Oct 2026 14:33:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A6C90607DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791297214;
	b=oyPq7NGPwhSanHil/QAsIn90Z7jovmO6OzGS+C3h6BmQ8v6U/5cPRrsvcrK/1n69i6Ns
	 8EGEq9EHBQLxhBW85k08Yn5vQlcNUSvJbytiYRwnzSIjDUalubR86VGmwvEf8NcSyTha9
	 K3DJNRe9nWYemJdYSDI3XfPjVwLwOzRpTA0IBFhs3WpWCcUwrtjYQql7avBS2DhDzXY2D
	 Qk3RlAbqXTL5Ii7sQac9DXj7cbOJzzlto43IwxJmXsJT503ApMS7oY5WPcwbm+GaZ0+Y1
	 6oZ2F8vPC2I0jYANTNupD5ST1DOe/yvYOJHjH41szXuXfWk13tA2nA5No/5MzVfjtkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791297214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5xdpBveNhkB5p+m5MNMRDmNh8Oyp5naRlJUfMQYT35o=;
	b=F0TYHVDqNpiFOY+xudItpMfgu8C7uoxHgrC8Z8RZxeNS6AOUbYuQIrYJiF6fUnIFczJY
	 mXBAgvUeGQ/xTF1KCoZ3f/TJPZ9+7urOx2r0uvIw1fgXzfGZz9kIlZmdD91ljFZc9lM9h
	 WrS1IAhXtDsQQEKaSPbODS2XTDdQs2viJNNA5n00o6Li5xyyVEou3LF9Fu78/Z9LFkXM2
	 WTOpdYMNOOARJVQMC0nNTFgFauVnffgJn9lNjcgmmRzQ6+PTEPIe+q5QKUoWQx8ekDdPU
	 5WBdFVBfexDrOpluwK7WIl7w2aYcJFKF9+toN6YRzTV78S60Ep4y/Ws14M99g6uY/nQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791297214;
	bh=5xdpBveNhkB5p+m5MNMRDmNh8Oyp5naRlJUfMQYT35o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CUSfxRUxeMqTZE59mHvSRJPJS7+DWppwm8TTcM4hlqVuH2fAwiM33znRKOS+1M9/t
	 GFIiClI07igSvJBKJ4dQbyBW1f8yB/wYQ4BY2z1pHWkLuztjqiLSHwb9YI71I2oIbF
	 XyQI9I/+3ZqzPeoGNWlUc+qiYZyfU8G8pAqQUasX40aE1MofoZXwzRuYQ91JNiJbu6
	 DMdsFhwW2vqFlvytJ95G9d2CgdVvWGTZNHsTy1SZTJerymA0+dDxezu7CItarfhfuo
	 Mvq7z7ET8FPWckaPWDepA6pzTX13oN4tIOU6sDvILjbqiDhkfD7U/1ZausZdjeEHvB
	 SE8fXKMu1dpHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6C90607DA;
	Tue,  6 Oct 2026 14:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D0FD1D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EAF3607DA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAm464AvzXTr for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 14:31:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56A67606C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791297066;
 b=GG6LsXiD7i/h8AIhJaYyyna+gXplHBwDX8Zx7MD8Xovqi2h45QHfffefCrgckp0/FiP+
 16piRHfSAJIUplGON73OVOOak8qcxwGXG+10/F2c7bAM/w0Z+ThrN1nwj7svHqI70f3qF
 Jvke1vAWvQqV/o2sL9R8fNfSNiqdRlXTXeEAy2cXaNG/4lSqCQclOVa9Hlb8EwZtdfDoV
 o/GOBtxLWPHtDk5OlgVsfzU2hdaWHReaFH6Wims+mKBovIaOnZN9UCpAn6Nuncw4V95bD
 QJm+0FjB3mKq5r4n5fHUIxI4GU53vAzd4g92spiIxaH88P11GenGngjF0w7YSLnUp9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791297066;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=MhZdPtigZ8caPirAqcJZWcWEpe5HIS8KsxfkzbdnmP8=;
 b=CSnGHne5+7jq++iWyRFmSF3KUnQaPR8Uf10p5Zjn9QCG9gfZqCMqdubqA9CUZFuqwK44
 X+I8pBJHK8Vc7xVxDM+Gf9NsPdOm9WsaGh57U+Xdq3GZbpF6uxS3ku4z4p30C6n0Tw7iL
 9ee4/XdhVEFrOzJHtfuZL5cqpkZ8QpsiYvic3pYNx7pq46E8GWoW0tih61D843pJg8nEY
 5lRRJDufxv6Ac6T6sGnBI1v8btWwXSlBcufHoV2cOKxXzjN+B1QMiadFkAPwAfbQkODIb
 JXdhS08XHZl5ClNTqex/wpb41sr6oNtwwJ5PneMF8jIDoLREnt8As/9JlsJ6L4iMjNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qP3FllBd; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56A67606C2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:31:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B998160147;
 Tue,  6 Oct 2026 16:31:02 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:48682])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 16:31:02 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 16:31:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004085202.593973-1-bernd@kuhls.net>
References: <20261004085202.593973-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <a9139652df0d8c12e8682811d7327b72@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/10/2026 10:52, Bernd Kuhls wrote:
> https://sourceforge.net/p/fetchmail/mailman/message/59406635/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
