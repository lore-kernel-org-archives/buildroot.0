Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C11C001E0
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 14:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E02DB4049D;
	Tue,  1 Aug 2023 14:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E02DB4049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ArCwlsLUiMc; Tue,  1 Aug 2023 14:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02D414031F;
	Tue,  1 Aug 2023 14:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02D414031F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 543681BF2AA
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 14:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE3406115B
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 14:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3406115B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6oEfunbucY6 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 14:13:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E863C60F03
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 14:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E863C60F03
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.55.240] ([213.147.166.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1pZR323wnX-00v6xA; Tue, 01
 Aug 2023 16:13:04 +0200
Message-ID: <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
Date: Tue, 1 Aug 2023 16:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230731235236.60ddc54a@windsurf>
X-Provags-ID: V03:K1:Ywc4ges5y1iBQ6lZwrF+AxvHRLFA/pQcKmYjTrHQ7/WrduSkHXA
 4+LgKv8yee6dtIPF5D0RJYEuiAsh6Ec2sOeN+1QFE6hL1JrRvETs0oMZ+zIlkLqBrSN228G
 0KlTSoJM0or2pK7E/Z+MCdI/JijM4LMUkipcfHSA88lCPwrjalOyptjx125pSMc9jsYgscw
 thFpW7JK1VFKImPsYHmHw==
UI-OutboundReport: notjunk:1;M01:P0:+uYf58caEzE=;HLx+Tw+GLIktRZpk0QVzGH4zZtc
 ONHPKIifaFmVx+jRx62h8rTbD41Z3ZnN6wggNMM5cllplx4Wpqio7Mr9Y5nbqAeEVgXoAhEU2
 U/Y+DA8icuXZWjLs/F+jMbNJ6LRCTY9KrzqXKRDqzrs/dRfHfad0YwPNFwaxVMyc2FyqpoWTq
 AViEHgh1UAb6nPT+cYXzBZ8cZrZK7bssm+wiyGnWzD5KOUdqf+Gjv0oI8G9Bi1bHdvuQEkn+1
 fpu3Le0OJ9l4y03VZzJ9CZ46tSfQ8jr3izI6lHJbLIgJkNrnHSZQtjbzy8UEpV6rjuWT+b+HE
 /sdx0o9vlRhjDiJopuNxmPnxJc954GNm0MWC6jdIZoJqo2kcs90BphjSxTPGPcB8xqJQQEBom
 69v0YZ3fLJ5BzyIqsF4MmeAlUFqH9/Ac04vWVap5K11QcH48+djUk0v3mXJbKsmLcycrHjHnX
 6IIjRR2vgibxMVrQos9pS9Gk/O5B8U9AjmxS5WRi/87DjxtqTbqohSl1NUUAdBpFM8bQx3PJb
 kTJDwBX7myr1pwTssaJUc45Dcqd52f858+BQUxVLZvT7lxWgF+RqQ6I2PLaNkGu7sL9yvtNx/
 byiAxeAuAT6QyZKoqfwm3W8scjF0i20LI+r1ox7jMuH+T8KDuRQOsQWCa4VAi92Y94DjbDW3J
 gye/TD1ReLMTA3UF5rKzMwU/HBMY4kREM2MXAIyGbOjNbiWUrQmDZi7qG+3q9x/LNjGGTAAdX
 1eola2jluNKPTVPmxEwbJ5kP1vkwMeCUoEV8uOc5TpkbahQMHN9AE1FUDos6SFomPz0Vo5jPW
 MVquMjiRB9OGgZEibwTpwyFpo0tGwOo86ShEgZbkZsUgt4I/Q+nWTKtbBm+x5f3QhVA0RxPN6
 cWvZ4M7wf4QLC8RSdVeHaRAZKr5gYzv/5VnEZIv8BtXsKUMj201nmb5Aq83/vJI1N3ggHK5tS
 bCmhyHU0lbPzfWE2YjcD9pXNugQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690899184; x=1691503984; i=dalang@gmx.at;
 bh=AftiaWin91JC5sEQDWOSsD3wL8+auc6KU7KDz3bpbEE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jAGc6MAvwdbDZB+5FSuJNEtSZUF/NMg+cfUnbo6J37n2nLsCdRo7bdoSQM2MAuRfoNYKfIG
 0eWa0s1tjMpLCrz0+mbkCW6pfDkuNiysxlzgdJqw9EOiOpDhu0FgNNJFJyVFyw34X2t50OxuV
 IOYNmguCPO5wWRB1LZyGC+wra8MuUpH0tEkCb6Zbhwl5LdyPjtDDd2auqQKC+OUntd6Sf5dek
 q3/L+4S/O/M2iFAXGZBI7a/zJp9HY/wrWllZWjtwFg3efsfKulL+uhz2dL5QSCv7DpHIRbDbC
 82A59aNAwAqJ4y5TXm8/wSop3nv0CKzx0Y2pAK2OKp9nn+uYjuCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=jAGc6MAv
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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

Hello Thomas,

On 31.07.23 23:52, Thomas Petazzoni via buildroot wrote:
> Hello Daniel,
>
> On Mon, 31 Jul 2023 22:14:20 +0200
> Daniel Lang <dalang@gmx.at> wrote:
>
>> The currently used feed is deprecated and will be retired by NVD in
>> September 2023 [0].
>> The new API returns up to 2000 CVEs every 5 seconds (without API key) [1].
>> Instead of request individual years as with the feed, one can specify
>> two timestamps are range. Any CVE changed in this time is returned.
>> Therefore every single CVE is stored in a seperate JSON file.
>> All fields returned by the API are saved for future use.
>> This results in over 200000 files grouped by year with ~800MiB total.
>>
>> [0]: https://nvd.nist.gov/General/News/change-timeline
>> [1]: https://nvd.nist.gov/developers/start-here
>>
>> Signed-off-by: Daniel Lang <dalang@gmx.at>
>
> Wow, thanks for working on this! Is the storing of 200k files workable,
> or do we need to consider some other option like a local sqlite
> database or something?

From testing on my system I can say that it seems to be workable.
Generating pkg-stats for all packages takes roughly the same time

old: ./support/scripts/pkg-stats --html old.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   252,39s user 45,10s system 100% cpu 4:54,85 total
new: ./support/scripts/pkg-stats --html new.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   250,04s user 46,24s system 100% cpu 4:53,72 total

I did consider a sqlite database given that that's the approach yocto uses.
In the end I decided against it as I wasn't sure how future proof it would be.
The current approach means that additional information (score, description,...)
could be added or used for other purposes without having to download again.
Whereas I thought I had to make a selection for the database.
In hindsight I could have just added a column for every information available.

If there is concern I can see with I have the time to also implement a database
approach for comparison.

Not sure if updating would be faster with a database. It takes ~1.5 seconds
on my system to save the batch of 2k CVEs to file. But I guess the main bottleneck
is the API given that the initial download took upwards of 30 minutes during my
test runs and only ~2.5 minutes are spend creating files.

>
> Another question: did you do a run of "make pkg-stats" before and after
> your patch to compare the results in terms of CVEs reported for each
> Buildroot package?

I did. For a 1:1 comparison the sorting on line 185 has to be changed to
for cve_file in sorted(os.listdir(year_folder)):
Otherwise CVEs within a package are sorted differently making a comparison
very hard.
Running pkg-stats with this change generates identical reports:

diff old.html new.html
57505c57505
< <p><i>Updated on 2023-08-01 07:34:14.594976, git commit 22e476d7886163484d233803b42a2a4c2b588a5b</i></p>
---
> <p><i>Updated on 2023-08-01 08:40:33.290711, git commit 22e476d7886163484d233803b42a2a4c2b588a5b</i></p>

Additional information about sorting:
Currently the sorting done by NVD when creating the tar.gz is used.
NVDs sorts CVE-2023-10000 before CVE-2023-1000 which might not be ideal.
The new implementation adds custom sorting as we would otherwise
rely on the filesystem sorting.

>
> Thomas

One final note: I'm in no way a python expert, so any optimization or
general input is welcome.

Regards,
Daniel

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
