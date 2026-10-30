Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6898C606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kB++WjD0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4702040C61;
	Fri, 30 Oct 2026 15:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H2DwPyJ28AC; Fri, 30 Oct 2026 15:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 514C840C38
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374042;
	b=rfRaXcMWDsYmW3BUer3jsBDwFfJT2S1+hBn34P+eux969/P4etaw7R4QOGixb4a6JnKc
	 nrjpFIWR//9QGufU0HT4tUhdmkfexinBbqeLkbGQUWQopXxhM3i1DiZMUkcQirmyUG9KX
	 jqJ4Wscbdxmk5XY0oJiA//X4xDegtiztUkz5cAXsxCr6hVgDdima1pudHf2qrWJxt4N8o
	 0QJzrDm48a7wXEVy8HGErcWenZ7rXZe9pXqe/h67oDrFZxPXjXrcZSvYHEgn2D7MQoG/l
	 3ckfses2x077ito+My2ucnagRWwRJDds//Ms1EvqzjQAWk1vRlCfB1tK5a4Kq1yeeww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=te1L53bPDnEvkeNFD2KtV/Dy06r0/RPBUxrOVv3vp08=;
	b=W/esxDMVFwdCEFu3k2Ix8hY+VcjxOEDCqtea6e8HkbBR5HLaJ1fxKza+wV0oR4C4W71b
	 30w5V7bj0OXdzQZeYT1publQON7ydmqt5+wvQ9nLs6pMmtQzSzO6iF8UG5szIDY4Pz25d
	 0rDDWd8Dkq5Z84juSQZL41GqRmdHV95y+VEUmmBrS5O5mNmWb49BUjII3IGKzt1WsfMBP
	 BCPZhnE4QYZqJlFrhPexlrBPvLB5ompiJhYHSb1DnQksIL2poxy6PFARfqQ0Jvcd7GPIY
	 5phZLhATgRBrrIg9R7pHgvlC52cr6EjlrEBq/c54D1h+FHOdLSVnWNCKiIAKtjiPS4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374042;
	bh=te1L53bPDnEvkeNFD2KtV/Dy06r0/RPBUxrOVv3vp08=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kB++WjD0iZP7nQ26a6nqPyr6Lhc7Iwf0rtXRByCPgAjd1jiVuNCw+AminYBCmLXOV
	 7NPUF+1BpFQGwCiFxn8C36X758/wvMNJfLLrH1fkCkFODtwKkgPT8GOx+GTud9oHfS
	 LBXGXT05YliyiJMCueB6swIIiESgfmMpqKub4V0YKebBjIesfDyYejCRjIErOvlQqr
	 QLqAPTkTnC8+f3OCpEhUMhT4EaOKwzeY07TpmV8Z1Jo5jbY7lAkym92Zb5W7MKQqr7
	 xrHqoDbp4CEmanNpP6wlZdZnf+xrW5d5ruXbirphW6i7uCNcgwGlpJfhK7sklounUx
	 aIUTsJAeuLgxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 514C840C38;
	Fri, 30 Oct 2026 15:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9D63AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70F4940530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2fyTJiNysYt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 56EF440211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374018;
 b=tdQUAyLwU0Fz737RT9t5ryI5UAeqR56AVWU3StdnimcG5lllVhstbhsfQjPNeIJHRMbZ
 mn0fvUoI4/hcv0lajoFxtqjehUDPEkzgMARKcWPqdh4uwGR2z+wTgC7LZaB/+JaHZya3W
 gff9oxWFAmBaeQqI+BT+aM94VdZ5ZgvzjHQAQ0Kmh/xcaZXQE++2+kZLRFxEXLXgzQeX6
 o5LEYULhdlyQMy1bAYGyYUGTHMU7UnGLwL79jhWr46S/XQ7SF5SYkmy8X7rqXGiRkuXSq
 mP2CQVWLm74J/k2l1J7gRjA+Y8IYur/YJS+RWKBg6703dxScWp8+ytcNkJX+dh2ovDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374018;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=u7YBTIdYNqEqoaHQM34RL0viyr+09Il/pA1wE+b6wWQ=;
 b=dkwmAQkqZUKqeJsl/slGsNbeW9ohsUT2vKRzlAeJXbqXjOz3Palvnh9RD8ZoIxgwT9Fs
 joTW17RB6aanWKB/Aj5TwfjJX2m4VeCd04cnNBpZLCe73i/55pkLfhCUMq4gRqHDT3DFf
 RrxfhCDosbTJGgj216xDg/Rrmd2PVg0/0i0R5SR5Hu44LRaIU6RxjpD5BIKBTlQ87nteM
 xpUAX7kN3tY5IoL4+gIkDswFW2E5bCDv5l7uBm7YmxSO7MKWPlp7Yke3i7IN0qEaJGXXm
 RiqC6C01EL439UAUzvLLXgxNo7/cMy28tB3le0WP3luVekAtfRC0FZ5S2w8Fh+PraKA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TFYVSL28; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56EF440211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so1171877f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374016; x=1793978816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u7YBTIdYNqEqoaHQM34RL0viyr+09Il/pA1wE+b6wWQ=;
 b=gXDj58a9cQn1FqmT9zuPA9eH1syRtcE0+FXF8X8JbZwclw1y7aSmuVwPQkOF4CH7e9
 9ZcO9m3/r3DcCbKe3vm1XvdqYmBqDss/AUrLo33TNsgST4uIPKSZ5fpXJ0987odI4dYP
 Rbx56liqDgVI+j1md5yg9QUvQ8LCtBqNfaQpuL+s65JofU1jls5C3k5qsOGr6Eb6L5bh
 vW5vKP/QnGEXhpk8uuPAhKzH6GNtwQRwcXP2ElnXiwMUClN4Qjzm8oANIiOdTKqecsr7
 aQQf46T0q1hW+kqX1fmqy1Sme1NYOITMnJCzHtaqKvDw2XUkihHltmit/lu4QNR/u/Dn
 Y1Qg==
