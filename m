Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE476C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E676061D;
	Wed,  7 Aug 2024 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xisuc17VjM9q; Wed,  7 Aug 2024 21:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9FA9608D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FA9608D1;
	Wed,  7 Aug 2024 21:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B49B51BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A075580E7F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e99tvPADsKq0 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48381814B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48381814B6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48381814B6
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:09:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 86C5E780505;
 Wed,  7 Aug 2024 23:09:00 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51442])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 Aug 2024 23:09:00 +0200
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 23:09:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240807213558.4abc7e85@windsurf>
References: <20240615091612.9579-1-ju.o@free.fr> <Zm3Y7Fd-Zpga_LAv@landeda>
 <bad5f692bff295e22fdebc46c043a661@free.fr>
 <20240807213558.4abc7e85@windsurf>
User-Agent: Webmail Free/1.6.7
Message-ID: <e238dc68395d1c1cf415d9f133dae262@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723064942;
 bh=nkO4bS9cPstLfW0YQkhCc0hlVv7o3yCDS/H7R0jJKwM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cmt+wCvkqOTaJjwsUUA6kAcWRzC0e/9i8sSsiUah4dM1ttbJchQYd+7KI7rWEj1QC
 JsL8zfYSjbXzDCaq00wBujqEl0rEFF1Zx/fGEPidzts3eWiEo8+CMbIKgGFE8Knmgi
 2aOPO+BtB4oSKrTHZOHGShL9qTKsM5sJkansvAZEds4cOyxpWoJ+CdMWGeGHppZe41
 SBe3UriC4wcalgipPRtVkW801hwK+YOwLI10JNnPhMH+baf3fnuyWjYLrZ1C9IOgYR
 0KqBYoy2v8W2X2GMA9ZzfLqmOuE9ZPm8Mn1Z7xf9mdYBfoSJVcGjdZSVasL6hZeRki
 plO3sGKrV6ghw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cmt+wCvk
Subject: Re: [Buildroot] [PATCH 1/2] support/testing:
 test_audio_codec_base.py: new helper class
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 07/08/2024 21:35, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Fri, 21 Jun 2024 14:40:20 +0000
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> Renaming the "test_audio_codec_base.py" file to "audio_codec_base.py",
>> and the "TestAudioCodecBase" class to "AudioCodecBase" will not
>> prevent the test to be discovered by Nose2. This will prevent the file
>> and class to be selected at first. But if "__test__ = False" is not
>> present, it will still be indirectly loaded from the TestLame
>> import. This can be seen by adding "--log-level debug" in nose2
>> arguments.
>> 
>> While I do agree we could rename the file and class to better show the
>> intent this is an "abstract" class which does not include a test, I
>> think the "__test__ = False" needs to stay here to really prevent it
>> being loaded.
> 
> Apparently, not. Look at:
> 
>   
> https://patchwork.ozlabs.org/project/buildroot/patch/f57167b1488b3c5ad76362dd8bca1b12d281aa19.1696522656.git.yann.morin.1998@free.fr/
> 
> proposed by Yann. The abstract class doesn't start with Test, it
> doesn't have __test__ = false, and it isn't considered as a test by
> nose2.
> 
> Now, look at:
> 
>   
> https://patchwork.ozlabs.org/project/buildroot/patch/33ee4b08c20f9c4566cfe82c648f01599cab70b5.1696522656.git.yann.morin.1998@free.fr/
> 
> which uses multiple inheritance, doesn't defined __test__ = true, and
> is properly considered by nose2.
> 
> Could you have a look as to why this pattern wouldn't work for your
> audio codec situation?

I think the reason the test gets registered many times is because the
"abstract" class contains a test_run() function. The way nose2 scans
for test will search in all the class hierarchy. The only way to
prevent that for now is the __test__ = False.

We can see the selection of test if we add debug in nose2 discovery:

     nose2.discover(argv=[script_path,
                          "-s", test_dir,
                          "-v",
                          "--collect-only",
                          "--log-level", "debug"],
                    plugins=["nose2.plugins.collect"])

in support/testing/run-tests, and invoking with "run-tests -l".

The reason I've put a test_run() function in the abstract class is 
because
I would like to keep the same test sequence for all those audio tests.

Maybe nose2 discovery should not recurse in the class hierarchy? The 
only
way I to prevent that would be to modify the loader at:
https://github.com/nose-devs/nose2/blob/main/nose2/plugins/loader/discovery.py

Would you like me to propose a change of this nose2 behavior?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
