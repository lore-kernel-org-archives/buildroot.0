Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DF606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FGp5gUES
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AAC40E18;
	Fri, 20 Nov 2026 09:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H66LXpNMHxRk; Fri, 20 Nov 2026 09:58:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1691F40E1C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168724;
	b=G3+tGcvWK5ynksSLEWaQKplFG0QWwCfT1jhu3s/qbo6o/QTb5y2B9fXU8nqgVIaSTm9U
	 fqrnepwlvcTpFehH7NJ+1UwqkbqFh5YfcP1jPnze5YoFNxnS0BX+d2aFydRHmyhn9y3uW
	 /P5gAh2Q1zs45H56yJ2C9Ep4n5HZ4q7/uvNA7u8WVoD0HvPsZN6HM7/St+5WAs0iZbynj
	 NAQVfqN1RkZNg605twwPdbVIoE3IfjXhT73Umof6jK1rbD0VNUP0b8theFnL3WQpKaohR
	 6eJ18U5Pz3LmAenfJ+yUatfx+mbA9yt7QMwiTqKAyjtAyJbvyJ8Qx/Zt1ZTnBbBvHpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168724;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AmFz+dHO0WMbgzGnlFtgtbJXX1nLbo4y9cBWEEunpRw=;
	b=Z0yjRbpl/60s9YuDUG3mkTw0rNb75nCve5MntCwNrNx66JcmC0mnnoy++n6il2cScquB
	 48zKQ8ufdxUvhLwvRYeR3lXwKX/B0Iv5xCcw+ZlK5qtBbKrVAQ+CPDy0WxNkkcbCIovwp
	 tSf16D4De6P15LYVQmFbRiYn96/ryxxQYjXPFhaRk0o84i8OJGlr4p29x3JaDyi5hrsoA
	 7ahT3PN0/nPoiUGJa1gtrUFUNrqOP0AmZEHRKdbnRSb0xW22ReRPg0dyVK7pCfC6ae0HJ
	 xLEla8emj7g+Yktz0fs0tsVYWzD2B+EfpWjukO2kQK7Lq/abOIrplI8WldDBY/DkXEA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168724;
	bh=AmFz+dHO0WMbgzGnlFtgtbJXX1nLbo4y9cBWEEunpRw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FGp5gUESHGJ6WDWKLvYuXNc7o6pg5m72Qg8J3CmKnVcTaIA2VaN3YuOR3uQv1azaU
	 /CR/4qYry9vzap85QDcJS6ctaw1JKyAEsIOGUWH1RZI6cnEr7P45lDv7qJxo84t4dX
	 H4GrfkIVMey58OxF6X6JBSeeiFWFN7o9hOZ+qcK5+bpHPQJ77nwsQc6jb4tFCDfbj6
	 9aqW6r9dHhrLBFH+TBuFG2PyahBio2PEvLRk8F24ID3D7195dUlnds7c2akZx1dnbt
	 DGQBoprC/OGLltHl6TpYFJuV9eJZZL7XTuUkZ5U280wTCPHoUoOSrChYmmlSUQHZ9x
	 Js3rSiCzot71g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1691F40E1C;
	Fri, 20 Nov 2026 09:58:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F6A169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB4BD4016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa-C9runbKQW for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9D05F4020D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D05F4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so5604495e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168718; x=1795773518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=INODHp6qqGYWnIzWMZJ6Kb/tsHmQNK65kDNMnwQfehY=;
 b=wSeEp7pBELd02wXRXyYYdr93zifAk+SuTr7AEWm7i39RMiQgij21jXCNfnClKdv/fg
 MGVDnktY6jd57LTR8efDWhceD1W/7ibOBN5Uv8+X4PtNcHGyLPL0VM7dE6jm1mQTtjqN
 Bf5gJ0ZmaxQ+O62udxTb4uUuayzZDVRVW4fUmHt/PMft/8HmoCaEAfkLzbR4TMUfzYa7
 cUXfPT7AvMGumJvVsZpx1HhGARn3VWdPHREqG8QabdFtY8AKeJWePr7hLjGykYYW6oeQ
 hrbktIwjOucrC3JJ8OgFSkuWsSSSzdGcv6nYPUKwZ8mrQgwpf56aHY2j2meTSKQ2E8vt
 PK+g==
