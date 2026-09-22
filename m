Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EE2C98307
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45BFC4075F;
	Tue, 22 Sep 2026 16:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DTaZbOZT243; Tue, 22 Sep 2026 16:51:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2DAA940763
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790095900;
	b=ilPqdpqrt5I/DR2Qy9mzhqPZIoUUWEb30dGj4W8/88Ev6KGKjGF/37guwTfuqFdcqxFm
	 T8X0NATVv9ryBCOwaVIgK1shqDnAEZMogFHVJD8Sm3etniRvdjYKWkpmik25ECnObvl62
	 aMmr4LtKW0McRCU5OpdqYmNVvmzMTC3WSNAz2QB8ZMVlxtR/GTh5YveK1H0N19dvbcG7+
	 ga1wgoNmcW1CywhmIIlRpINMidHv3n4KavqZZyJcBgnCJQNBNhh/y5fUWwe4P5ivJOweF
	 TPMM1029faOttP/ADYZZuwmDvmw5B2kTIgItlNKRWWUYk//VqDbmS7j6Ro9NounSx2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790095900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VnPlegOEhBdvHQQyr7FJZfZzCqSt4FxJUHTMgeilIU4=;
	b=S0CuI74QKWuVDLcb2WSUO4AyI0Jx9Y3+5rRO4oVvqo28mH4tpHhjyPg/cJhQFrlGLduN
	 H4dSJ1UFFo3z/F9WECuNO/N75aNpWNujDGuKpH9gw8fXyoV8JUWVtKyImIRugQ4sWyKMp
	 z3Rh7TfDvY71gCSUBnZxo/lXqBttQ3CnETJa39LNUw2I/+JGbDCSiske+Sjz69xgEquyG
	 0qkoX4C/b7aVKBvddtYo3prBMysuqfn8J4pAx9Qwc2VHI8jtf8VP/jNx7U0tQsKEk0S1e
	 dd0yCNPYxhng2TwTeKYaxc0Qy1/zGFFafCSLBt1UDoUN3iQunUTeOhQ+9qOF5z8La7w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790095900;
	bh=VnPlegOEhBdvHQQyr7FJZfZzCqSt4FxJUHTMgeilIU4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dcjN6TWaga4ZfigjNfPVVrPKuqT00TBL9iQz9P8ntfuoN7RgAauvHKfGKwDbPFz9L
	 O6F9aYS4DYFR0yhIuWnlksTVlUnuJxIIURrNxbdvNjT5wvvQEp3V7Tf5Wd3BPKid5M
	 k1dmdlSGGqFV9uT8pX8v6pVmd3lZNUef94ZFDTgHEjVEfexGMy/KoTlNNtNGiRriLd
	 ElZZr1gqGML7HtsAj0vdEPhCJkbWbgWZoFIHBpeQZMQPz0yBCPoJXw42w/Nsn0HeDi
	 ZxcL345pA2vauNIS1TQz+oL7QauvdaI/u/FdAcc9NgZEOYVL5mD+24j1kaufEtVI7K
	 I84RNmimIYptw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DAA940763;
	Tue, 22 Sep 2026 16:51:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33ACD352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 154E26067F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97eyBVmhYgGH for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:51:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 12ED4606C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790095898;
 b=LyFZ79mVq9D/Zvg6yvV2TTmyoPEWv7A1f3dLWfRN+4RGsebZfLfC5RaFzbx7S7Jlx9G1
 76FeGNfnSsV8E23MDhz+RbzlsLAz7sGjEcgFMldLkfJNdQ4IjPyQLUYl4m/e6QSWcujsP
 yDmKt5PjkEc+NJ7ecx7l4QJ3eOQEUx0yUyjzAo+Hj9rWYUxbRzLQ7djsd8UnNqkNHgfdl
 C+x4fqzFUVwE8N0ShNXoxVbW7PL9P6t/v2vOqPvvVdHAKKD9VVgC3Y57VYo/5dKfpdYTQ
 e8FphuzzAnWU54AqA84SoIxt2kyIwI8xR1Y/SM8n4ugnb2sn2/kxes69N1rMAzajZxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790095898;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=FP1DuZ+X+7ImqjjzqOXJWnnfOjlDsp0tzJ5fyPOPtBY=;
 b=B2z3zTKtEZ9umIBv8aWuRq7OxmzKXDZeALtz11MKXmU6o2qxBel+Zh/V1kSKcda9ehv/
 9SeFMJXAHVWYsNDFwdkHe5rloQWtXgaSkQ6JZP6tyE3uvjAqy/tS0aVrnys556lGs6qsP
 tQ7ZwNgK8llFXrRq0lrezUNAKj5Q0gdafaMeB/vPtW5D5IIPkZnEIxMDkP4z3ykSeDinQ
 CWDXts111GnnwUOgBK2ou6xTujHWahmAG3GPyvxMM/4N0q6g/4I+9aachMHk5x4DAurnC
 +9vp1qU53/kTJJvSWe3dnqeLhz8CGPxUEcz0+fDGaVMa+RT+ebzerXczWSKICOz4n0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JHAZm4ao; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12ED4606C1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:51:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 308AB13F88F;
 Tue, 22 Sep 2026 18:51:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 18:51:34 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 18:51:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260921204453.2971019-1-bernd@kuhls.net>
References: <20260921204453.2971019-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <ec38a9fa5ea41cddf4a1381211a62c9d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/utfcpp: bump version to 4.2.1
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

On 21/09/2026 22:44, Bernd Kuhls wrote:
> https://github.com/nemtrif/utfcpp/releases/tag/v4.2.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
