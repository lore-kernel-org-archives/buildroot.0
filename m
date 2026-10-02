Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223A9CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F150F40DC6;
	Fri,  2 Oct 2026 19:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7arZSdwNLcOU; Fri,  2 Oct 2026 19:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 27B7240B99
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969332;
	b=LNuXt4NuDLiXsARDsznajAXgwqRhKfIYcY5TDBUdi9PxS9kocIK1WJDIEubRwTdB08HO
	 wO2Umn9IGdjPbq5QVktdR8BxAEsT4hdYaho0x7kRYpiwfKHuiUSnaTIIMLRpW19/e5SDM
	 M4fNGNbxahk6UeG7MLdsVosaP6g2wTspJl7c5slB+ajbsDZqCKe63uVyrnOQPr+BlpSG/
	 LkRQ7jxQr7hgGAEDq5Ejlbf2spMe+b9V++aTZHISjkdE0tgGcioELD3o+yB7T49FUXY1J
	 ZLu/GMXxYjgEujO6Jkz0p0CzflUgZ+LUNb0zKn2eST0IuBhMMXyjr2pUB0Be40fcrow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3mz5r5caOsXNqd3UPV5NyUqKp94MfxA2BCseOz/9buI=;
	b=Mr2hBYNja4h43GafaIBKx6zoOT+Autv8RLaGuRVhAYcw6KMdAia4U5RSITgbc/W/Qqqt
	 2Uk0CHP2fLuazmrIrYzLQD67EJJL4bvtF4sE9suyvoy9/HteRWqlhUV8ED9kUtvpEDt3p
	 +7SzcHU/OVHG0dRw3lvTJxp8U2nP91renZsdRjr3V/7yN5FGo5e0y3jxm+/RNNxxz5AjS
	 xgN+vGOFiUXnTTNQlNwFr6xQ9e8Bt3PR58s/Hs4DfQB/GogVOJLq2n262J4MH4E8ueRJ8
	 gHKkuXUpON5Jw61ribLXeUegfz+l1yg6NE3jxybntdehjVhV0PXdJB5kEcE6jxmN1Fw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969332;
	bh=3mz5r5caOsXNqd3UPV5NyUqKp94MfxA2BCseOz/9buI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tlt+BNFQAh7pxncloRrc0V18PoqA0nmnZUQnHXQmJCfIGbc33BDQWLAPWW9Z/PhTG
	 lYeqvoYr8SxJMEi3HFfr4xMx53VV1Vr/jt5RGNmyLW5olWkIxi5jMNj0BwA8eCpyn0
	 2WDOO3NjC46hMFsYk4uW3Pvi4HufdlyCWBt/xGSmArepLxgTIsQHDvQFL4yeNtwYQW
	 Jb0rq9JWVfUaajlGIxMeGJxMukzDJiUQAaxDgTs+LQaKWNXOsQeFSAi9l1iu21lenN
	 BZ7ceg6UfRGqHWkUfyzKBVu8fuFWZZmWWhDw9z6ku5ALzTrqsvZDDNhVs+gkths2We
	 mzkYzggubIY+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27B7240B99;
	Fri,  2 Oct 2026 19:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 941011D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A8A840B99
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VF5JqJPTJMUM for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:28:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 98F9840B53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969329;
 b=rSkJrL7Y31kL9DaDYpvpxpg7fUfrH6Cxlab9bApwwy5M0DAXvQeXcDo4IzzrUSiHCExu
 nTLvq/JmS6c161rWgZuCr/xAuUxwbRpZtmD3MmqP6iYBmvgDhxLKfQl1lBfIGXZw50ikH
 xDjcDgVN417A+C8mrA9X2yq023FVuhrJLRdsYDhWx7Tw3SYNyC+99zEJLq0gHllUxRUD+
 t0iiTI2zIyiDLsI04er7uzq16ZGoz+F0+NcoC7ZAV590Pi2zZSaTStO62i0N4uhgpD8S5
 96gE+CP0W6I88fYoIneFund3RAHj3baoTwZZ5wAO++gE79jcX6Jz0VmPoO/U0L670+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969329;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3NMtCUuv5AdsrlUTaZY2IiorhK2MLAMB2wmni78tkhQ=;
 b=a1XfqwJqhQFnyjFE59prZgMjAKS1bixW6MPgqV7MyFGk3I2ZZvQqBaq7UprkqxJHKMTi
 9dHzm9/fGHPNgEyKQ/SS8X/w+c3i32JQDX/+ljTqVaOmzn6wzSANLUBd2ZqIDxxaetHrF
 ssxZAUk1PMepzrbO/gTd/CanBNQEwBrzLo+5AGYUSNvlKHxUAMgQHAQ0AbRZ5kQbl/DG4
 CiN0I1XXyq0loKvbG7v6K3F7YnEu3S3bBKKJA+f3eBTnQdKWXjfMqctDoFgg0S2IxU62q
 F9SugpbLA84y3FIak2mDhoAZIjos77wlvMOevt3HrVyGuLHxo4UXQryG89ik7Rr3Niw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JryMOBW+; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F9840B53
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F0B054E41114
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:28:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C56FE603DC;
 Fri,  2 Oct 2026 19:28:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9349D103281E6; 
 Fri,  2 Oct 2026 21:28:41 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:28:41 +0200
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, laurent.pinchart@ideasonboard.com, 
 tomi.valkeinen@ideasonboard.com
Message-ID: <asAFpmIUm-J9pEQh@windsurf>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
 <20261002102335.12501-3-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002102335.12501-3-paul.elder@ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: Add option for pykms
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 02, 2026 at 07:23:33PM +0900, Paul Elder wrote:
> Add option to kmsxx to enable building pykms. While at it, add kmsprint
> and kmstest to the extra utils that are built as they are useful for
> testing and development.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

As Laurent suggested, it's best to split into separate commits changes
that are separate.

> +config BR2_PACKAGE_KMSXX_PYKMS
> +	bool "Enable Python bindings"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON_PYBIND

This one should really be a "select".

> +ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
> +KMSXX_CONF_OPTS += -Dpykms=enabled
> +KMSXX_DEPENDENCIES += python3 python-pybind

Are you sure python-pybind is a build-time dependency?

> +else
> +KMSXX_CONF_OPTS += -Dpykms=disabled
> +endif

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
