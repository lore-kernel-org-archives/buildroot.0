Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEE3ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800FC60BCC;
	Mon, 31 Oct 2022 22:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 800FC60BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsQ4UnvM8sUC; Mon, 31 Oct 2022 22:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A560760B8F;
	Mon, 31 Oct 2022 22:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A560760B8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31DBD1BF2F9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE3D660B8F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3D660B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOD_nCcxwmIO for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:02:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0473B6068B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0473B6068B
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:02:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA7151BF205;
 Mon, 31 Oct 2022 22:02:28 +0000 (UTC)
Date: Mon, 31 Oct 2022 23:02:27 +0100
To: Christian Stewart <christian@paral.in>
Message-ID: <20221031230227.222d7ad1@windsurf>
In-Reply-To: <20220904191010.200822-1-christian@paral.in>
References: <20220904191010.200822-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667253749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tu2Wk6eQLfMYtJ6IVvTvw8eY010mpO3Lc8MTp6dhcOE=;
 b=XPZ7AuhtIn03H2SuCtDxFF/mYR6iyakanFwH4Q88bK18+Hptbj3NAzevjsUZvD43Cs74C6
 PobVwFbLwTQQHbg9dSjrNA5EY4K7nEC47hdXZhrsmrw1Oz1V6LelKyO+clWYDRcB/mpBbV
 coGk/AvaeecWv7XjCl8EJrxtcdPE7lcPzy9h/W7ip+ag6pWE4onhktURfiXR8iOnEhZYaW
 dq9J7UY8LNYTKIoyPgczRTgIMxPCXON56JAZ3Tai+n04CHQ2y6zSt+TKgPqcKFSu+8cv6w
 jMB/P98fvz8EkrDY9tf4ln2c4Lx9Fxe5mAp1jIp6QS0fFdow1D5vzEP27cqPMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XPZ7Auht
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Sun,  4 Sep 2022 12:10:10 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> -$(eval $(python-package))
> +DOCKER_COMPOSE_BUILD_TARGETS = cmd
> +DOCKER_COMPOSE_GOMOD = github.com/docker/compose/v2
> +DOCKER_COMPOSE_LDFLAGS = \
> +	-X github.com/docker/compose/v2/internal.Version=$(DOCKER_COMPOSE_VERSION)
> +
> +define DOCKER_COMPOSE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/bin/cmd \
> +		$(TARGET_DIR)/usr/lib/docker/cli-plugins/docker-compose
> +endef
> +
> +$(eval $(golang-package))

It looks like this commit has broken our docker compose test case
(support/testing/tests/package/test_docker_compose.py). Indeed, this
test expects to be able to run a command called "docker-compose", which
no longer exists, so the test fails with:

# docker-compose up -d
-sh: docker-compose: not found
# echo $?
127

See:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828442
  https://buildroot.org.gitlab.io/-/buildroot/-/jobs/3249828442/artifacts/test-output/TestDockerCompose-build.log
  https://buildroot.org.gitlab.io/-/buildroot/-/jobs/3249828442/artifacts/test-output/TestDockerCompose-run.log

Could have a look and provide a patch to fix this test case?

Also, could you send a patch adding yourself in the DEVELOPERS file for
this test case, since you're often looking after Docker related topics
in Buildroot?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
