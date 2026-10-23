Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C6606A33E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nF2JPus6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D942D606F1;
	Fri, 23 Oct 2026 13:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AG19NZHmJNI; Fri, 23 Oct 2026 13:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D87A06070E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761640;
	b=prCPYKI2FRdgrlcSbInzDHbfZrv1zigC7Vs1OGEArygbwIy25qL5XWUsMmbteb1dRemY
	 udyMlk2ONuDE6lNQw/MuT9VyRYr2Kah0EQhYU1Qej/RqH9TyMYEIadx/owaWo5Yycdq/K
	 1lh38Gknk69Z1Zs95E2NkMCblnSb09Hh1Nl1ckT1GFqooyO/34dsq/3D7ly/kgjIxx7Au
	 Y4fzVkYR/NrkDB8EJ2l4tRTggcEQ3jRiGKmytjXIMAVdQ/P5EDsYUar6/GZl6kefZiA0X
	 LS6MUbnwCM2BXRr6F5Bk7GmVB3PqH+g6L1Q8qfnlGLAceFO1Ngi8GfLsFXO13NJtBIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K8gzwYzXA2KpSavZrWpQ1RnNcJTNoAySzWGXUhmqyOE=;
	b=W+PBGpPuEqN7nqbsgokecD3YWZk8Xc4FT1YfOdkf+j35/rHA7foIRsU4jOuhHowGmx+Q
	 dJGjrrV7R5RpsmXjdXY2K0k+hagtjmZdpptEFteaxtl/eGwKErKdbp8iy+k7xecnFCIf5
	 yOUVPVBvEyIUxfErsaqWA5Dhi44C35qSXlHnaoDcpTLeTDdq8y0tUDtvUBrl0bILZHb4h
	 yPF82J/6Vy73DlAd8XJqEbulxXW2OHYSQ6G3/eMRJ5K7o6XPQEjSC/KvbPlNrw1gO1uts
	 ssWgTcvn8CP9FxoRKuSs0/eDQ1rs0BRg1lu7+llzjjkGPBmVdpI890YSBXo5hsMVnmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761639;
	bh=K8gzwYzXA2KpSavZrWpQ1RnNcJTNoAySzWGXUhmqyOE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nF2JPus63LLmvisE3Ak7BbwznoSsxrDm8nVpu1vuiRGU5ESeUK5646IY0ayGW0t9W
	 NoPJqUpITGKzBUz/y9Cns66hADOuteN9Mv4d10/jSApDjg7VVERIl4mpscVqfSV4ia
	 EeenxvsMdbucfP6G9h7NvPx4fRqE6qob8sdGTOkv5s7NJYm5Eov4Z00LdhMN0VR8q9
	 QEov82xBwQfF5DxzgNGsaOB6TgAFbSWAtM5bq+aeHG2fnEQgDpnRbHHFWcrm+1Oh7N
	 T8rLeR7++i98tpnIGHZdoCoZ6IlehwqzrSTMyXGmf10GXCbRvF7EGg5EXwB03D5KM4
	 lJ1VLm6fbZrDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87A06070E;
	Fri, 23 Oct 2026 13:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27BD83C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2586581496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSpHOUrPqp3S for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DA798148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761637;
 b=N5SiFYZPH4yRhowTqwN8EH/oTU7kVpsxMVZgO/z69fzu+zvX6LhzVYFQJnhJZxDXjCaQ
 KeA3pVW6S1YXzEZ5jEojVcbAPuSEUu2wWUuioPM0yAZgy5miitzFxW/WLVcWtDvnq7ils
 zgRAGQah1eoBQ99QWYCPCa91TIffDtm7yat3TFoAFgrQGBFlEXbt7yaFhneYACTrKG4Hk
 6IfPuf+jDJ9dFmeJELgzFxL/+SXzLeJwUdd71aPY9sM8LmziSqsZZuwMf1QV+jfQF/prC
 Ws609T1dGicacvEcfSGom2sG2UQIfNVNaEksAVoMv8fGWtPXumwDT49gm0ngQKXdXYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761637;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XAETaE/qL9w2IdzQ7t0qJO/E0eiiq/o1xDYuyNSuGFM=;
 b=NPVl0CeECZuZtabwEfBRMATM4pz0C435NUjqmbFgIGf8ozEUn6gV0CXCI2+703Pb3Jnm
 vgfxi6fnZS+xzflpaUuBvhmCnwoapvP/0A+HBKNcAJltjtAaUGsjCBpk58J7sVaH76Oue
 zM8DLoWR8oEMDmwiPvJh3IYiRJJOCr4PMCTRTQwCQdtrTdGToUfFrJyKqJ+wK+N1l1/Hm
 jOkLkRWUQyGs8y6knuwEz4x4Xt1Z6V/9fX5E7LQhMytXnzpYmqjSEU/E+Oy4n8k+lGBi2
 meQBKfRSREepX9caJWL6Kb6v3zHxjg/SFwgtjzgJnQSEu3wVxFMZd7WJaxpuBqV5ojg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZbvmdvJD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DA798148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:36 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso6857475e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761635; x=1793366435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XAETaE/qL9w2IdzQ7t0qJO/E0eiiq/o1xDYuyNSuGFM=;
 b=zclZyNcC2FAJb/12QwpzhrL9DoSzAJ0WvnqJSuyQaNN57p2GfZUaDdsheroMZrE83P
 nM/VDmBV2+QCVkaYc8iMRy7LHiNylZvLz9/KDvAFhlZc7DuB6W/IdKsePQ6JDZi1WJkc
 a57zYlTkZ90R7gxcol1hjHC06xVB96XroOaN2pKoHqzqAWfCYprPbG5udIn1Le38pPDp
 X0pO5zq4woAcOv7HqkS58HRWG7B7vv4dtMVPR3Dzq27NLghtIeRLn9yFCSyNbvETvZNU
 HQG2Hyz3lC+QJrKlAFQXjJk2zZz5lrM4V2zO49BwMIAA4KeaKA54G9JdABxLjxiCGOw1
 Z45w==
