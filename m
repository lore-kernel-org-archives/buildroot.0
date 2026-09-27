Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414F4C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 088EB6061D;
	Sun, 27 Sep 2026 10:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC_Eg_tk1hhC; Sun, 27 Sep 2026 10:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0BA2B6062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790503709;
	b=JC63mJ8qJZr02MKcj2LWEao0U7v93RhuSFx05xvn5oK8xE5GQkVuPZYSg/eMm822NC8t
	 B4BjukCGIVtJAY4V2f0SS+Becmrbi6dERXxDIT+wxciUzMhIGxX5j5yZhMS8a9X982fF9
	 5OcjSUsb8i/7M0bKkhgMP5w6g0ffBjoebSHxiBMtbhHUnqrK8MyPdkYJdCLETMtFeta7k
	 ORiO5+nxlV5BiZBS+o73gXejm1wU8u3JLEjH0OazHOlJn3+CCGk4jcCrQcWuImeTwFvgK
	 ukVSaWqvsuXYRB/b6/QlveVfQ964AzpuVxfkgHanS6ZDyBrRA0w2ppOEdkgdAsHFjlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790503709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aka8UIpxP5vqD77Ad4G8GMroepiN/W9io4ykQslazuk=;
	b=N3Qpmbqy/YK+3B2OqOJrk/6IJPOapQGriT85pr8CcIqYScwcYuWC4iv0w5MTDMIjo/oV
	 0LUWtm1w805KeZE7V1siEtcnWTfOYG+V9jUWSsWkK28RWalOU7f0+PwTWYf/LFfdvZCOy
	 HtW1edUOfhLW2UYP1z9GiP3Dsp/47fC2hNikTzzvtUNdB1uZJ9D85MhoQ1CJlafdBOHWD
	 iJLvR5PSLSOdUMMBA3rtmNVbyq5v+Ntzpmu/5zawX0rhP2WKgGNhehckBTC7USYUxT05A
	 P8ejt7vwg7ycZkL5zCR7ZKap7vqhdFwno8GSS57ZJe09Z1uuV5J2ZNOXiiyzVzfXnlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790503709;
	bh=aka8UIpxP5vqD77Ad4G8GMroepiN/W9io4ykQslazuk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DXV7HFEhW1C53dcp+1nyIIak7IX+jQYH6x0CqttKAInxUV0QTDobGvd45cNImmO9J
	 cXQNx3/kXZ50ATOUKWlFM1hiWqu/E4L9Gun/CX72z1cjKtJCb3d3SvBpXI3N9DicQl
	 jTHVCgBtDVxRDb4Hqn1vu/9laEFJqcSnbfMgVS/hFqii/u2w15Ua9SjhORaMk4v7PU
	 7lymUh7o6/W48zOsB0DJKXj/SIDXZoM0RQieFKm8nGPFYMxfPvT4XAJi+lJ+lPkIjM
	 0tAdm5Cy0u7+3kSML/0M6HgTRUx2jlxQDz87zGMTPFZzpvm6U9He4eGaFL1KV42cPW
	 kndoDrXsHQKbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA2B6062C;
	Sun, 27 Sep 2026 10:08:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B068024E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A29C840786
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U741b04aWNlv for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2471640659
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790503706;
 b=Ayk3xaNJbGrOdWE7R72ICIjA5sN8cinPFYNDZIwORv6ccXSSROWuyq1hylE3GV72aUxo
 PTbrXArhxXssfF6S9fqX1o5LtaGUk3F98lBAKE5ORVQasy+oLmw1qFw6Ck7ccnlLHZOi+
 rCFq+cIvE8HtaNMj9m+oucKxl6R5B5WNrw6XabeyBtqW7p9Yc2ah29DQ1vRrPjXb49oAo
 U4Tw7+sb0t9SLNmAK4VAqscX1T4eS0FoDF/aRe6WoCD1k7s99zON8ORedQUyCCzIveOMG
 PVfA7IRYBVc5qmgS0LR00nKfolwVG6exUk0EU9xbG+b5x6k835Dxv3m6DgFpYJBG3Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790503706;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=l1NvQGFF8CjwPSZ8u2CifAyxoN015FQqnYcJzZliX0s=;
 b=df7Dpny7cbguBz4aDlsckewyW+emyx3RoIrOk9d0VP+eU9QNmZxgscQGyAKtHY5MHSBa
 zHLSH8GBQAm4+YLjrNbyNjutsxetI8p9Ki2bW12dG5ey6OQC8IMF5a0Zj75pui1zD33f+
 8y1dGjwmP+cCTohAAlbOVf58O98wx+cT6jyFAKzZp2RbUabPnz9JlqhPlb+tHUFG47kqB
 JxmeAr9Fv/Pr6mt86xihCcprGZrP44JGi3cDpSx8nrGj5e/IEa12sQSBcOuPc02NILHe6
 rJBVl98Uvp4DyZhNgT0J3NG3HnHXdJKzxgWizisPVVujASYkua4Oh7XyXVOz2hi9SPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RqlWoUVU; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2471640659
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 138002003A4;
 Sun, 27 Sep 2026 12:08:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Sep 2026 12:08:21 +0200
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 12:08:21 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260926200409.2095216-1-ps.report@gmx.net>
References: <20260926200409.2095216-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <64fc3bba69f0d16fe88f50d056573a78@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1 1/3] package/libnftnl: bump version to
 1.3.2
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

On 26/09/2026 22:04, Peter Seiderer via buildroot wrote:
> - bump version to 1.3.2 (for details see [1])
> - change sha256 URL to https
> - update coreteam gpg key URL to newer key (used since libnftnl-1.2.9)
> 
> [1] https://git.netfilter.org/libnftnl/log/?h=libnftnl-1.3.2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
