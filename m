Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61375EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA4E61222;
	Tue, 22 Aug 2023 19:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA4E61222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6vDePnmSA9Q; Tue, 22 Aug 2023 19:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3924361224;
	Tue, 22 Aug 2023 19:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3924361224
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B798B1BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 446086122C
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446086122C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCbNo3-90KY9 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:22:45 +0000 (UTC)
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8850A61216
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8850A61216
Received: from [192.168.50.162] ([146.241.122.243])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YWxcqBDQqaHc9YWxdqiUVa; Tue, 22 Aug 2023 21:22:41 +0200
Message-ID: <043c43d7-63a1-143c-aa75-a0f751b2ef6b@benettiengineering.com>
Date: Tue, 22 Aug 2023 21:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230814145413.2099039-1-giulio.benetti@benettiengineering.com>
 <20230822202821.4b750d61@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230822202821.4b750d61@windsurf>
X-CMAE-Envelope: MS4xfImz7XAqiGJeIf2r3z+CEVbjo9T1KhzipDdCIdOtaf/U5mcmk2rjSMlnrjL/ykRHHdbdBkPcg2109U+mRNPOsioY2itiOsAgYdXw7aH0xrZGZCw90l0v
 VKCpSdYSbuDMlInNZOnUmHnF7z7gDL0Ou+HQ0NFOuR8dv+dqDQ0ZwKbWV60r1Kl7wZHjQjHBQq9cbaBbaHvsrjHLulIgoABOICecEMoHVz+gJWSptsB+P3XE
 bE0ikn7LnhrtLiuVbiFyxHv/dZWzGxpF+1mXhPEmn0jHEvr0GRjTBBiHXxZFCLmZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692732161; bh=2ZMocCcNHw0cCeEWhnTfAk52W0vmAEC73KTroQIxSHs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=O7XCP1sLXByxzJ02IgozECx1nmXsC+duKylBh4GcPsTyqtQZYFird7MEGHpvqP2EN
 xY+CdAxeXY7gbtsCUEQrlsnbkNRrIg005JTNkFAScnZqGPpJI3CH8yWxKltoZ7W19L
 Yf22oqs6I+d9zINlkqTPMJyrh31XrRwPZYXR05p2zKeQpIsU4Md3X71cCV+3ViqkY+
 CwZmSbAKrOSt08OlMCusF7ESqVyn5K2/M7D1iNWqr+bHuxwJgKkUlcpnBSbqiwC7uZ
 dd3ZQ1ILLJ5aSl8tUmvvMN6xxHPDqq2MnfAnvCQnb26bHXRxGJQj0wTDNjF+dxP6U8
 NU5G2iLvnSGTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O7XCP1sL
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.16.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/08/23 20:28, Thomas Petazzoni via buildroot wrote:
> On Mon, 14 Aug 2023 16:54:13 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Let's drop local patch that has been upstreamed:
>> https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...est-applications-for-cross-compiler-.patch | 43 -------------------
>>   package/libfuse3/libfuse3.hash                |  2 +-
>>   package/libfuse3/libfuse3.mk                  |  2 +-
>>   3 files changed, 2 insertions(+), 45 deletions(-)
>>   delete mode 100644 package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
> 
> Trying this, I get:
> 
> ERROR: libfuse3-3.16.1.tar.gz has wrong sha256 hash:
> ERROR: expected: 75a7140ce2d4589eda2784d2279be9d2b273a9b6b0f79ecb871dc4dded046fb5
> ERROR: got     : 17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Are you sure you tested it? 

yes I did,

> If you still have the original tarball with
> hash 75a7140ce2d4589eda2784d2279be9d2b273a9b6b0f79ecb871dc4dded046fb5,
> please keep it around, and compare it with the current tarball of hash
> 17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693, so we
> can understand if it's upstream that re-uploaded a different tarball.

I still have that tarball, and indeed they very different each other.
In the new version they dropped entirely the doc/html folder while
instead adding some .gitignore file, the .github folder for CI/CD and
a script called make_release_tarball.sh

They don't mention on their Github repository[1] they've changed it, but
they did it.

Anyway I've just sent V2 patch to correct the hash failure.

[1]: https://github.com/libfuse/libfuse/releases

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