X-Gm-Message-State: AFq9FYI70wLTtRubcTRs0gZK7F6vxBUFtzITErWv8DJHgvi1u1jFn8eq
 tmNHbzWYOjfgduCOq8tJHbVDnxc99u1HhFDgeAFcaw4rrWRCjsPP9amooL9cHvGldj3YIkT2YJT
 4wDJ1w/A=
X-Gm-Gg: AYBFou2UeB/J5u/cNEPq5lAQsgbJUjPxnU2GmQbi/KoRfQHFAFS1T76PCSS4XeDRl/T
 sThdiDd1dFveYiIT/a//Vzi2faa/kJF05lRdNOQGkubIgaN8SR1x0GxKfNH0yhFVQcPFVNs/JWL
 a8zlywWdwVysWut2rUh9F94XbsY1DA5W+Jvt7b3JrzwbIq6MjrS9vUUYMgPJsHfNZ0AJH9NQwr4
 a7cWx9AEvGXlBZUs71BdxN4K5D2dT0yT2W2eaL4eOqEIO/Cg6ArQeX1jxltIbKWxZKwCdOUMkDH
 R/NAqSfDpkrZCZLdicf1MmoqkChMh1f1ooMX0Nsf7+Lyd/KtXhP4vLarCnlP8SrNee2M7VqIvMM
 NWWForqJEr2k5vWpN+FOhFCppwmsuiFsxYxG+k4AcOF0MXeYeNmfA3mIDLVzExkqlIQfEaAMSru
 TS6QRQDa3FsQeJXiZm+6UhMMNPHKrCKDjiRZgYZoVZsF7oCzJ0BFQ9e/YRlBmITEVZF3jiYZ8fe
 tJ8tPgEt7HdemG7E4PrM3KVLFOmu1BgJMZ3KCe3kU6tHAp1CKEVgNaLgA==
