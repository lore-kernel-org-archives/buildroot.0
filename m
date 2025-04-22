Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0673C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 20:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C7A480D54;
	Tue, 22 Apr 2025 20:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahkO5DUKMoCL; Tue, 22 Apr 2025 20:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D2280D87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D2280D87;
	Tue, 22 Apr 2025 20:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB4B1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C059540BC9
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ay0mQv0plSCe for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 20:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5814740B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5814740B8A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5814740B8A
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:31:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D7171FCEB;
 Tue, 22 Apr 2025 20:31:39 +0000 (UTC)
Date: Tue, 22 Apr 2025 22:31:38 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <20250422223138.59438863@windsurf>
In-Reply-To: <20250422103424.3928-1-adam.duskett@amarulasolutions.com>
References: <20250422103424.3928-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeutdejtddvieefkeejveeivdejteffveekhfefkedtudduueejtdfguddtfeefnecuffhomhgrihhnpehmvghnuggvrhdrihhopdhgihhthhhusgdrtghomhdpohhpvghnthgvlhgvmhgvthhrhidrihhopdhgohhlrghnghdrohhrghdpohhpvghntggvnhhsuhhsrdhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepr
 ggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745353900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIILWDBpQ4TP91eJPS0gxfsI2lItAld5oeoVV0i/iHQ=;
 b=enEIjpi2L8A1pfKM0dqdep81tMvlYS5zshWu7GncG6EIHdD5y44tT4fQbQuTwyHgZtR6ck
 BnDU3WrW+SIOy7MfxLxSLPE39IHk5gqLhf10jIRuLXGZH2cymio8o11piaFTmIC+YBfz4J
 7dAnCQLKgoeFkDmH8UHnA6wHIq9f1bnMqvpsmATACLYCfEuMyfqblPh+0xAm3atmQzpf5P
 NWKnaLO5x1C7a4OFCWiuHhyID6St+j/VEG4u8RIIng6hSd/IMJiCFdPxekR/oZkWak/xRH
 YqwLTWX/Lo/9FfFLp/ur3GlYXmEoHgikZWwZeEgF/nopCTDHJSnxsqmo+9MFxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=enEIjpi2
Subject: Re: [Buildroot] [PATCH 1/1] package/mender-artifact: bump to
 version 4.1.0
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

On Tue, 22 Apr 2025 12:34:24 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Changelog:
> https://docs.mender.io/release-information/release-notes-changelog/mender-artifact
> 
> License changes:
> New:
>     Apache 2.0:
>         LICENSE: 2024 -> 2025
>         vendor/cloud.google.com/go/auth/LICENSE
>         vendor/cloud.google.com/go/auth/oauth2adapt/LICENSE
>         vendor/github.com/kylelemons/godebug/LICENSE
>         vendor/go.opentelemetry.io/otel/trace/LICENSE
>         vendor/go.opentelemetry.io/otel/LICENSE
>         vendor/go.opentelemetry.io/otel/metric/LICENSE
>         vendor/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/LICENSE
>         vendor/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc/LICENSE
>         vendor/go.opentelemetry.io/auto/sdk/LICENSE
>         vendor/github.com/go-logr/logr/LICENSE
>         vendor/github.com/go-logr/stdr/LICENSE
> 
>     BSD 2 clause:
>         vendor/github.com/pkg/browser/LICENSE
> 
>     BSD 3 clause:
>         vendor/golang.org/x/sync/LICENSE
>         vendor/github.com/google/uuid/LICENSE
> 
>     ISC:
>         vendor/github.com/decred/dcrd/dcrec/secp256k1/v4/LICENSE
> 
>     MIT:
>         vendor/github.com/Azure/azure-sdk-for-go/sdk/internal/LICENSE.txt
>         vendor/github.com/Azure/azure-sdk-for-go/sdk/azidentity/LICENSE.txt
>         vendor/github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal/LICENSE.txt
>         vendor/github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys/LICENSE.txt
>         vendor/github.com/Azure/azure-sdk-for-go/sdk/azcore/LICENSE.txt
>         vendor/github.com/AzureAD/microsoft-authentication-library-for-go/LICENSE
>         vendor/github.com/goccy/go-json/LICENSE
>         vendor/github.com/golang-jwt/jwt/v5/LICENSE
>         vendor/github.com/lestrrat-go/iter/LICENSE
>         vendor/github.com/lestrrat-go/blackmagic/LICENSE
>         vendor/github.com/lestrrat-go/backoff/v2/LICENSE
>         vendor/github.com/lestrrat-go/httpcc/LICENSE
>         vendor/github.com/lestrrat-go/option/LICENSE
>         vendor/github.com/lestrrat-go/jwx/LICENSE
> 
>     MPL-2.0:
>         vendor/github.com/felixge/httpsnoop/LICENSE.txt
> 
> Modified:
>     Apache 2.0:
>         vendor/github.com/mendersoftware/progressbar/LICENSE: 2021 -> 2025
> 
>     BSD 3:
>         vendor/golang.org/x/net/LICENSE: Google INC -> Google LLC
>         vendor/golang.org/x/oauth2/LICENSE: Google INC -> Google LLC
>         vendor/golang.org/x/text/LICENSE: Google INC -> Google LLC
>         vendor/golang.org/x/crypto/LICENSE: Google INC -> Google LLC
>         vendor/golang.org/x/time/LICENSE: Google INC -> Google LLC
> 
> Removed:
> 
>     Apache 2.0:
>         vendor/google.golang.org/appengine/LICENSE
>         vendor/cloud.google.com/go/compute/LICENSE
>         vendor/go.opencensus.io/LICENSE
>         vendor/github.com/golang/groupcache/LICENSE
> 
>     BSD 3 Clause:
>         vendor/github.com/golang/protobuf/LICENSE
>         vendor/golang.org/x/crypto/LICENSE
>         vendor/golang.org/x/time/LICENSE
> 
> Tested with ./support/testing/run-tests tests.package.test_mender
> 08:48:07 TestMenderSystemd                        Starting
> 08:48:35 TestMenderSystemd                        Cleaning up
> 08:48:35 TestMenderRW                             Starting
> 08:48:46 TestMenderRW                             Cleaning up
> 08:48:46 TestMenderRO                             Starting
> 08:48:46 TestMenderRO                             Building
> 08:55:02 TestMenderRO                             Building done
> 08:55:13 TestMenderRO                             Cleaning up
> ----------------------------------------------------------------------
> Ran 3 tests in 425.930s
> OK
>         
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/mender-artifact/mender-artifact.hash | 56 ++++++++++++++------
>  package/mender-artifact/mender-artifact.mk   | 44 +++++++++++----
>  2 files changed, 73 insertions(+), 27 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
