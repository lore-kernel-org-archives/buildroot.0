Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E0606A31E
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B9g9JFdE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D476860771;
	Mon, 19 Oct 2026 17:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLXn2-iWair7; Mon, 19 Oct 2026 17:25:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8ED9860762
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430757;
	b=H5+Bto4j5hT+FrkUvkzTFyx/raeVw8aOUx7oHZU9Yy4ynzIxYW8MqNGNNPHJ9/qtT9HK
	 DedFXfwa8liM6+paI3zzUYCL76PKlFgKnqStoZv4fpL1WHgabaN0q4SZ5tkwAwuy4V8re
	 ALsXt0DwRjWkgLzAUmNhKDjxVbZEvvA9RGP0D3FV9g2F95TYS2+Ar1fS6kUqM+IPevlpw
	 z76nMTZR7XJPtc/at+yPkrAdFemoJRZJ8BsbBM7omv9u5Z0FLBC1xtCD6mWlnCANrWrqj
	 D/rrn1kFPvKoOjvJcJBiWkwS4mA7pWmkzEKf1yXA4hEBjiunv8B3AKmGOTFVucrqaXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Oem2SNMXc9sZdThAReBtNMcS9tISWlF/KNkWeQX0vVI=;
	b=NDrLAAskbyrud0u8aiI52kxgtC00okcwe/UTkG6jI6mWkh1jEyNcjMUID7EeY49f30Oc
	 pO8+n4L7XZf9q2/KYRKaPrcAY7Is74TofEojjI2CJYHqMPf8aWlsGHOW4uUgwK1a+Bdgr
	 Mfrhh3kzFfE++hycO4MyWM4rXiYmnmRh4vZCLgP77nvrTPlCrTaUHBZ3XuUPo8Bc5p22K
	 W2TJcyIbUcp6LqRtZqSernEb3DIXUYF6ceki50sg3C4+Z4QMAiYnpcr1o9LJ/J867cn1v
	 cDR+1PckWi56egQ8hjdhxcvsi/lXJ7MQ5z2hbJP5lLm8OupEFjJOSwYUfZyBUYrm3qA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430757;
	bh=Oem2SNMXc9sZdThAReBtNMcS9tISWlF/KNkWeQX0vVI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B9g9JFdEtnhSGX1eZODdFqGf0RlfX26vqdiPmTogt60cLUJAi0PEmqCoISn18NLAL
	 BCx/uHzdOkmJNdTko7ZYS7dFhqMHdw33Ku0pEWba8x5RNBSboJxaVfncRnBU1AVsIt
	 5a7NkqDSKcVEmLDfemASEGCq/wlBTIUh+BFbzJYaaboeHISmDKXGq40gC51I39dMrO
	 990Qb81OJN/zdgLjsmxj09QdHEylwBhgKbvrm/A6v+x1C3Myti4TrNaF39uHijZlHb
	 gvvRnHRwcnV4DtpZBTzruxqvivslJVtTdUo2ENZTrzREFyOjH3+iLTh8pQGGkSgiAY
	 GJsKV1PRy6daw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED9860762;
	Mon, 19 Oct 2026 17:25:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 122AD1AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC9C04069A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZXln8HSj0VB for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5881E4056C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430754;
 b=Lq3v/8nu7ktzOURdckIjNSM+A1129v6fuI6YLck6Jh5AkTwbALx5GOWUnzFqGxKiz373
 wgluSPq6GDU91C7XW0lP+gYsDf3Uwrn5D9G85kU0heoTUsI3Xs78+9vU9G1msRAtz7hl2
 lsyqvR5hxtaV7OVsSlKPmNr1d5owMmTQpq7cf8YDQp7aVJm5rqAh4bNYZQs7tmsrkn+UI
 1JYQOz/zEfSHmFq8LY6jplmPMwHPWHo5dKhIDlSKeMHc+86bJYKttc25AnExZzd72ikro
 GAsLJkpuiw6Jhjk+yc+QdU/Vihlv1f529Pn5YGm38ZCz01WepkTxL5u1aNqfmOfmb2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430754;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=x1/Rpml9l7UTq9PmtKntaYWDEpkikMUuza/K4dQ8QbA=;
 b=teVR3VDc3yAY5kLkGO+GNcloTroOLHJL7jImGyRjgJaJusxREQVcKW17pk1pz55HHEBr
 DCcjDbfjALqXoq/uxirabS/PswaWjKQF6cTS2DCZoNFZGSh7yIpO+xabXOOn30yi/C7zd
 ZHi4UBPaGzXwLdtnOj32UPb6vWy0fe6jI0w5CHIHgLhK0kwNz4YfVg/cB47eZ34q+peID
 iZWQRF0OobPtQky63KTlmIpAFIR7489AJ9DPWD8Fhp2ScPrYc576pl/pyEF8eegZdGJl0
 PFaWPztDQLAgc/q2wXcQ0GbEngW/HD2SFAfGFhu4Ies299edkNLvcK/AIbqvYf+NScw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z5uPkqvZ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5881E4056C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:25:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CF704C5CD5C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:26:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 92F0E60582;
 Mon, 19 Oct 2026 17:25:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A176110328429; 
 Mon, 19 Oct 2026 19:25:45 +0200 (CEST)
Date: Mon, 19 Oct 2026 19:25:44 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <atZRLNEv27mHGuZP@windsurf>
References: <20261018232916.3896517-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261018232916.3896517-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build without
 FIT support
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

On Mon, Oct 19, 2026 at 01:29:15AM +0200, Fiona Klute via buildroot wrote:
> Commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools:
> fix target FIT signature support") changed how options for FIT support
> are written to include/generated/autoconf.h, removing the
> unconditional "echo" call (possibly with empty arguments) that existed
> before. Because of this, include/generated/autoconf.h was not created
> when U-Boot was built without FIT support, making the build fail
> because of the missing header. Add a "touch" to ensure the file is
> always created.
> 
> Fixes: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools: fix target FIT signature support")
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks!

Just reviewing the previous change:

+       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
+       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
+       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+       $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)

Seems a bit heavy. What about:

      $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT), \
      	   (echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' ; \
	    echo '#define CONFIG_TOOLS_RSASSA_PSS 1'     ; \
	    echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1'  ; \
	    echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000') >> \
	    $(@D)/include/generated/autoconf.h \
      )

Something along those lines?

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
