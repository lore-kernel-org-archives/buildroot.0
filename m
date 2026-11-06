Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD4606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M8xH4oOu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08ED560D92;
	Fri,  6 Nov 2026 21:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SazFyKRk9YBp; Fri,  6 Nov 2026 21:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5891160DB0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000164;
	b=TRkmJBq9ByyenkW15XmsJzbEqgZvY5tnm+jfwmXDxa1+wBYPWf+IrWlRYexwm6ry0sTH
	 +9e1beDmH2qslTOXDzkX96yd34VeWdDPf/QFbu8wglmb2udhUg01jNHqkdBmw9bOTv7Jo
	 p1ka2SvlcDqFmEFyhVJ6v5bOwX/OhYfcOlifd9H9ZrJxOTTwN41091Ul0BP6tt9KFgPM8
	 qw2taDxeHzfQwOUBAuwVchlkRaoquJJVbIrs4FwyESlHJeSBWN+FPKu4a7nUr+EUobGSa
	 3DROggKPo8vv+KQHRCVu/lTTRo6q4mJIb7kWGTTKE5LlZlTIeLMaWwTW4W8m97IR47w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=bqzIh6g3aGNj+uF6BUbNIvHzo0IN1WkjT+gMRCoWByKoNNPDaRm7o+D0nFBzkR74JBQC
	 ub96/njlwmk/jrDAC8v4Wp0E4ATephhtuWHzMrpTEmYfeWxugKyCkzJZaq3Yo4KNd+TMF
	 /6x3CrP6Hp1kL6qPo3l0cT4WqnwMXyYj8Ee0ZyWrq0B3mrjYQEB5+ahJKNsR5v44tdR2E
	 xwxoI/ZzljkOhxx7Yi+fBklGI5ynuywmswi+55RgRXS1V8i52p7I0J1zk34xOu36+pbX2
	 9wea549qBeM8ll9sWpzRaRmljkRhA+hAdg8RtwItvFX/Qujt8EL21BBNGpf40QSnUZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000164;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M8xH4oOuYUeXSGaa+KNhbfxHmxikDJVj+IQcdPPkhsJoMg2rOXPuW5/JoEBcnArEE
	 eJl4jc35XZ8oZxtAsml2jMfkx57GLge6LragIWxYB2WEfVV+4SAr+8FDvLXoyl8GZ1
	 Tp6bi6MV7BqkmbuGc5+FbsgdSFoR7QnHBOjVpgTj0PpenhtM3PS3GCZySTcQSUL4Iw
	 oiu3ePMN1x0jVOJOJrF7DbuiCMDbW6YhUhqD4sQLyvXRdfL34+DYkrYmQwuzdwnLcC
	 2+eWfOcPVPKH1+sGYf3P+oFYWQ0cTbc+EAoeaK35LpKDm+X5cQ/UvQmlE7lrm93D+J
	 wWu0BleG29D4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5891160DB0;
	Fri,  6 Nov 2026 21:22:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 999AB235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F66B60D92
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWjSFlIwl7Vn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D9F1C60DB0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9F1C60DB0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9F65FB00548;
 Fri,  6 Nov 2026 22:22:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:22:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:22:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-30-james.hilliard1@gmail.com>
References: <20261106191536.2120153-30-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <5283fb7a164132d43143bff1707a3154@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-types-python-dateutil: bump
 to version 2.9.0.20261104
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
