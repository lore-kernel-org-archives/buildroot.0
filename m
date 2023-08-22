Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A5FEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEA560A65;
	Tue, 22 Aug 2023 19:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBEA560A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjDeenij-MC3; Tue, 22 Aug 2023 19:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B3F607F1;
	Tue, 22 Aug 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B3F607F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23F391BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06189607F1
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06189607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRRDLlwwzB6p for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:34:43 +0000 (UTC)
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46D3D605AF
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D3D605AF
Received: from [192.168.50.162] ([146.241.122.243])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YX9DqBLvxaHc9YX9EqiWkO; Tue, 22 Aug 2023 21:34:40 +0200
Message-ID: <d440e7a8-da14-2db2-a17d-a38f548bd562@benettiengineering.com>
Date: Tue, 22 Aug 2023 21:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230814145413.2099039-1-giulio.benetti@benettiengineering.com>
 <20230822202821.4b750d61@windsurf>
 <043c43d7-63a1-143c-aa75-a0f751b2ef6b@benettiengineering.com>
 <20230822212341.490c9910@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230822212341.490c9910@windsurf>
X-CMAE-Envelope: MS4xfIAXbTubuYk/zHqniXuC6JPY251aum7nqzyyTcj1bYSMJ5Q0PEravxYuPpDN6yPlO8WBn88AsFm8EjmM1u6LPWfWcAfrIuAPvWYLNeU8dY4/ZoisYjZf
 4ILNcu4n1j5IUxRULmN+vXalelvPTxgqwz0SIOziG7a9cLkYDMIb6sYZKTOVrXpoLVFBzM2t5oMt7SBh7WiKnaJK87E3k4Hg4zb0S6lvU/fQjDrtF28+K56x
 YgkBSaIMmBSjKqbS3uGPw4Erws6DBSuIHngGNBXjc4qBZC1lx8pgU1RDASTwghhl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692732880; bh=m2otATe1yCqqgUM6zKsM0WcmQJ94Sfgv8kKeXYUjVzo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=LxSDx4sv5tg3Nt3dhie+5JA0b3KAYZHiLIouFnSk7cE6plm7wh/H7ElxG2zEBVozq
 LKnP/MikznhHuDwk478LbO7ON4QnvdKToh1wEv2phdD4qQLiTYtaPF9Cf9bCigh3QT
 A3rYdPGcZ/jTLcKuy6Zvy1OuYXpA6ia7XsQt1eW1zGNkyFCwutaYGjTFcK6gMEce5+
 SmS1pcPKEafIErM16tFh/OAreKOZOSTWviAPgKYwktfhuGLaz8qLx7w9z94gc2Hjcj
 9MQvdH1JCjwLRFeRkgiZnQdzz/tSfNfzLXFS+4mJ7uBxiJv+My2Mel8RiwyOjzB5n3
 B5Fk89dAGZPGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LxSDx4sv
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

On 22/08/23 21:23, Thomas Petazzoni wrote:
> On Tue, 22 Aug 2023 21:22:40 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> I still have that tarball, and indeed they very different each other.
>> In the new version they dropped entirely the doc/html folder while
>> instead adding some .gitignore file, the .github folder for CI/CD and
>> a script called make_release_tarball.sh
>>
>> They don't mention on their Github repository[1] they've changed it, but
>> they did it.
> 
> This is annoying. Could you let them know that it is a problem by
> filling an issue in their Github repo?

Done:
https://github.com/libfuse/libfuse/issues/829
I went very soft since when you open an Issue you get this template:
```
PLEASE READ BEFORE REPORTING AN ISSUE

libfuse does not have any active, regular contributors or developers. 
The current maintainer continues to apply pull requests and tries to 
make regular releases, but unfortunately has no capacity to do any 
development beyond addressing high-impact issues. When reporting bugs, 
please understand that unless you are including a pull request or are 
reporting a critical issue, you will probably not get a response.

To prevent the issue tracker from being flooded with issues that no-one 
is intending to work on, and to give more visibility to critical issues 
that users should be aware of and that most urgently need attention, I 
will also close most bug reports once they've been inactive for a while.

Please note that this isn't meant to imply that you haven't found a bug 
- you most likely have and I'm grateful that you took the time to report 
it. Unfortunately, libfuse is a purely volunteer driven project, and at 
the moment there simply aren't any volunteers.
```

judging from this Issue:
https://github.com/libfuse/libfuse/issues/816
I don't think it will change that much.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