X-Gm-Message-State: APuU4Z86IGoQb89lPy37wfj9vv62waEXWFGaieLueH1K/d/Eq8lH0fmg
 b3TtquMxw06Iha1A+a17IPNB/m/vbvQSIWA/SDcplI0jAogYIi9v/DsP8RdIC0ItjZbSUF56OcF
 eCra3ruUJFw==
X-Gm-Gg: AYBFou1bqvD5xXHF3SPo7+RKXOls9dw1JXO91dZHCTQ1Qr2svzq8LGDBUorpUR3JdBI
 o1XAvHQxh4drDkOgSKQtqIkPJJ72BAu36fv1XfSJB36DFhk4BPw7fjf7A0mYfkyot8gRm08IuxC
 nYwSKT2rszAK4zxXnjbG6C2Lfc/IZ6O9lfjTDUBg5/+9lU+yTEbeGEEDj9tRwyN+6AhXTirkHbA
 SzU9rgzcTfsKqkXkXoy+RxiptriacknsB8klVo1lekKz8tuid+12KS/lnpoBdms+NHFwLMDuWQO
 BP4nqsIpF686r75NwcP94ftciHNKnffy7/hH2337NogQJT9kp8JmJXxnu/fvdgQnqrY+kal7jrS
 T0ihVIckyhhgAkzTkejZbame5AriTfDChTRMNWM8iZnmcQPgFItKicJZaSHR5rMWsoXr5UhUl8z
 Zrbgox6c65DQllkrrl2TuP53zJxUT5zWNXNlNlJqUcjFfkqUliVx2nMwTH1hbaQp9xeXrBlBukV
 ART7joydTCxxus4Nmy81S3B1l1MFiAGP1I8/duLphaOeIAZUo7hJBM16CU4mEAmCxiOvGvdfFZo
 W7PTDBkILsEtfaNgvyosBfWrlsQCP513mOaszsZUea3v
X-Received: by 2002:a05:600c:1c1c:b0:4a2:1364:252b with SMTP id
 5b1f17b1804b1-4bb8892ac4amr58369045e9.35.1795168718396; 
 Fri, 20 Nov 2026 01:58:38 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm63073705e9.9.2026.11.20.01.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:37 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Romain Naour <romain.naour@smile.fr>
Date: Fri, 20 Nov 2026 10:58:32 +0100
Message-ID: <20261120095836.537844-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109135635.2181005-1-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: add swupdate runtime test
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
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Add a runtime test for swupdate using the default swupdate
> configuration.
> 
> An SWU image containing a single file, installed by the "rawfile"
> handler, is generated at build time with host-swugenerator. Since the
> default configuration has no crypto backend, the image is generated
> without hashes.
> 
> At runtime, the test checks that:
> - the swupdate daemon is started by the init script,
> - the embedded webserver serves the default website,
> - a dry run through swupdate-client does not install anything,
> - the SWU image is correctly installed through swupdate-client,
> - an invalid SWU image is rejected and the daemon keeps running.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2026.08.x. Thanks

