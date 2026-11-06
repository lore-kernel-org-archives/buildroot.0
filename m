Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90086606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YlqjFAop
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B5D0812A1;
	Fri,  6 Nov 2026 21:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlM8Vg3OC7DB; Fri,  6 Nov 2026 21:18:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A26058129E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999888;
	b=GLxyC6Qx2BuRSYtI3aMrvgj+SjndtQk4t1goN2TpBSwIHilPMS1/QuM11I20TSPmxOC8
	 YphVa6hnsfXVnLLpHCP0KGTbk5fCIzrFRrcuifgOB19bysbrPTA9GfgVsIdVSEqbi3fWV
	 ZAF8756RQQcql8Nlva+bjq0GXBZxaXuHq0PZPHUBcho5OYM45EUmG3zBTQRhORjVqLXzN
	 aBWy0oZOMes+fwe+hZI8Rtl+JWLJ6v50aiGVn5o7wVwCV7uGcq9gAQ265dHhL1iRDfCGh
	 78Dg/y3ZdcjkX2Ci6Tce5BVWGvauWAMvALnkuzZqGsYW8jC2w6BjweuWQULVQHbT2iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=MGUeTrJu85BcNU3HFisqM2lSdKvQP0OS8zwLYvJoL/bUKlL7LE18mt+nEnZuXBlQsUot
	 3DXN6fAi8YirQeLLt5XJ+4l4D+iIUWLwiQmu5AyvRlV+V6qLwKow8E+snbclykgxippRe
	 D/3GavP9ut5fipI5I/qVHwSEzdevf4A1RHVL7MrbULx3TsldfdFc4wMZiNPDA2/YZfdQS
	 jNRMN3aFv+6rcCtkXi6892b9z0NIMOo7xZtR5o3EJM2H5orEost4YzMjGMc8dsUWQOfk5
	 gmCHm/BrwvbiqxldmAVFiHbyNoUz06cDNHQj7gT0lqFk4cvMH4QfTNl4HSOaHtMojVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999888;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YlqjFAopWOi9KCnWC6uuuOA5NdEUFqzhONgm74M48CEVFV1ufqT4UUuaKOR7fQ4fA
	 BhcwhM5bQOiRRWnddgz6TRQv1tx/KndhLyWJgm1BRixxEOheual37PVYy1s5EAs1XQ
	 M9ONDynE5AlSbuqRzypL6TByG5MfQAhZNiG5MAV/z/8eXzw9vXwQZbh7nBwpCLOm0o
	 3hTZOw1SSSA9nMeOJFXky+g7wqkVEF6j/in/KolnQaaKhBA/aec53mgvunRfWgn67g
	 j9vUwtkKznU4gqIZIe/0ozYZKc+t9r6ahmwNy84yaNRucym2uMq9gNmBj8zIsHHTFM
	 Rj4SdbaHupw2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26058129E;
	Fri,  6 Nov 2026 21:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2F92235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A44E8812A5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hi-BYc2azHda for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:18:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F3DE6812A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3DE6812A1
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:18:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B589B5FFAF;
 Fri,  6 Nov 2026 22:18:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:18:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:18:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-11-james.hilliard1@gmail.com>
References: <20261106191536.2120153-11-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <18f304db7cff9a5f362b113c3ccb52ae@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-google-api-core: bump to
 version 2.44.0
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