X-Received: by 2002:a05:600c:4443:b0:4a1:f7f4:7cf1 with SMTP id
 5b1f17b1804b1-4a211cb8a1dmr39016615e9.11.1792761634388; 
 Fri, 23 Oct 2026 06:20:34 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cdb8401sm5019365e9.10.2026.10.23.06.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:34 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:31 +0200
Message-ID: <20261023132032.1606908-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016152811.2817446-4-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4]
 support/testing/tests/package/test_uboot_tools.py: test FIT signature on
 target
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,T_PDS_OTHER_BAD_TLD,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Adapt the code added to the host test with
> 928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools: fix
> host FIT signature support") to run on the target.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
>  .../testing/tests/package/test_uboot_tools.py | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
> index 13f77c3379..7caff3e66c 100644
> --- a/support/testing/tests/package/test_uboot_tools.py
> +++ b/support/testing/tests/package/test_uboot_tools.py
> @@ -38,7 +38,10 @@ class TestUbootTools(infra.basetest.BRTest):
>          BR2_PACKAGE_UBOOT_TOOLS=y
>          BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
>          BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
> +        BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
> +        BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN=y
>          BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
> +        BR2_PACKAGE_LIBOPENSSL_BIN=y
>          BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
>          BR2_TARGET_ROOTFS_CPIO=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> @@ -68,6 +71,65 @@ class TestUbootTools(infra.basetest.BRTest):
>          # Python does not have built-in CRC16 support, just check it is present
>          self.assertIn("crc16-ccitt", reported)
>  
> +        keydir = "/tmp/keys"
> +        self.assertRunOk(f"mkdir {keydir}")
> +        # We generate a public/private key pair to sign the image.
> +        self.assertRunOk(
> +            "openssl req -batch -new -x509 -nodes "
> +            f"-newkey rsa:2048 -keyout {keydir}/dev.key "
> +            f"-out {keydir}/dev.crt -subj '/CN=Buildroot FIT test'",
> +            timeout=30)
> +
> +        # We compile the empty dtb that will be used to store the
> +        # public key.
> +        self.assertRunOk(
> +            f"dtc -I dts -O dtb -p 0x1000 -o test-key.dtb /{KEY_DTS.name}")
> +
> +        # We sign the image and write the public key in our key
> +        # storage dtb.
> +        self.assertRunOk(
> +            f"mkimage -f /{SIGNED_ITS.name} -k {keydir} -K test-key.dtb "
> +            "-r signed.fit")
> +
> +        # We check there is a signature present in the FIT image.
> +        out, exit_code = self.emulator.run(
> +            "fdtget -t bx signed.fit "
> +            "/configurations/config-1/signature-1 value",
> +            -1)
> +        self.assertEqual(
> +            exit_code,
> +            0,
> +            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
> +        )
> +        self.assertEqual(len(out[0].split()), 256)
> +
> +        # We check the key is marked as required for the configuration.
> +        out, exit_code = self.emulator.run(
> +            "fdtget -t s test-key.dtb /signature/key-dev required", -1)
> +        self.assertEqual(
> +            exit_code,
> +            0,
> +            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
> +        )
> +        self.assertEqual(out[0], "conf")
> +
> +        # We actually check the signature is valid.
> +        self.assertRunOk("fit_check_sign -f signed.fit -k test-key.dtb")
> +
> +        # We "corrupt" the signature, by setting it to zero.
> +        self.assertRunOk(
> +            "fdtput -t bx signed.fit "
> +            "/configurations/config-1/signature-1 value 00")
> +
> +        # We check again the signature, and expect a failure.
> +        out, exit_code = self.emulator.run(
> +            "fit_check_sign -f signed.fit -k test-key.dtb", -1)
> +        self.assertNotEqual(
> +            exit_code,
> +            0,
> +            "\nfit_check_sign did not fail as expected: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
> +        )
> +
>  
>  class TestHostUbootTools(infra.basetest.BRHostPkgTest):
>      hostpkgs = ["host-uboot-tools"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
