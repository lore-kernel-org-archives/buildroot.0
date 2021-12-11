Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06782C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 22:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 629FE4238F;
	Sat, 11 Dec 2021 22:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDCIo8zApJW2; Sat, 11 Dec 2021 22:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAFAE41C5D;
	Sat, 11 Dec 2021 22:59:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779D51BF25F
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 22:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5927481970
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 22:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eheJTwpei5Lg for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 22:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0D5081959
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 22:59:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1E1E56000A;
 Sat, 11 Dec 2021 22:59:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwBKq-0006nd-9h; Sat, 11 Dec 2021 23:59:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211020203816.128986-1-romain.naour@gmail.com>
Date: Sat, 11 Dec 2021 23:59:20 +0100
In-Reply-To: <20211020203816.128986-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 20 Oct 2021 22:38:16 +0200")
Message-ID: <87y24q21fb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] gitlab-ci: use the Docker image from gitlab
 registry
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > From [1]:
 > "In November 2020, Docker introduced rate limits on pull requests from
 > Docker Hub [2]. If your GitLab CI/CD configuration uses an image from
 > Docker Hub, each time a job runs, it may count as a pull request."

 > Since then, some jobs in our gitlab-ci fail when this rate limits is
 > reached [3].

 > To avoid this rate limit, move our Docker image from dockerhub to the
 > registry provided by gitlab. Keeping the image from dockerhub would be
 > possible by using dependency proxy [4] but the gitlab registry is good
 > enough.

 > Tested on gitlab:
 > https://gitlab.com/kubu93/buildroot/-/jobs/1694863584

 > [1] https://docs.gitlab.com/ee/user/packages/container_registry/index.html
 > [2] https://docs.docker.com/docker-hub/download-rate-limit/
 > [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590417
 > [4] https://docs.gitlab.com/ee/user/packages/dependency_proxy

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
