Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C97C5475B
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 16:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E6F415E0;
	Tue, 20 Feb 2024 16:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meo72wmjO730; Tue, 20 Feb 2024 16:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BBF415E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BBF415E3;
	Tue, 20 Feb 2024 16:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5B11BF5A6
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 16:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7801E415E3
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 16:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIGm6mBoDjy1 for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 16:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DAAA415E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DAAA415E0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DAAA415E0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 16:46:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 77D9613F8AE;
 Tue, 20 Feb 2024 17:46:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 17:46:49 +0100
Date: Tue, 20 Feb 2024 17:46:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZdTXef5Af2eBM9r1@landeda>
References: <20240216131815.318315-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240216131815.318315-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708447611;
 bh=EswQUQNvkPE1PiSr2stGzzxmMELKC8+UN0TIoZKJbsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2CmybKEzBuNGRUZKgXAsD9G1gF5feghv436MDDKPbNO2aGU2h9vDwpnyADYnwU+n
 wVQqb7YG8iV6uIna+Uwiuh1/I7pnNmYEHxQWj4+gKporefkZyGo63Vw0n+N3DPtRCe
 dopm32DMBn4ATi0Mt0lHLQFDpCtwHJSLfyCy/L/wWv6tNHG4KIqA9mHSVATMD0lrgA
 QpBvdwpQAI5NwT2CLqfMDmU0NJA/D3MfGt+7x63Ee6qPa6so1deSqkibjLI5iUMqH1
 mM9gev+i6V56BHm+Zp0IX9v3z7Ty81UVqzKxD4TNKLMHIx9m/ZlKXZDly65GuAde55
 zhmtX01+7L5Tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e2CmybKE
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-16 14:18 +0100, Marcus Hoffmann via buildroot spake thusly:
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
>  .../tests/package/test_python_django.py        | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
> index e1ca50f6d8..0973467a2a 100644
> --- a/support/testing/tests/package/test_python_django.py
> +++ b/support/testing/tests/package/test_python_django.py
> @@ -1,3 +1,5 @@
> +import time
> +
>  from tests.package.test_python import TestPythonPackageBase
>  
>  
> @@ -16,13 +18,17 @@ class TestPythonDjango(TestPythonPackageBase):
>          self.assertIn("Operations to perform:", output[0])
>          self.assertEqual(exit_code, 0)
>  
> -        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
> -        # give some time to setup the server
> -        cmd += "sleep {}".format(str(30 * self.emulator.timeout_multiplier))
> +        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 > /dev/null 2>&1 & "
>          self.assertRunOk(cmd, timeout=timeout)
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

I was not very happy that we test success against a constant that we
know is false; this does not look great..

Instead, I've slightly simplified the test: I dropped the else clause of
the for-loop, and added an asserEqual that the exit_code is indeed 0
after the loop.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  
>  class TestPythonPy3Django(TestPythonDjango):
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
