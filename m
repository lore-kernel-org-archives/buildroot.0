Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAEFECAAD4
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6548460E91;
	Wed, 31 Aug 2022 19:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6548460E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ya9rbtjrCuBn; Wed, 31 Aug 2022 19:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85BE26076C;
	Wed, 31 Aug 2022 19:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85BE26076C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEF161BF2BC
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8960F81341
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8960F81341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R76-A-_JiitM for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 19:42:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C40681304
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C40681304
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 19:42:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a07:37d4:42bb:3116])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A41F13FA37;
 Wed, 31 Aug 2022 21:42:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 31 Aug 2022 21:42:43 +0200
Date: Wed, 31 Aug 2022 21:42:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220831194243.GH68979@scaer>
References: <20220829171820.130690-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829171820.130690-1-marcus.hoffmann@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661974967;
 bh=ikNSAxZGjVBQ9Dcod88odK9zi9aVTC2D4ZGwbMNGsiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hrx1z0QQ3f35SribbY9rU9hybBgazJf3aMbAf23Ga7L2uHydegO3tjHloWch8Do33
 hHtheSOrW+Azo8Tft+UKDOTVjqhyML5RoGUTFX84PT7z6Y+UjSXEyPKAyNvtNvu7Qj
 ZdraYuRQVeCaGK7RyCrvnCSg3Tb57pauT3JpWS+gNWFYsHcvwLTqacguRKTNy6tzz1
 /xaAgpgz//HXQth+Qrc4vY5uCMgaqMEo4mOpSkACfeSqqLruKLF09s4mB8c0N9emo9
 awe+9PZAW9MdRQdvJfCcvqFIciZizSFlcIXN3blWb8ZQUauW9NupE6cIsNqPOSpoY4
 cu6BX5zpH0WXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hrx1z0QQ
Subject: Re: [Buildroot] [next v2 2/2]
 support/testing/tests/package/test_python_paho_mqtt: new runtime test
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2022-08-29 19:18 +0200, Marcus Hoffmann spake thusly:
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
> new file mode 100644
> index 0000000000..b1e2b8fb42
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_paho_mqtt.py
> @@ -0,0 +1,29 @@
[--SNIP--]
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +        cmd = "mosquitto > /dev/null 2>&1 &"
> +        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)

No need to manually start it, it is already started with a startu
script, as can be seen n the run log:

    Starting mosquitto: OK

And indeed, manually running the qemu on the test image, and trying to
launch mosquitto yields an error:

    [...]
    Starting network: OK
    Starting mosquitto: OK

    Welcome to Buildroot
    buildroot login: root
    # mosquitto
    [...]
    11: Opening ipv4 listen socket on port 1883.
    11: Error: Address already in use
    11: Opening ipv6 listen socket on port 1883.
    11: Error: Address already in use

So I dropped, that.

> +        # Give some time for mosquitto broker to start up
> +        time.sleep(1)

And thus, that too.

> +        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
> +        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)

The test class does not provide its own timeout, so it inherits the one
from its base classs, which defines it as -1, which means no timeout, as
is the default for emulator.run(), so I also dropped it.

Applied to master with the above changes, thanks.

Regards,
Yann E. MORIN.

> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], "Hello, World!")
> -- 
> 2.25.1
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
