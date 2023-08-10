Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF30C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446EC41DA3;
	Thu, 10 Aug 2023 20:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 446EC41DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ki0170mbZdco; Thu, 10 Aug 2023 20:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362FA41DA4;
	Thu, 10 Aug 2023 20:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362FA41DA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8771BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F6A083FB8
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6A083FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-ydLPuqzfEe for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:02:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9972083F57
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9972083F57
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.222.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1qHFQS0Fc3-00Vg01; Thu, 10
 Aug 2023 22:02:23 +0200
Message-ID: <660fedf5-d880-42a2-8243-9b1b530df95c@gmx.at>
Date: Thu, 10 Aug 2023 22:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230810090721.1e052f35@windsurf>
X-Provags-ID: V03:K1:jqHQrno0Y+OB8vNR26AKMhLSCE3upQAdnYbBSms9bhzkoN4wdSZ
 AN+WDsV9sXyoIqeGJjkydYPdbF2IyCcP3YhAjHTxW4ScY1Ea6LU///C+M8LFjroBA3UxJfy
 inzc7UigO9Z8ZiMgYP9rCw2QhAlpWBxzHCHLId+FCXPJ8zg/Jc32u0/GZWhuMSlBcriYqm5
 g17MbUY3DmNksEY2CKCNw==
UI-OutboundReport: notjunk:1;M01:P0:pFbhh/KQQHA=;fqen/obibJhpFjMJDuTdEZU8S72
 8Hq8znMRlj5M3FwVWVGdGH8JLFRcdaYQ+MYuPEZ/rIjZMb3/Hg8yQ/Uf6oHFx5PjimbfzIKCw
 gfbvH8wjvnuMYqjT4yrjcGLewB7gezPdQksYBMXYVwiQ6WnuFx5v2yP0i2IOGXY825eWJJBsI
 Jof1v9J5s3OuP/jbJJfu8E4OVz64c5lHqcQPmLQFGbb0hEt0q1Yuf1fxWovbqdyrIP11KWq0t
 CN0vVpt0N9bhA+1+xpwYkOCB1cq1pIIWKSiOjTW5iGxGUO9EhQqC9PsVs49P+xeh40eN6r9+X
 Edi4bxrryKanFqHkrfo0PXdje7zX2/nxHP4Spne5pwUYQjrD7XebzhHXWaMgZDMPxy4/PSnVB
 iDp/HqlY38Ssi/ou8otECS5XCRupfKNXL73fcCbUSIVlCSWtA9h0KLh56w866asvf1P42x79i
 qZaIOP2BLT7NF2AgTDXk5r5tCHbuuf/FN9SUbmdY3zKEBOPcLC4dxDk3tqQ63kC5hH7G9oRfO
 oxYpHIbvdqa0/R0Hy1tPXPQEJoW04D5RLffrmnmfuE0cHm6juesYDcF6a9/V8PPgAYkcn35KP
 6DQi9AQDeJx7v2BzE4FJETu4VJ2vo7nT+JEQYj3GwRQYCln5YLsOMLsT2C6EwPY15jWkGfesd
 acfNocSMkXmrC5GqONkmKreMXO7++eo/8eKIif/7V+zF70oNK89eQtdUpgHRZSwAuEjnNw/G6
 XhFsUOXH5U/z4hMaeZuNNYNZbfU5KXViUVB0WDGNBzw9TFml394lrSQ5EwsCj2XWYSVS82e0r
 hphNIP3Qnh9bk0T5QIJSr7xu6jztb7wk/fixFFXOq4Zh+x9SYp1Ow+KTJIii8TXC3UCWlqkKF
 ThRaEkcSHGqkMuuxO+G4mo3HgbXItmG3NZ7EKeChYWOVhFAXhhBYlCzNjWb7CkD8ghIxQSMBE
 hCAIO9jkoaLBNpcxD4jJhJyr4k8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691697743; x=1692302543; i=dalang@gmx.at;
 bh=PD08iNxciYYwN9A0gVOTyqv+CqzZknZwq9uEu8ooT6I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=B8r5ucP6yWPT2buI7aKZEBP85fP+9oSj8qb/6pEd7BY0+Xhrj89GiZ99uE9giBUlX0BlUBI
 ItvAOl6hM9ybOvFv0sQkhbsxfTyllftuwi1427cRmt9pbs6r0fzgq+ocmBtyL5rAmRL26OM2G
 DakJb66tkLTlI1bQhjgeerpqjw2aFFKZUEo7oHTvBbdI8fqy6Ot4zRrEK1ibpeRRxWRkGuclc
 yNeR7W2OthsrTX74GcLH6crd+lv1EYV7y5LYSFof6vuBmDRJw+AzPBAocjQnvAUA06fzzUcep
 xrfHS6NHTpHL2LQ668jJFWlb5qTrjmEoynCh9+jto00bQlzvq6Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=B8r5ucP6
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
Cc: buildroot@buildroot.org, clement.ramirez@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 10.08.23 09:07, Thomas Petazzoni wrote:
> Hello Daniel,
>
> On Thu, 10 Aug 2023 07:50:34 +0200
> Daniel Lang <dalang@gmx.at> wrote:>> On that "latest release" note, we have a second, probably rarely used,
>> use case for CPEs which is support/scripts/gen-missing-cpe.
>
> I'm not sure why you call that "second use-case".

Just wanted to point out, that we need the CPE database for more than
pkg-stats.
However gen-missing-cpe needs more fields per CPE (title, references,...)
whereas pkg-stats would do with just the CPE ID.

>
>> This script tries to generate a XML structure for each version that
>> isn't registered in the database. For this script a lot of
>> information about the CPE needs to be stored.
>
> The idea of this script was to be able to contribute new entries to the
> official CPE database, by generating the XML file that they require as
> input to contribute such new entries. I've never used it myself, and we
> would need to submit gazillions of new entries all the time to keep
> their CPE database up-to-date.

I think I understand its purpose as that what I implemented in the
updated version. However I'm not sure that's what the script is currently
doing. It seems to me, that files with existing entries are generated
and the replace logic doesn't work.

>
> It could still be useful to have something to contribute new entries,
> for those packages that have no entry at all (regardless of their
> version number) in the CPE database.

This use case is not supported by gen-missing-cpe. For now it only
generated xml files for packages that have older entries in the database.

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
