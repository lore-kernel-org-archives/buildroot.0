Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D6B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TSl5dmlH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42ECA606FF;
	Sun,  1 Nov 2026 17:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRdlUaXzErRT; Sun,  1 Nov 2026 17:10:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 700676061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553007;
	b=kMWP1+BOmakpgBcnTaHVcnPY642H1pulBv/Rb0OwHi2CZN+h8+2aMXlgtM+DGT1iGdd9
	 GTG/OjBHdAZN9NCOsQCWfbBATzW6ajLpmq8kY+LnU+bqskXUANAh7oDJkT8erzfPmqEf2
	 X0/zPRgjACAKqXLREex04C7o5TBuJmiHZS5XzJSfoo1Qg9/AvwsWo/uZeHqTc7Vki9Jnq
	 ykoIlgZXuJrBWYQ2aq/owKOcJ3ljh9eGgg6booz5P4LUS4tIVZo5QAc5+10Q4/jjHy50w
	 nsZxgAMIpjkx0hI1EMU5qclUrWyK0KJaH4e8zSDOuPcb/47VBlGXoFbl0NAbvZht1Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553007;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=AQloZok/n801QhQLAa53Sdgi9A2O1/HqRfN9LZG7sguHi19Uotpne7cxMXoGeHVwHekr
	 tmQDdnzfrHUN0xC6y6QL4J+LYLmJtVKX2R0Da13LuhzNOu+FREvq3v1l645jHSDGMj4pT
	 TZoxYWISbf2aUPR4pvo94t9pcK631LhHs5GbOBUN85/d/m/6HPf+xD1QlTEuqMaOYkXBz
	 TV275am9mGuBDJpgZZtekO79Z1rvb8ElXIsT8Jmzc452/KSU3/HGnEYGJm69ZLip6GPis
	 x5HMp9tSLKXXrF/GQ9P780vtQEHW+MVleNv7edzWMrFVTCc6hrOpt9TAHaWbJLFfDmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553007;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TSl5dmlHDc21elETMrh7WC1wx6J74BvQlKvdB1yyJpfsj9etOgNIttQJj+O7YOyxF
	 iOkPwNCoUvNHNtbJQ9W5ErG8bFyuzLmzY8wC6Mf/8W5nwM1X9APNMpgCgW/0z5IsU4
	 HKX3WnPrPhk4ujZ2LHMnHx0ov+IVzFq0UZSKeUxwAlLEHhW2oOoBglr+OW+t5wqkfd
	 0Tos3njnJrhglyp5uI8+Z6xTkk0hkUbIUNuLKthJVeFsw6KBBMR/X/ncuiROUp3JaX
	 8D63wXn2KrQswsG9lFnNWmb3b7TC9wjjZ3/OPBfxW0CVYQlbdjZwDQ6UDD8OAzw5ui
	 IhA7fP5mA3wZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700676061B;
	Sun,  1 Nov 2026 17:10:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD7A323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C8A640076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObFFIU5hMF77 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:10:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 716154004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553004;
 b=JOeIf6JokUKIfvdUZqpriQklQ/Lz+whjDHg+1JnvkGDQ1dClZMTJfVQ0ivVhWD0mT+r7
 ZP18k63GleoVQzdPIdZ/q5Z1A2q7J7yjAptCiJkXYTTlya1Y153e1pFAaK39G7UhxxSPm
 4CBS0+7qla/RAGH71BJgJV5R9khgut1IFOZXDdMg2LRUlWJrJ7x+ojTgltkyNu/DaogmD
 lU3+fdj4P4Zio4IGgZy7tYZq1VMkAisBAnneAzFhKlFBukTxwHmkCvjMEVAypWawWXw3g
 XPWg13NlKbfsAia9xGiRIU2xCXCPDhlJ0TJI7WzB8MUPK/bWGsbC6zv7jboXbJr4pcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553004;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=bHWJWbVWVhVoIszbT6ZeN1ggvidwhFqaLW0qx6U4IjBVLpAA3wNw7gFhIcr1F130B8wI
 qzFa2Kx+g+6rvASTXdWIzTF3vz25J3d5PfU7eIj9YTxopy23FjgHZ4lv77DQdb7E0kJ71
 jI4yJgjWYQzJsuf7njmc1LbaM862WjmmJVjFPAvR43ArT8mot2loPIWdF9J+7BgqAg7yY
 dkMD9b8TiZrbq/R7y7BF+gJQSnqoCSxGG5Cy/NS3xCDfpGJ0i1vuIsMecVe9ZBzoxoviU
 9nKUfX29V8JpX5IOdEvSAiaNsnJGR5Fr4W8EZv2Xv39hXK3nBPUBcOaXuVUuES60o+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hIjhR5Y7; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 716154004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C43A513F8A9;
 Sun,  1 Nov 2026 18:09:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:09:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:09:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20261031172019.2683287-10-james.hilliard1@gmail.com>
References: <20261031172019.2683287-10-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <335395ee0e7605d25ce6b79ee80faf3a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-jc: bump to version 1.26.2
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
