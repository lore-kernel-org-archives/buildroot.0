Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EE0C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 19:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAEC460752;
	Mon, 21 Sep 2026 19:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrfbz-rXyNHv; Mon, 21 Sep 2026 19:20:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C9D0360740
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790018412;
	b=P7aSLh1ybx1WJEod0N7Z+AsDPqUoPRaLq6vx24DjGGgcOU/CreAJvk3BRMhTDM4AZ3T3
	 a2N4HSSP9TCL60ol9VmIHr/QtIUhAx6GidSRPebStFTGy/yC0cHCOyJTjSeNuHl+EebZb
	 MBeFyvpGI3Wzt78O6nCtiSu2/oGLqfEADvK4xzMIYzE6rOgarTS072wMFrC43umLiKwje
	 KyWeoNJ3deev3u95tuel0BbaqV8ME3qmIVx+aT42TzJcJKCLVmvM8HWhCaso4BDfKooBY
	 LJCNKrsISUicNaiQnqmQrySL7e/tHsO9uWTMphDY4TLOOSNZ5m15ODui8lJgTBqMx9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790018412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SV0mtTuq1KXrvPHfQyJ8XcvLxOsPOXi+0Jjon+Ixj+c=;
	b=E/MrxW12evS+QBsPfNbRZYVrJ3VUmXQwsGBC6yEBka9hYdbUKM3rCJc9h40zZb5Hs49d
	 H0GCIe5n4MHdS2JB5sokehqN0bFwbmG9ugjztUa2rz8T54m/cq3Yaw4IkFKHQTlBtcbqw
	 VQjwHcTXK+TaLNXTrNJd0coLqG3J493S1R7eMAkeiYFJdlF9aYj41zlcet7dJcuwZjZuN
	 IJQ8+IWdspmKZ2UT51Z4KeY/uWhIfMc+2fjcDfaP4Qz6s9RcrNLYMmee9RH2fhKNE1VSF
	 Q9llbKZqoYGcIblATr7VJJpjlbJxDgc5cLjOH9c4q8SbsfROW2omNEI/LuzGcsUFsYQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790018412;
	bh=SV0mtTuq1KXrvPHfQyJ8XcvLxOsPOXi+0Jjon+Ixj+c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mPnqxTXju3A61xEdv5gZFZcKGiglfUJKLVUoohAFC8K7Cfc+WtnaCRUxEQLq/pNKN
	 Jgi6laxwErNTk52RcoEhxXcX0z+ba4ujoVzY0TrEN1t5c0JVSNd2hsc21geM1i5pFC
	 TF0E08uAOdikhb8xPd8+xExfhpyma1TkvfE1mpRQZJqIFIF9Zv5K3ywwTgw/0znbU/
	 Pef1jnADA9ts619qzVJzf9vHRVx0dJsZxwrAzpKV8uJ8BcupNeh4A0ywrCoLOnKZeU
	 u8sGn+Qp6DeGvOs+dcS2W8GW4V5Ds/IqdQK5rBA4yGnWMoH65te1AS/87NkSrnRRza
	 pARyDq+CZIsbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D0360740;
	Mon, 21 Sep 2026 19:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 779E12D4
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 19:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 694CA40A20
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 19:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rkPbyysTmrb for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 19:20:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2CAE44085C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790018410;
 b=E3ATHScbEZNPfLLVgyYA5aQdHGjf6S46/dlAsxOO5NQv+3JgFiuVKuPGSdKzT7RcynxA
 EnjH4CIlRE29+K8ay9oCtisPlbqPCdXNLwqx7hAH3R9E9gKtwTppRy741/+lZvbvp2hQB
 EOmpg5UYxn4DtjlxnHDdX/JkweseoEAD1Nvuuq5BeeYELwIDNc83Dj0zyInw/qrh34nBi
 3pBdRCTD8Y52cDrsdvL70MhVFfl86D2/0PmAQTd0fTDKMkWbTsLDf/Jm5yEL3rOKoaMY8
 9G3BdRXOiIGfbnJeXH8Tr+wXkm09QYntqypn3LoinD2liiEQH7vm6EZDn7O6epMZvMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790018410;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=b3asMVLGPOz2Mm/10LNxZKLL8VCfqYP9djUnjR/HSrQ=;
 b=BzAfFoFFZVB2oFMcF4k/eDNZ8M8h66jSmAy0CgpLzIQnsQAYYQiY6btJSdB+S68cRx2/
 W2VSJRjq7nrEI1YkIqziYO2hslFHz6GLOqeqOZrVrwgtE6ay3wNE2m5mtgmiEB3WdYYW7
 hLX6cIc//BYLCEkf9Qzri1w2qGeDavrtaDjdyZx7eEb22Co9sbtW+7L2U7BlhDhQjhSpj
 Bnr/kZWM6PDfV3gxh2uIm6kLm4drhOFZ7iOsAx5OAC8VHCwbibxkYN4m4ej2nACBP0I0c
 2/U0fdixOI4Hnd6mlT6bDlWBjgAw/ueTWkfX6k5gDq4WhOsKxhMdr3nrn4QsFyJOwKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GKdhQ9gH; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CAE44085C
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 19:20:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9151360136;
 Mon, 21 Sep 2026 21:20:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Sep 2026 21:20:05 +0200
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 21:20:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260920171218.242013-1-bernd@kuhls.net>
References: <20260920171218.242013-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <f2c91555dff853b9f8beb6fdd79f9c93@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 23.1.1
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

On 20/09/2026 19:12, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-23-1-1-released/91760
> https://discourse.llvm.org/t/llvm-23-1-0-released/91654
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
