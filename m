Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C80C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 13:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 679FE83ED9;
	Fri, 16 Feb 2024 13:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBf1ZDGZWXVB; Fri, 16 Feb 2024 13:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6224983EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6224983EDA;
	Fri, 16 Feb 2024 13:23:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8101BF395
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 13:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D1A383EDA
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 13:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oUaSCetUdPF for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 13:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40B7283ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B7283ED9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40B7283ED9
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:23:35 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1B8842C80CDD
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 14:23:32 +0100 (CET)
Message-ID: <10542b7e-f7d5-4197-ae19-ba94706c6595@bubu1.eu>
Date: Fri, 16 Feb 2024 14:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240216131815.318315-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20240216131815.318315-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708089812; bh=IKRAbFBN7NC7ec9ZoG0qsOJ7/KKHz5498bsCjyLsME4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=fcoxKANQkdabOupT9hH/EYW3yehiOj7aDHUlZSUTYJQCgequ8BGemJGdHqRam0gch
 wioySIRPo6Rf5cMpCbNYbDzLnlYTIwgvRJuoaNRp5HfV0PD1BoVkHQVnfFDvUfi+u4
 rxIhL+TNVFd1ZAtQo3VsV1yT7lxgRrILBon6JXHPWYn9L5Mb9r/Ix+ZW88N/IpA4Ij
 OFDHi+4SZE4tOuwiAlwF5a/JzJUYrtvgtE0xr/KaePiGKu31OOBMQiPvZriCtUXCNp
 U++KivmvqRtXv+A7Ww6EOhVee/sOJxgjhz+8PQQhe7Fzq1a746KfyrIu3pO2hYexb5
 c10qKhvj1olGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=fcoxKANQ
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: remove hardcoded sleep
 from python-django test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16.02.24 14:18, Marcus Hoffmann via buildroot wrote:
> Instead of waiting for a hardcoded time of 30s we check periodically every
> second if the server is already up. If it isn't up after the full timeout
> (which is the same as before) expired the test fails.
> 
> We need to redirect all output of the background started task to
> /dev/null now as it otherwise confuses the emulator.run() exit code
> parsing logic (as it gets out of order messages from the emulator).
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   .../tests/package/test_python_django.py        | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
> index e1ca50f6d8..0973467a2a 100644
> --- a/support/testing/tests/package/test_python_django.py
> +++ b/support/testing/tests/package/test_python_django.py
> @@ -1,3 +1,5 @@
> +import time
> +
>   from tests.package.test_python import TestPythonPackageBase
>   
>   
> @@ -16,13 +18,17 @@ class TestPythonDjango(TestPythonPackageBase):
>           self.assertIn("Operations to perform:", output[0])
>           self.assertEqual(exit_code, 0)
>   
> -        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
> -        # give some time to setup the server
> -        cmd += "sleep {}".format(str(30 * self.emulator.timeout_multiplier))
> +        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 > /dev/null 2>&1 & "
>           self.assertRunOk(cmd, timeout=timeout)
> -
> -        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
> -        self.assertRunOk(cmd)
> +        # give some time to setup the server
> +        for attempt in range(30 * self.emulator.timeout_multiplier):
> +            time.sleep(1)
> +            cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
> +            _, exit_code = self.emulator.run(cmd)
> +            if exit_code == 0:
> +                break
> +        else:
> +            self.assertTrue(False, "Timeout while waiting for django server")
>   
>   
>   class TestPythonPy3Django(TestPythonDjango):

The django test (and the whitenoise test introduced in the next patch) 
actually both currently fail because of a problem with django 5.0 and 
.pyc only installations. [1]

This now has "release blocker" priority at django and a proposed patch 
(that I tested locally but hasn't been officially submitted to django 
yet) so hopefully this will be fixed with the next django point release 
in a couple of weeks.

[1] https://code.djangoproject.com/ticket/35187

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
