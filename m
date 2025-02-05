Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31799C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D043541674;
	Wed,  5 Feb 2025 10:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-B-99xkd4JX; Wed,  5 Feb 2025 10:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF6741603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF6741603;
	Wed,  5 Feb 2025 10:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4973512F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B10F4071B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjNmTPcqVPpR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68C8040181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C8040181
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68C8040181
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:41:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8562442E6;
 Wed,  5 Feb 2025 10:41:20 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:41:20 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, James Hilliard
 <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20250205114120.758c9da7@windsurf>
In-Reply-To: <20240216131815.318315-2-buildroot@bubu1.eu>
References: <20240216131815.318315-1-buildroot@bubu1.eu>
 <20240216131815.318315-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehhefgledtgeeuuefhgeeliedufeejvdegkeeukeehteejvdevhfelueehvddutdenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhopdgvmhhulhgrthhorhdrrhhunhdpmhhiuggulhgvfigrrhgvrdhsvggtuhhrihhthidpuddvjedrtddrtddruddpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhgsuhdurdgvuhdprhgtphhtthhop
 ehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghsrghfkhgrjeesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738752081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wt5uh3ZaMO04bGYDpxUeHmtouBcuK0+6IhanegHjBBI=;
 b=LivVDOmh0GX0rNYbjtd1I1gblWHBElVgsDQ8FfB7dA5yDWuAzwrhmurVbE5CAn8H/1U/Oh
 tyZHGk/V0L+b5ajYBnGIafK9EbWH7wZnPozfH5KI48bAWf1miMxyqRrdUtLQHV1KThqy6B
 znsQ78/SDRtEFN5QPf3pMd7eymqqPMHVSRMuNOnAvtY62RIYHtRejGCGvZ8NdJ3W4oPIzK
 Ec4TSTCc1A70UQM9axQyp9Uyno0c8pptiJg/xSR6zm2XAJfuC54e3OBSaW3XaLVRdBHVgK
 ZRTj3OxB02eEcDh5zKuRpL3b45IjR+6YiA+qvfX/QIeFCn80Ku/TSERaXALJzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LivVDOmh
Subject: Re: [Buildroot] [PATCH 2/2] package/python-whitenoise: new package
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

Hello Marcus,

Sorry for the huge delay in getting back to you.

On Fri, 16 Feb 2024 14:18:14 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> The test is using the django integration of whitenoise as it's the most
> common setup and allows to model the test case after the django one as
> well.
> 
> The setup we need to do is a bit more complicated though and follows
> the whitenoise getting started documentation [1].
> 
> We then request a .css file from the django admin app that is enabled
> by default in template project. Due to running django's development
> server with --nostatic we ensure that static file handling is taken over
> by whitenoise.
> 
> [1] https://whitenoise.readthedocs.io/en/stable/django.html
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

This causes some flake8 warnings, which I'm not sure how to fix. See
below.

> diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
> index 0973467a2a..ac1dc81359 100644
> --- a/support/testing/tests/package/test_python_django.py
> +++ b/support/testing/tests/package/test_python_django.py
> @@ -36,6 +36,7 @@ class TestPythonPy3Django(TestPythonDjango):
>      config = TestPythonDjango.config + \
>          """
>          BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON3_PY_PYC=y
>          BR2_PACKAGE_PYTHON_DJANGO=y
>          BR2_PACKAGE_PYTHON3_SQLITE=y
>          """

When resending, please drop this chunk.

> diff --git a/support/testing/tests/package/test_python_whitenoise.py b/support/testing/tests/package/test_python_whitenoise.py
> new file mode 100644
> index 0000000000..ff9bcf5ee7
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_whitenoise.py
> @@ -0,0 +1,41 @@
> +import time
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Whitenoise(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_DJANGO=y
> +        BR2_PACKAGE_PYTHON_WHITENOISE=y
> +        BR2_PACKAGE_PYTHON3_SQLITE=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        timeout = 35
> +
> +        cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
> +        self.assertRunOk(cmd, timeout=timeout)
> +        # STATIC_ROOT needs to be set for 'collectstatic' to work.
> +        self.emulator.run("echo 'STATIC_ROOT = BASE_DIR / \"staticfiles\"' >> /opt/testsite/testsite/settings.py")
> +        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py collectstatic"
> +        self.assertRunOk(cmd, timeout=timeout)
> +        # whitenoise docs say it needs to be added directly after SecurityMiddleware, so we do this here with sed.
> +        cmd = """sed -i -e /django.middleware.security.SecurityMiddleware/a\ \\"whitenoise.middleware.WhiteNoiseMiddleware\\", /opt/testsite/testsite/settings.py"""

flake8 doesn't like this:

support/testing/tests/package/test_python_whitenoise.py:27:76: W605 invalid escape sequence '\ '
support/testing/tests/package/test_python_whitenoise.py:27:133: E501 line too long (164 > 132 characters)

I tried to use the "r" prefix for the string, which gets rid of the
first warning, but then it doesn't do the right thing on the target.

> +        self.assertRunOk(cmd, timeout=timeout)
> +        # --nostatic ensures the builtin django server doesn't serve the static files,
> +        # so we can test that whitenoise serves them
> +        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver --nostatic 0.0.0.0:1234 > /dev/null 2>&1 & "
> +        self.assertRunOk(cmd, timeout=timeout)
> +        # give some time to setup the server
> +        for attempt in range(30 * self.emulator.timeout_multiplier):
> +            time.sleep(1)
> +            cmd = "wget http://127.0.0.1:1234/static/admin/css/base.css"
> +            _, exit_code = self.emulator.run(cmd)
> +            if exit_code == 0:
> +                break
> +        else:
> +            self.assertTrue(False, "Timeout while waiting for django server")

Could you replace self.assertTrue(False, "Timeout while waiting for
django server") with the logic that used in test_python_django.py, ie:

        for attempt in range(30 * self.emulator.timeout_multiplier):
            time.sleep(1)
            cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
            _, exit_code = self.emulator.run(cmd)
            if exit_code == 0:
                break
        self.assertEqual(exit_code, 0, "Timeout while waiting for django server")

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
