Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1232C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 17:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE848400F1;
	Sun,  4 Aug 2024 17:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JFHbxKvgr75; Sun,  4 Aug 2024 17:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921FC40342
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921FC40342;
	Sun,  4 Aug 2024 17:34:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED2111BF340
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 17:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6F8F40342
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 17:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cj72L7lLQOvj for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 17:34:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52034400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52034400F1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52034400F1
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 17:34:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 39F31780372;
 Sun,  4 Aug 2024 19:34:50 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54406])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Aug 2024 19:34:50 +0200
MIME-Version: 1.0
Date: Sun, 04 Aug 2024 19:34:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240728161944.7ef214e3@windsurf>
References: <20240719173723.546583-1-ju.o@free.fr>
 <20240722151314.6abebd25@windsurf>
 <c5c3fd836f9f7f503c31ebf1d555453d@free.fr>
 <20240728161944.7ef214e3@windsurf>
User-Agent: Webmail Free/1.6.7
Message-ID: <644363c1b32b75633da922333b075c8e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722792891;
 bh=T9FUSWm/PLFLb4y5UhKZnH2BspRf0KYTkWVkTYcrrdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dGNRIMHozMKHbUOCAw2ks7JDP8hDfU/2Eaf5PUlHafC96pWNnrMeIa9c85ryTe7Mo
 vOHLwXJprwA/PMH/2rTZfBI8fdXL11YsPPDlJvSx4hgT5RmBh2GYNLlxdKefWq8zTH
 /EtatiUZe4/Md+H2dC9Kf4qTwSGzmTyrBgagBpxohRt6a/CWtAzMkh/3yvHV/SrywC
 62I9IFnMo5JZT8UEb0IjHUwpHtZoGbDWybYNnELajZ60xO0gRdxYPOGLUTz8CDMILm
 NQhZU4DlfzBmHANANVIGJo+6UnZp34kVLJMIHfwWzxj3xN0MobBzZ6IJMLtRzinOYP
 olMUONtmdLfzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dGNRIMHo
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 28/07/2024 16:19, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sun, 28 Jul 2024 15:09:38 +0200
> Julien Olivain <ju.o@free.fr> wrote:

[...]

>> Before continuing debugging, I would like to see other executions
>> in the CI.
> 
> From what I can see, the previous runs of our test cases in the CI did
> not encountered any issue with the Kexec test, so it could indeed be a
> spurious issue.
> 
> Did you know that you can also run the runtime test cases in Gitlab CI
> on your side? You need a Gitlab account of course, then fork the
> Buildroot repo in your Gitlab account, and push a branch to your Gitlab
> Buildroot repo that has a name like this:
> whateveryouwant-tests.package.test_kexec.TestKexec and tada, it will
> run the kexec test in Gitlab CI. This is documented at "22.7.3. Runtime
> tests and Gitlab CI"
> in https://buildroot.org/downloads/manual/manual.html.

Yes, I was aware of this functionality (from the manual). I quickly
tried it a while back, and was not able to make it work. At that time,
I thought this CI was limited to paid users, or gitlab users having
their own runners (which I don't have), or Buildroot maintainers
(i.e. project members).

Reading your explanation here, and reading again the Buildroot
documentation at:
https://nightly.buildroot.org/manual.html#_runtime_tests_and_gitlab_ci
I now understand I should be able start CI jobs on my own.

I tested again (a bit harder this time) with this Kexec runtime test
as you described. After resolving few (GitLab) issues I was finally
able to make it work. For example:
https://gitlab.com/jolivain/buildroot/-/jobs/7455292795

I will propose some Buildroot documentation updates. I hope this
will help more users to use this nice feature. Specifically:

- write explicitly this CI works with a "Free" gitlab user account.

- add a note to make sure "GitLab Instance Runners" are enabled
   in the forked project. In my case, they were disabled.

- add a note about setting the job timeout. In my case, it was
   set to "1h", which was too short in many cases. Right now, I've
   set 4h for simple tests.

- document all the other recognized branch name formats by the script:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.05.1/support/scripts/generate-gitlab-ci-yml?ref_type=tags#L60

Thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
