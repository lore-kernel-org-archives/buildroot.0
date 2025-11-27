Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80226CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FBB5605D7;
	Thu, 27 Nov 2025 19:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG7xMAKR-clI; Thu, 27 Nov 2025 19:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 739A1608C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 739A1608C2;
	Thu, 27 Nov 2025 19:52:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E568F2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D7C8440B
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0SidTj0Oebk for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7DF9843F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7DF9843F7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7DF9843F7
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:52:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03678B979CA9; Thu, 27 Nov 2025 20:52:40 +0100 (CET)
Message-ID: <27cf61b8-3412-4564-977e-d4b9d1c868e6@rnout.be>
Date: Thu, 27 Nov 2025 20:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>,
 Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-2-bernd@kuhls.net> <87ikffq6kq.fsf@dell.be.48ers.dk>
Content-Language: en-GB, fr-BE
In-Reply-To: <87ikffq6kq.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CHwq8S6GhA46ZvyHvXUEcZjhTiNk4cILWvoHCDOgNdc=;
 b=SyjoJHmATqQ/OT88sFjw+TWidV4tYxmVMf3Pm6pfaCiOaBLV7D4RVpn4GXVRUgh3MTNbu7
 3DzZSfyMG2RHW9ziKy6VRpRl8YqXSUwB1yA9Iwd7Rt1KToChnTfpvxULO/CH7PlhTK1419
 YKrwalqJ51B48Le7CuKEJr9ZdYpd3DPvrp1+LRWyOoW9azkWyQO7is4BK8ldg9LZGPFM9x
 HZ+6P7TNo3Ij//nQMpKOJ8vnqTBk+OQf1MIbS4OXIh4UXnQzuj4EYSXbXIxOnzxQupOcsj
 kyyKeIX8ihG1t9WqCegaB528C2qoynARFJm1Hebo1NlXU85UGOKa4xSVv5Br0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SyjoJHmA
Subject: Re: [Buildroot] [PATCH v3 01/14] package/asterisk: fix build caused
 by libjwt bump
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2025 22:33, Peter Korsgaard wrote:
>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
> 
>   > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>   > In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
>   > from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
>   > states "Version 3 of LibJWT is a complete overhaul of the code. Please
>   > see documentation for usage."
> 
>   > And indeed, this version bump breaks the build of Asterisk:
> 
>   > res_stir_shaken/attestation.c: In function 'pack_payload':
>   > res_stir_shaken/attestation.c:357:9: error: implicit declaration of
>   > function 'jwt_add_grants_json' [-Wimplicit-function-declaration]
>   >   357 |         jwt_add_grants_json(jwt, payload_str);
>   >       |         ^~~~~~~~~~~~~~~~~~~
>   > In file included from /home/autobuild/autobuild/instance-11/output-1/build/asterisk-22.3.0/include/asterisk/module.h:39,
>   >                  from res_stir_shaken/attestation.c:24:
>   > res_stir_shaken/attestation.c: In function '_dtor_jwt':
>   > res_stir_shaken/attestation.c:367:38: error: implicit declaration of function 'jwt_free'; did you mean 'jwks_free'? [-Wimplicit-function-declaration]
>   >   367 |         RAII_VAR(jwt_t *, jwt, NULL, jwt_free);
>   >       |                                      ^~~~~~~~
> 
>   > To fix this, let's use the bundled version of libjwt in Asterisk,
>   > since even Asterisk master hasn't been fixed to be compatible with
>   > libjwt 3.x.
> 
>   > Of course, this raises the question of whether the separate libjwt
>   > package should be removed, as it is anyway only used by Asterisk.
> 
>   > Fixes:
> 
>   >   http://autobuild.buildroot.net/results/2d39791c65c5b71b0533d4b2bce5f073f5919552/
> 
>   > Cc: Waldemar Brodkorb <wbx@openadk.org>
>   > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>   > [Bernd: Added libopenssl dependency needed by bundled libjwt]
>   > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> 
> Committed, thanks.
> 
> It does look like the host-asterisk workaround for menuselect isn't
> working anymore as the directory gets cleaned:
> 
> https://autobuild.buildroot.net/results/660/660d89e1264510f73f1486f9807dbefcbe73850c/build-end.log
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
