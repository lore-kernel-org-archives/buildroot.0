Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358AB606A327
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WKV80esw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF7F60AA5;
	Sat, 24 Oct 2026 10:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIkupVJFHyQI; Sat, 24 Oct 2026 10:35:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0668B60A95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838106;
	b=BaobBJY6DAcs8QQtjr+Dd4sStyyg80sd4kG8rZrHk1NhmqYy/lxpMisbH0mRFz3ZNAmi
	 DvpM7hPFOLoAfarHHq7CxY2FyG81TIj7wpwHLWREFYqXV1vMHqWi6erXODq7ZzRvfBhCL
	 njOAPi76pnP4pI54DQ2fPbrmVQ2MHop7DSAnkHXaZR4eAlNt7culan5Px/IAcVYw+yA77
	 /X7LWwKraO2Sxz2SVG/Xd/XjPm7R/rU03n2UM8WM4+lS9rgpBRGSUfeHjv5APTAetAaCf
	 ekbsmjhp1EaWC2tFtc1FCM6xyAOtjCpWMzmqKGQnVX+6X8wZllSG9YCOYlNKP6LE1MQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838106;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=mGUhx0Fr6G85lLlx5WqCV67rpwdaXVhGJA+5f96eMrsMfpcQBI460e2eZEAm95tgnNRC
	 dgVIF2PnBJ9kWb0SQyGNBkXs2Ed//uHRiG3TtHlAd92V+9ccyCvswPthCQxpSb6L9w2J+
	 eB4SCNpnGIs1v1gvZi//wwx+QoQn02kYJ9BsQ0NEYn/4hGHgsfYMknGvJrnmz4zojkdQb
	 VCiOKMeXUOy/H07pM/1KmZ9J4XaropNeUdFlg+RqsV/yPBc5EZRaSe9iozqsxaCc0/vtA
	 JktJmt3w8nQoGkN+377iQEyatxBHrZZneR+nYnkUavTrecFf0lq1uirCoo1DKnJ3qaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838106;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WKV80eswEpch3YgKAR5cEFjfTyWfC/aJgPzJevtnNInSFNNOtR2Etsa6G94ankFDw
	 Al9b0cAmvMtVrcu4lhaB9rqj1ikm6rz9P3bQ5x+VLMHPyy6PESLbCkdEQ/hbSWCXlz
	 L02c0c5MD+20geO7yPosjKSzcYYRKgVWlskZwJKRxldf38AtPb/KO79T/Xs28FVluv
	 A5ExQZtdpmj8nI/+EepCZNtpuuJhpHAcBknxEyWXlfIRMpgcP8KsGgUjHqDC6Qf00l
	 4XvEalQhzB8eIDm7O2jdiaRegD/o53HQdbf6GSHKevPFffUnOyH/APqop1ly4a4w17
	 uduVMsFU71UrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0668B60A95;
	Sat, 24 Oct 2026 10:35:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D376380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EFA440A80
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gqrs2cjWsGI for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:35:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9273C409C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792838103;
 b=RI6lzpa5GyVl+Cs+H8mQNFhhJtUwmFjYroT4DnMo+tuy6gJhIiUycilVKF9aIhnlEMDq
 urmziCoOL4xntQtntB8duiKEqbnB2XX+hrX7bXV22WfpH5YhBMPRamrEF9tgPV9mO3rZb
 MKJZlcGPoPBP8CGXTAzU/bEOK1EH0X3OYPPYAzRPctqpIWxDJmTrXAfkpnlKwcDdLvhV2
 vuJ537NoqhCm77cxnV31/lTAJ1uCeYIbp0WkIAafYY8DbSnhCx2aGf1l9MDi7AJoOkQ6y
 f8jke250gdSAjqf2iFVjfIAEjs0I/V81GyAYZjNwPIkHJGB4lmoJNcwn+IkShDx577Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792838103;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=FnFl8O5Aj6sr5ilYDZxc583qituliTaQeRSAcyw8hXTLOHub8usgCl0kIZUvxx2sGSBd
 HpFUm54yd/BfR2UXTlGQme/oqfmLTBmTqfrnA//+blhbAUdeOQVXDOpiRxoeToRUEKEQ+
 QFEXHwam0+7Uc4y+YAW4j01rr7joydYImBL5Lc4BHx9q+8qSdxSXMG91DJTtFjFc+j1pi
 8qMnuITkLoZ+ILiUVTDdh6P3UWEb3rwvj0cY2CXgtsnPXtecoWGnDZ4OHNLM4d3LZWy6i
 WqoBKW5m8wODfombZhLbuqtUmrHajaubfZ6QWDm1dCLi7x44vRml/vaIt/JIlHdKw9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="fb/gc7Dz"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9273C409C8
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:35:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C2D43780333;
 Sat, 24 Oct 2026 12:34:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 12:34:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 12:34:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20261023181818.920329-17-james.hilliard1@gmail.com>
References: <20261023181818.920329-17-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <8f351802d238b6b2e9a471673e050bc9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 version 2.16.1
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
