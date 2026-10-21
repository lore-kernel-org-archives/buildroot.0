Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F90606A320
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L6PaJ1ke
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B4140E72;
	Wed, 21 Oct 2026 21:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0o__ye0BImU; Wed, 21 Oct 2026 21:17:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D23C40E62
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617467;
	b=ZoIddaQzIAmVdo6O7kvUJu4zDpEIubrmtr/6F9H55FexwjLQ5IFcDwes5BNrDKHOD1/U
	 yaNU86u17+/f+I/2qhhzUMVYvpfLZPLsDbPrdqK857mwHsv8Nw/Hn7dbbl7OZ/BQ58ppj
	 /4xuvS1/7r93v6QAoTDLnslhws6wd3T4rX7EAl76imPg7qtndgVULwks2Iyy0Gpgv6wb1
	 iLZTwhnHQZCS8oq2GQlAJqcc0YcLB9zFwisYBbv4WM77IUVF8plNXVMTSf8IG9uO1gbX+
	 B74/7LoSxl0V+JZeqgRN5J0kWeVVPUA9aFlSWOQ59CSCT9/+rxBtUPvaiqEQNIj+mag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CnS4i4frp5whpbOVnODHP0vqYnLovyArNzY8xMqb2pI=;
	b=o/tjsErTfk0e8FvNZKJr2W3QbAY3XmZzlSNqcWRqDnxmRYNBLTOmVKZgYSzfkprF/bvN
	 H8V8mZvkVdFc6RtgiBc4IvlhNdlu0XATjs9SWRsrw9B8Nxvocs8c3H1AOKuf1KDQL9OmW
	 jqqNwR5AK3ZuIN/o7jVdAQe9rrOVkJOVrumtDoRL+NcPgiDmjKgoexqGe0zZl5CZRjVsy
	 fcVSdR/Dtq1YWbMcvOu2WNa2SuHxypuSkFa793/uJbdgvX4xIXxVrWSNmh3Te8aykAhYk
	 sYs7Dy6brnljRRNXESPFh/YYpWhBZUVjYIFUadrtdXJn6aAatKgMm9oYChHnL7VLryQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617467;
	bh=CnS4i4frp5whpbOVnODHP0vqYnLovyArNzY8xMqb2pI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L6PaJ1kePNkZvTxfi7rXSbGxw/qT3aYWLo9ikKq+k+rdlgKcfkeERt2+aKgIQLBXx
	 XBRfjPtikyv6GGjAkkNC34/UWnpYyPiz+wg6I6VyX94bZ/2UpE1DqxZA+xASmimw8P
	 tX2ovNpkD4Ldehqp6f2JKKFE3HLa0Y7HAMlR4GkEa47I4CU7PDSYprFEz7n9T8DwWK
	 zRJEw7C5EzQsgiS6kbh3+wi+HhuEZDo5yxu2EnjACGnY/2dyza/CUr50C+jbkykxOI
	 xlEkcVE/ZmOrROv7Ix7UEcvOdjPe6KE8FkoRZ/NAzeVGZM0nMTkkuks/Xiyhr4NHZ6
	 IkhGKW2c7Q1jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D23C40E62;
	Wed, 21 Oct 2026 21:17:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C0A595C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99A9A613D6
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Usyhxj_E9Hy4 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:17:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 239C360A3B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617464;
 b=TIUsT7F5PIuwX9RMd5qMMj9Tjvu/zcK2HImoIWAmr3kjm6KrNLmtF5pnHuAPWXDFK3d8
 tl1TuwIeBciYY4oeXwYz1OXN+tsLbbvjTAkHAlcrAj4mL3ThITtxxvPplp32U22dJLIOO
 F1YFdE1Mb/UMscNBU7IN53DFf/pKdgY3NixNFgQnPPi97w8/g4933WEbDaMP6z2Ruiugh
 hs4OSmOVdGav35zawipQ0xBsBM62ulejisYccputqTFbeGIODlDLuzMdMFCWU5HE0Z6WQ
 E/GxlzYoshH3ZVmsxaqpPRSm9iP2qpF09UHPL6hSOTno6jBaP0LB6hUP3x38knFyA5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617464;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=dLHSIE/OnP+MqZmqWBb5TRlsxBZCx9DrEWxSMBeMZqo=;
 b=HYkZwqEEf97ZeT8oAqRPMyJXmPkuSOhHmMHGYUy61y679nt8kLhvet+hkmNm70oq0j7N
 6aS/41xhs7eCYhv5RVliWAW3af3+2I+x6ohSNQMBTwW7gG85154DKxvrI9MFEPz/qBiLH
 VlOhhNvCuSAub6fqv0Zlz9zFXi1HnGAqLsgC46VOeq+SvK2cuzwzkGfgdBph16uKVw1V1
 ee1ID84smTccwG470vmeUBIpMD7m96CeLuXXCe0yf38m1hQhy0VxGuSnS2xWId0cThXJI
 LNOM7s8/YMI1v1c8GdusOZY7tkrbOQnzBZ5I08CNq7Qcu5di9cMQJP2BiKIAhaZ8PLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2H23gCsZ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 239C360A3B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:17:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 13C54C5CD6A;
 Wed, 21 Oct 2026 21:18:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECDFD606E3;
 Wed, 21 Oct 2026 21:17:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 96EE910328D6E; 
 Wed, 21 Oct 2026 23:17:38 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:17:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>
Message-ID: <atkr5cxe9AL1VtN3@windsurf>
References: <20260719125334.1772882-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260719125334.1772882-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/libepoxy: needs dynamic library
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Jul 19, 2026 at 02:53:33PM +0200, Bernd Kuhls wrote:
> Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
> dependencies to gl/egl which revealed that libepoxy needs a toolchain
> with dynamic library:
> 
> ../src/dispatch_common.c:166:10: fatal error: dlfcn.h:
>  No such file or directory
>   166 | #include <dlfcn.h>
> 
> This patch disables static builds and propagates reverse dependencies.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9d5/9d56cb52eb57df61184e26cea9604f1521d135f4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
