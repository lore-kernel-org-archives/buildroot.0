Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A90606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gWuJEjPG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0D78112D;
	Thu, 26 Nov 2026 22:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASOquN859Ibe; Thu, 26 Nov 2026 22:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 59D9981132
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795730925;
	b=L4P5C5rhtFxJLLQ7Huc0gbSkB8CLVb0NnSsFU6MGEPJEzfLiyHqIbAipceqN8BPTfH+b
	 eDSyDmiu1EOEvd6dWz6cJjEQnl/pTpJzUIDdLCaP0j7/8B5VorT7+/l19ckrhimGIOv58
	 mM9DtZQUS0dm0jGL24CkT6mwB32LLIKTvffZE4KGOyr7bqEp2rBU637r3hMlcgZo6cVTK
	 Ti1g0JAt97F++m/cVFWLoxtF8WtMdzjhHUwJxJWetaPaaatg0VKm/87RNmqGNLZsPN+RX
	 t3a/Soc6wnlTbP+LHtgngVugNhLB34wHDF7LuWIkofQ5sOuAqDToPZ/JjTn0/Yw2baA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795730925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2JVFNMiTqqgzZ8Fvg0ggVOPhELI/3h0dSSOTsrSh918=;
	b=THTo9rIY/HvHYkWhcXKJMQqfCLwveMbp1tk3ETtLe80NXsJDjcVwG2d0aTJJOTLwfIxR
	 oAYSsj18bUS1Q5Is8ygiwWm8AsN6GxOl56VkuM+ap3CquCWRgZE9WXm3Ro0taRG3+O6oR
	 yiaBwFDzdfzF2RcXvdJ3lKKuFWRJ9ZEVDj+9X7PJt6YKZ9A6F9R/dQS9d1lxeT6nhMloX
	 5OL35GDHO4cOH+8wkLRuMTh40BINt6cs2pBf7rZtGtCtjwLAJMx5Ik2jzRJf9r+7jFf27
	 17vgT7bssC19jTbbpPN7oI5gQ7Q8LLJav1PpoVswD9YqnwQfay9A9ECL6iQNXhdg0fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795730925;
	bh=2JVFNMiTqqgzZ8Fvg0ggVOPhELI/3h0dSSOTsrSh918=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gWuJEjPGk0Tix8xQXhwIDuJEBsUfG/fm8i/AWP300AYrU1LkXFcIbZRCusBVOrgc9
	 yckIDNq+fn7dYazYopSjOGaBed1G6EfYsbRFaAl1J6qg1Q+3003OACsCu39YxYFDJ+
	 /vV7MGjWW58myh8z0a+eUEyg9eUgt+ZmSCYxsj6i6sdZbFInCUCtyiw+cSlKI4Uccb
	 P0L/0rSy2BmpZBrvoyg7zdwvHJ0XXFAOcGL2ykge9uRiPz5SleHQvBzvojwfetMNoN
	 LZvLl6L16wm+eRF7W1vCMXQklPdrr2TK/3WlFR5JH0owg2jWVAD0qSBFGoEtJouW1S
	 t+qez63Bgu42g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D9981132;
	Thu, 26 Nov 2026 22:08:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66D121AB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C4298114B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MryKvJB2g70G for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:08:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E5698112D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E5698112D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 318291A1826
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:08:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0135760558;
 Thu, 26 Nov 2026 22:08:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E3E811E691D1; Thu, 26 Nov 2026 23:08:35 +0100 (CET)
Date: Thu, 26 Nov 2026 23:08:34 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <awit2_zCz5RNQihV@windsurf>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
 <20261124120443.1909297-3-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124120443.1909297-3-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/9]
 support/testing/tests/package/test_flutter: bump kernel to 6.18.65
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

On Tue, Nov 24, 2026 at 01:04:37PM +0100, Adam Duskett wrote:
> Bump the kernel to the latest LTS.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to next, thanks!

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
