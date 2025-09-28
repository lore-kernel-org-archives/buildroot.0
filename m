Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261E0CAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 07:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A19E9404E5;
	Sun, 28 Sep 2025 07:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlIy2c5Ch5nT; Sun, 28 Sep 2025 07:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DD840568
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DD840568;
	Sun, 28 Sep 2025 07:00:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AF93197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 07:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E527E403FF
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 07:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqSd7ygNUWGe for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 07:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.14;
 helo=send175.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F0D1404E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0D1404E5
Received: from send175.i.mail.ru (send175.i.mail.ru [95.163.59.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F0D1404E5
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 07:00:22 +0000 (UTC)
Received: by exim-smtp-dbfdf9968-mhdx9 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1v2lOM-0000000023i-26fS; Sun, 28 Sep 2025 10:00:18 +0300
Message-ID: <081f3f72-0f7c-4ee0-984e-9dfd0569d056@inbox.ru>
Date: Sun, 28 Sep 2025 10:00:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250927064542.174906-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250927064542.174906-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD91C726AF9233A4C6F9276612EBFB12436B195FE867EC8DC96182A05F53808504027D1F7C9731C64D73DE06ABAFEAF67051B202570944A061428D10A0042651F363A6C2E7F7D92FB3D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375660A9FEF86FC565EFA9C0A69F40A69E9C351790F31EC1466DDCFF6D28846EF927D8EEF46B7454FC60B9742502CCDD46D0DA6C7FFFE744CA7FBF6B57BC7E64490618DEB871D839B73339E8FC8737B5C22498BFD6B1B042489ACCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C0D75EB778CE7D8A0C68655334FD4449CB33AC447995A7AD18262FEC7FBD7D1F5BD5E8D9A59859A8B66F6A3E018CF4DC80089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A54B87358A757574B25002B1117B3ED6966CCB0D84A64209341E49B01306B5E3AD823CB91A9FED034534781492E4B8EEAD09F854029C6BD0DABDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFEE51F30F6370E987DE5CD509BC81313CCA77EFB788DAB5E601CB5D3890175738DB4AB58792EC0ECD2736D65D92D5DFFE675A4C84DA81B6767955DEE25E5EFB7B56EDFE3264153C7111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVbhRSvDWWPO6Q3H38fTUih8=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD235B5644BEFE999791CADB2F1BEB113EE266D0E28DAA5913390DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=J2mHtVrdFYgFHdtlzz7YgI2cB302ezmQ206N/1E/b08=; t=1759042823; x=1759132823; 
 b=ha96YvmBYXfVzvSf+gJmuLNYZW7zPIF/c9lXipX+zB1xQg9aTCnZdHjTCTg6t0a/w95/HLo4Tp8
 71IYN0q3l/M2lmvwvpCKqUCs4e6Hn3yfIjk5REkPIutY0/rpBVvf9ANJfsOMEzMHd72hsVNlpLJAY
 Y5IdvRi1uIaoJOtrV+J36VpSBuk8H3bJlL+ddiapZQByjoZzOPzMZNMUAQJLCjyRV48KQIfcDtCMi
 8OElxaODDF0oqBcDUoVem9rm85uGVjeoBu22/sWUWUMzh19jGfFrUrjR+5wcEMjHZgjC9mtixzMXu
 9p0BMjxybX1cTjHTT5dWbfsN64RRunwFz1XQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ha96YvmB
X-Mailman-Original-Authentication-Results: exim-smtp-dbfdf9968-mhdx9; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.21.4
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

27.09.2025 09:45, Scott Fan wrote:
> Release notes: https://github.com/timescale/timescaledb/blob/2.21.4/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