> ---
>  DEVELOPERS                                    |  2 +
>  .../testing/tests/package/test_swupdate.py    | 46 +++++++++++++++++++
>  .../tests/package/test_swupdate/post-build.sh | 14 ++++++
>  .../package/test_swupdate/sw-description      | 16 +++++++
>  .../package/test_swupdate/swupdate-test.txt   |  1 +
>  5 files changed, 79 insertions(+)
>  create mode 100644 support/testing/tests/package/test_swupdate.py
>  create mode 100755 support/testing/tests/package/test_swupdate/post-build.sh
>  create mode 100644 support/testing/tests/package/test_swupdate/sw-description
>  create mode 100644 support/testing/tests/package/test_swupdate/swupdate-test.txt
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 848307a0ba..e1f629ed34 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1373,6 +1373,8 @@ F:	package/wilc-driver/
>  F:	package/wireshark/
>  F:	package/zlib-ng/
>  F:	support/testing/tests/package/test_swugenerator.py
> +F:	support/testing/tests/package/test_swupdate.py
> +F:	support/testing/tests/package/test_swupdate/
>  F:	toolchain/
>  
>  N:	Graeme Smecher <gsmecher@threespeedlogic.com>
> diff --git a/support/testing/tests/package/test_swupdate.py b/support/testing/tests/package/test_swupdate.py
> new file mode 100644
> index 0000000000..7092cb3309
> --- /dev/null
> +++ b/support/testing/tests/package/test_swupdate.py
> @@ -0,0 +1,46 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestSwupdate(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_SWUPDATE=y
> +        BR2_PACKAGE_HOST_SWUGENERATOR=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(infra.filepath("tests/package/test_swupdate/post-build.sh"))
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check the swupdate daemon was started by the init script
> +        self.assertRunOk("pidof swupdate")
> +
> +        # Check the embedded webserver serves the default website
> +        self.assertRunOk("wget -q -O - http://127.0.0.1:8080/ | grep -qi swupdate")
> +
> +        # A dry run must succeed without installing anything
> +        self.assertRunOk("swupdate-client -d /root/test.swu", timeout=30)
> +        self.assertRunNotOk("test -e /tmp/swupdate-test/swupdate-test.txt")
> +
> +        # Install the SWU image through the daemon
> +        self.assertRunOk("swupdate-client /root/test.swu", timeout=30)
> +
> +        # Check the file was installed by the rawfile handler
> +        out, ret = self.emulator.run("cat /tmp/swupdate-test/swupdate-test.txt")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], "Hello from SWUpdate!")
> +
> +        # An invalid SWU image must be rejected
> +        self.assertRunOk("echo garbage > /tmp/bad.swu")
> +        self.assertRunNotOk("swupdate-client /tmp/bad.swu", timeout=30)
> +
> +        # The daemon must still be running after a failed update
> +        self.assertRunOk("pidof swupdate")
> diff --git a/support/testing/tests/package/test_swupdate/post-build.sh b/support/testing/tests/package/test_swupdate/post-build.sh
> new file mode 100755
> index 0000000000..ea08c863ae
> --- /dev/null
> +++ b/support/testing/tests/package/test_swupdate/post-build.sh
> @@ -0,0 +1,14 @@
> +#!/usr/bin/env bash
> +set -e
> +
> +SWU_SRC_DIR="$(dirname "$0")"
> +
> +# Generate the SWU image to be installed by the runtime test. The
> +# default swupdate configuration has no crypto support, so do not
> +# store hashes in sw-description.
> +"${HOST_DIR}"/bin/swugenerator \
> +	--no-hash \
> +	--sw-description "${SWU_SRC_DIR}"/sw-description \
> +	--artifactory "${SWU_SRC_DIR}" \
> +	--swu-file "${TARGET_DIR}"/root/test.swu \
> +	create
> diff --git a/support/testing/tests/package/test_swupdate/sw-description b/support/testing/tests/package/test_swupdate/sw-description
> new file mode 100644
> index 0000000000..b38a04860f
> --- /dev/null
> +++ b/support/testing/tests/package/test_swupdate/sw-description
> @@ -0,0 +1,16 @@
> +software =
> +{
> +	version = "1.0.0";
> +	description = "Buildroot runtime test update";
> +
> +	files: (
> +		{
> +			filename = "swupdate-test.txt";
> +			path = "/tmp/swupdate-test/swupdate-test.txt";
> +			type = "rawfile";
> +			properties = {
> +				create-destination = "true";
> +			};
> +		}
> +	);
> +}
> diff --git a/support/testing/tests/package/test_swupdate/swupdate-test.txt b/support/testing/tests/package/test_swupdate/swupdate-test.txt
> new file mode 100644
> index 0000000000..924abe196a
> --- /dev/null
> +++ b/support/testing/tests/package/test_swupdate/swupdate-test.txt
> @@ -0,0 +1 @@
> +Hello from SWUpdate!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
