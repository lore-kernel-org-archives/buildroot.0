Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191DAC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD11E813C9;
	Fri,  2 May 2025 10:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgPFXhQeZ5v4; Fri,  2 May 2025 10:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8AD813AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8AD813AC;
	Fri,  2 May 2025 10:48:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0537CEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAC34090D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nybTZLP-Sn0a for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:48:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01F2E40906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F2E40906
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01F2E40906
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB9861C0D89; Fri,  2 May 2025 12:48:00 +0200 (CEST)
Message-ID: <65efc378-e4fa-4f72-853f-838f3a197e03@rnout.be>
Date: Fri, 2 May 2025 12:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250331200302.207790-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250331200302.207790-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182880; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=evobvupdFXERsN+8ldUjNeOi8t43P90jgEbxntYzRCc=;
 b=fjk8NGGvZqYqXK5oCjUEmMl+5lBaOIxbiv0pHB7w3jVNUkq4vXxmRp6VlDyBQQk6944NTi
 9uMcvWKWTnEp2qfr1jSPB3yDWww3HFCbrT3wSyIKJ/kDMBjMl6YkoKXa3fCaEU+tWVbfRv
 cz4HJY0OtcJglX5vSuQUf0SfPurqoPrTLP2IDAPrrWpL7xQ3SuH8YxjFuMh3/RZ/jrPKiN
 UIGkflsAoe4PB4SVivYiYgkCvAQPXbAK/NTnUV0cKxNZpSg0ACpKTAxt6QEquHkAjHyd+3
 wIdB3V2KcX6rvjIG9vrgfs1sCBG6mnYNOJXJgLmNrcneTo4GaH8YlflEvbg5UA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fjk8NGGv
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: weston: fix the weston
 shutdown test
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



On 31/03/2025 22:03, Julien Olivain wrote:
> Commit [1] "support/testing: improve weston test reliability" moved
> out the wait time from the emulator (to run on the test controller).
> 
> While doing so, the sleep time which was initially _after_ the
> "killall weston" invocation to in stop_weston() was incorrectly
> moved before the command invocation. In this state, the test can
> succeed on fast host computer running the test. But it will most
> likely fail on an average computer.
> 
> This commit fixes this issue by moving the sleep time after
> the command invocation.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/6561a5d773d8e159556e2b911b315e3b5a0b89b1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/package/test_weston.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index 2ed59a7f15..43b5240b2d 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -58,8 +58,8 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
>   
>       def stop_weston(self):
>           cmd = "killall weston"
> -        time.sleep(3)
>           self.assertRunOk(cmd)
> +        time.sleep(3)
>   
>       def test_run(self):
>           img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
