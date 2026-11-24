Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DE606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JhdJc4Nn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C4D60817;
	Tue, 24 Nov 2026 11:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B3ZudPY1Do0; Tue, 24 Nov 2026 11:16:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DFB2A60802
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795519012;
	b=AwxTey4TM381KQZ0dMnzzll9DrRAxNBjAxfXebcqf9FW4x1qQasRLhv5KBFTEAq2gNU2
	 delTo3kA9wzJ4/f8RBkZ7BA3nemo8Ci3n12/i+eKmZPajrc5ebDGYjBU7Irk/z9HQgr6Z
	 RqRXoT8mCesWe4MjkJm6OZe1DmZDXak+1GGWkzit4F/b0g7hasJRCAM5o08GybEL6FAiN
	 iO7KxHoz4gL95FJvDobsaAgGVMuQMgrNEZtd/AGx+R2rxmFuZ7gHmjyM+AZGYpGMskV/a
	 HL14b9JKzP5YVzOC5mnJiIVLXviL2FaPLlF3+GOasJEagT8faKT/RupONVKMb2sA7hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795519012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wj0NgsfU7Er7Hwr+dsZfWqjJwmT330NbL9C4UtRLTz4=;
	b=IotVHVZaMPzJ5dJEMu3WqOFnVvjhqIRNu0eSbBO/X37suSI4Rz2W4rUnma3b8iJDFFW+
	 QxT9pDCc3phMJ1ePmWC4gfzVfPiKP6iQ/jvCBkRg6n6HjtIqpajjtEjEKm3lPaZYizuMb
	 wj1alwwriDMUCKol5m+g3l7cGXToYh7eeTzSg8FHpfgyOgkowL0zUaCTbivWtsUn/WwBI
	 /6OUjmVGzy27p7BV2ae03sm9tssbMMJtoW0y7WQpNe4ZQvcqu0jL/Laqulq9Zxg4Tx9bM
	 Hq1yoSCm0LGpx9QQrDUQuWdIKKmM//5FC9skopa0cWOE+pwoAKPhVNZpOBASCU/V1lA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795519012;
	bh=wj0NgsfU7Er7Hwr+dsZfWqjJwmT330NbL9C4UtRLTz4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JhdJc4NnyuUnzwVGbdMX2Bj9v7BhZ8rM8mLy1hFCc0rjzSkrjkpARseM+ghZisrtL
	 4cJIzccPhHXdLMdOz+RfOVVkqx2wU6yUeK4vGPk/4CyIFOaEBsq0jDhKYeLEjAJOQC
	 5RubSKTWBtKxMLXFmusGFUW+4e/67Ca7BV/NhO/vBL96Ln5O5kN1JiiBGrhOcBqg/e
	 1prMSKNo9xcLXLAU3OHxbTFJPgzkEybJT3IevsvHHnhfu+lKCP9UJlklotoW4XXAum
	 LVcinU7BEz8gvzmRt+BtFaUCYkT+zRyQ/j0oAnsIL0fJoYbn7VzizGwWnppu1a3sQv
	 jJISBikogzrQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB2A60802;
	Tue, 24 Nov 2026 11:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD8703A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32BB60802
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKS5lAgeERYH for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 11:16:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E265B605EF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E265B605EF
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:16:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 07F3F780389;
 Tue, 24 Nov 2026 12:16:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 24 Nov 2026 12:16:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:16:42 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261124091250.2377810-1-angelo.compagnucci@gmail.com>
References: <20261124091250.2377810-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <1eb011bfc4ca5d6ca5ee85178a1dbc73@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: move libkcapi to Angelo
 Compagnucci
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

On 24/11/2026 10:12, Angelo Compagnucci wrote:
> The e-mail address of Tan En De is rejected by the mail server:
> 
>   550 5.4.1 Recipient address rejected: Access denied.
> 
> Remove the entry and take over the package, which would be orphan
> otherwise.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
