Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07511606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jEYKBUd7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=MXpNhWbO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC682606BF;
	Sat, 21 Nov 2026 10:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwIRcShyjkdK; Sat, 21 Nov 2026 10:23:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 035776067A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795256599;
	b=PMCTDSz8d4IhCG9k6ca2AC5i3TrDZ5oVpWb6FEmbGsufpP2F0jx4hl2CzW3l+Zwpcjpf
	 TxVkimgfa0WiN0NdshBbfBEzb5TaUPQUWPnZbJ7BxhdGlwI0cbp0lERcPWm3+XrAcwWCd
	 /v5S/X0ew7W4t/FLOrM8f98/kES7z9BMMoNzz7yhW6A0AUnxhjMNwEPj+dsxc4daLCt01
	 fShxb4wiuruXRK1VMfA2XzhxrY0rMTuCiY7MlluMXFqlJHgUAXbXsdeJnXgRJkDwjczr/
	 Q+EJKcp1PJlCF0tuVCtzTNgwkrEGMpCyXIzQb/EXW2KcO7XR/pomXX6gX++/+mAbiFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795256599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l+7TNY0KZNFRrjo9X4mCz//xt4PQzWJofpyFgY98/Q8=;
	b=owRAT7+jEqGhOOdVQdEQqbO+Amn3vS9/YEftb0QcP5Ie1VsnwvobWBo3cit50Ps2Vn3N
	 zHTuFv/Rr+CqS2gImJR7phVAlhYCqyMcabsDARq4uB1cqgUN1ILsHoZJxS02qQYwfYKCU
	 cfeQN3Z4qQTtSPBThEVnS7/A0k7wMDzyxdKuARZmmcU8AV2YJs0J8Qd2XJCH19j39dZAu
	 z0AgH7p0+YE9aZ00KTpKF8ohQgLEB4p9dGqDqC/oAR9Mr/OFAiz9MqiPholqOYlpwtDoF
	 Ywv76/CuM7q+61Ivj6CFXjBhBom4wxb8SJ7hv3EejiJQ0fhC2Db/bOhOLDaqGlSE/dg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795256599;
	bh=l+7TNY0KZNFRrjo9X4mCz//xt4PQzWJofpyFgY98/Q8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jEYKBUd7QzCRykQRZrVSekxZOLBMEOAODAsNsxoF+ECN2haCHSkcOknnQq54SCV0R
	 MyYvDX3d2zpS0m6AvYwaNpNPdII7nzZTgZaXhnKjPuwLvkymVkFmQvN++av3WmpOr5
	 N5h1/T6lidqnYm50cliR8gpCn/T8ebIAUv2+km7M5SQ8v7SrBGa5OkSs5bPojve8Pb
	 n8sA8F7u4E8BupfudVCQHKvDi1tjuKaMICt0DLpY50BotU9c4RaerWsVZ/Cdz+z1yF
	 +FPWl4kVM0fJmQMLSFEzUIrZv/SmNWQqnDWaFPttTYe74d9XPJvzpHeELjURVD+fZo
	 ixJlQ8MuSdISQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 035776067A;
	Sat, 21 Nov 2026 10:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35C7A465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2741B40D5E
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71LtrLQUmwLQ for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 10:23:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3C26E40D55
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MXpNhWbO
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C26E40D55
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:23:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MXpNhWbOnswtUgPLQBnhhzloN1hvnNlQn0YdIzmJbr4LNkspJaHrJGhnMVD9o/7k9uLz5twpgzwmqhWDmCBOG4aRHzP8H/gHFY4tmjJKGeMWmh5KaNb2mJz4Fja0PvJESsra8K7tn8idvoa8CwXEIOHOkagI+ymmRYJMlTnZbkyPZFzzBRyaSGcIsWwJ88vIa90REhINYgYHuPBTpIZ8sqvEvfzVupqbOVY3/pZIS8tlEE9JJrhHUDALrMfmgRORnBFxR/vD5/MOX8zGjpNOZho1vZjz5KyTEbORDyhN2wBxYca1kajRUnBIC9QWpU81Uj4RSk6LGfNbLzF69e/i9A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=2e5yV1YU8C19nUXDf5NqIC9z6GwcdDBc/rOHSf3I5wc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -300675217; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Nov 2026 10:23:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUiFO-00000004mvF-1pyG;
 Sat, 21 Nov 2026 11:23:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20261120175029.173721-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 20 Nov 2026 18:50:29 +0100")
References: <20261120175029.173721-1-giulio.benetti@benettiengineering.com>
Date: Sat, 21 Nov 2026 11:23:06 +0100
Message-ID: <87se0utred.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH V2] package/rtl8188eu: fix build failure
 with linux 6.1.188+ and 6.6.157+
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Bump to version 2026-11-17 on branch v5.2.2.4 to fix build failure with
 > Linux 6.1.188+ and 6.6.157+ due to Linux stable commit 8b7648962d41
 > ("USB: core: Use device_driver directly in struct usb_driver and
 > usb_device_driver") that dropped member drvwrap of struct usb_driver.

 > Fixes:
 > https://autobuild.buildroot.org/results/6c1f9024b049d74e556e1a6790be40c620c2b8b4

 > Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > V1-> V2:
 > * fix RTL8188EU_VERSION to 3baea5afbb67da6078fe1b4931e44d119bbe15d3, the
 >   actual commit on branch v5.2.2.4, since 806f138bec59 doesn't exist
 >   upstream, and update the tarball hash accordingly
 > ---
 >  package/rtl8188eu/rtl8188eu.hash | 2 +-
 >  package/rtl8188eu/rtl8188eu.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