X-Gm-Message-State: AFq9FYL+SAd/wanQ4nVGnzmEWnDFQ267yv9D7/RViHJHBq/TOYREZ/Kx
 92AFgVGCxNp/4jrOY49DqGm1Dwuth8mGD3nRTlSzstaaHUWLkdDjIFQf3nbImb+YBrx00TxlVpV
 tiI5b1L0=
X-Gm-Gg: AYBFou3LJIybEHYPo69xNDjyDTuho0jrBm1sonZQGw2tsMi+68J1DXR6kzx4F6crk9C
 M+CJRkLD/xnA6RUEzxFFvD56q0wcbJMU/XrvJ2qNtWig8O7u7586zYtgBHQt+B0wfrfp1Fhk2nI
 EqJ5pw4BbNourY2ecRZnLogL4WcRkAqi5TnyjPsiny83PlQJBcfrKR0Y8SVZNd2oxjzCXlt0fJD
 HVB90F5zgLvYA0T3bfWzT0qe4FlWlKgHKChGe4KsOYGxVY12sXYGxyj5bCREL2RWCWDdKgYO3MG
 6xeQ3uTr3av0wsHQkq5h6Y1+yrXERoDealOtROgEGJqyv+cMgYMuu9lT6DKbP303MwO98tWcVmb
 jq+gLvZjH8AaizxA4yJv/tlzOf0YbjqW5XKrKbgkXfRcRH+uR8J+H4XPTIFuYZoNEjRL+ZPZHAj
 8rgmSavcNueGjqceKu/eISkMF69Tz9KBoP8oXuEMiqnf9U+PtqE5K0jbZMujCu4pSJAJQAa19ua
 VdYkCfItzrgAHzxyhu5OBY4vxfCyFmeE7x7M/U3ZO8zk5KM7pts0KQB/KkXaWg4WFO/As9pj0tr
 ILXk+iHUIyLJYo3eRKSaeBdxF7uOc0O1eDXo+sbu5KhE9aoWtORe0MNm2IQprB2x5Fc1hkMc
X-Received: by 2002:a05:6000:1449:b0:48e:6c28:6051 with SMTP id
 ffacd0b85a97d-48e6c28619emr9859180f8f.19.1793374016259; 
 Fri, 30 Oct 2026 08:26:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d425sm3979175f8f.1.2026.10.30.08.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:55 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:53 +0100
Message-ID: <20261030152655.1906450-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019193044.900785-2-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] utils/genrandconfig: do not select
 fmlib or fmc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The fmlib package contains kernel modules that can only build with
> NXP-provided kernel sources, as they need the fm_ioctls.h header which
> doesn't exist upstream. Therefore, there is absolutely no chance for
> fmlib to build in our autobuilders as they will always build upstream
> Linux kernel source code.
> 
> This commit updates genrandconfig to ensure that we don't generate a
> configuration that includes fmlib. This requires also disabling fmc,
> which selects fmlib.
> 
> Fixes: https://autobuild.buildroot.net/results/7fb2b2808c4f122e08ca217f34c4d56a2b1bfcc0/
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/genrandconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 597602f257..5cea529354 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -502,6 +502,12 @@ async def fixup_config(sysinfo, configfile):
>          if optstr in configlines:
>              configlines.remove(optstr)
>  
> +    # fmlib and fmc cannot build without NXP-provided kernel sources
> +    for opt in ["FMLIB", "FMC"]:
> +        optstr = 'BR2_PACKAGE_%s=y\n' % opt
> +        if optstr in configlines:
> +            configlines.remove(optstr)
> +
>      with open(configfile, "w+") as configf:
>          configf.writelines(configlines)
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
