Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F591606A324
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VKAr9zn5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=q/5JCPsm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC99811B2;
	Fri, 27 Nov 2026 08:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBKBYTNsAk98; Fri, 27 Nov 2026 08:44:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3D366811A8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795769068;
	b=fqIp9hR/l8Bh1xzu3x7EAJYRh9hg2XPVJEyNg54F8uCy/7w8jqoWS4FlU60gAC4TzkT7
	 3rPpwu67XNantE/C+c+7j9uRp5J/cO/oZhvWizYrWQ0IoSpHT4RpRkeDvV4wj9aYMOub7
	 YCkvivGXKA16lGO6jbP/DSr3mJqfN2LRSeQv5BY2XpyRo6dRmWZJmgXPCWxkJMO4Vbdv6
	 ZMxhvq1rrKuLOZi16+loqUJtr+JVXriFfSahpWXyEHEvh8sdo1qj0bRx6c5Y4KBsOxUfb
	 l/cwm5LknI5N1N0G9wzbQoYdNBMsCv0jBoowdtQA4BVSKkRk7FZYbXMOZHL8LPjRj+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QPIytHqVih4GL7T15eB5cK9esvnCgGanQuHoKIgFttI=;
	b=OdVNHKEjCEjdlC9QQqCjRH7D6Rm73t6Hwe0rgYxdgIbMQcLkPgF2wMyk+79grYD3Va16
	 DAmFq7M5Za2mNnzt9o5xTcRx9VofTqLzpNb2fIt3D+WyArGg3OVfjBbN82VxU/TskmlzW
	 k8+pgiTZUYOC976kx/4yH+VMy73x2EmA6QTnM8hUyFUvGbEVpQ2wVEvzeAD95dW3l9PYH
	 l7mNl1QGksLDsRRzqrSwN8Hx+Gqt2Q7vgmN8ikdrc5YAmaVlvX98jCtlvDyIMMafJ01g6
	 RnKbvGwYN6CCNTXy74Qcn73yrf5gRo8euXUlPc3kxL/FJVkJpFmUlPFLu5sOqVKBEHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795769068;
	bh=QPIytHqVih4GL7T15eB5cK9esvnCgGanQuHoKIgFttI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKAr9zn5xww+q6q7dpjndhCuJ7HXrUSIy9HhwdBLDYEkT4OBuF5XRe8le5arzaATV
	 Jos6KqJbWSoyNo0Vryy0YpSBQNAEjP0XAz5J1IGm9Vq99n4r9Iap8Yd9BgV2jNVBJF
	 sr+ZPaZeyNT0iKGeZykcNtCoi2ijB1BFXoEaVTO9JzIMBDoV8zkI1xgmnsfCglVBRA
	 MZQAno7tRAdqIiLBnYwh2IHKHdwDXnosn21k7dCpQpQkdoWUiA6rElSStinWPJ3vSn
	 E8Fic3DiIuBsxdfmMmhxwrN+l7BOUUq3jgkX/3FqoW68GpSSp3eOe2JeVju6uOwSF6
	 3/b41i7w+iiTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D366811A8;
	Fri, 27 Nov 2026 08:44:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB132BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A48760A63
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUQt3ynH0zn0 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 08:44:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5138460AC2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=q/5JCPsm
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5138460AC2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:44:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=q/5JCPsmJEfaTxY7KZ/9HXHJyp/2NkK/1h+5V0fT/wBwRhNoa5LOnfSyKLvXfVnM1rb3ggcbAQgVHfHd1TRvNLyanHJmIMJ68mPeH6x6iO2YLQIXU2kDAf76DZKpp/3K8ovHaDmQGZai5fi/KKYrhjhOyGcMNuNB8tH9vMVDWXEF0dHr34I1mul+AZ5Q02EMUUc7pF5Jrq99a2N3G5MWd35EKmOejmckXERldXckaoOlNTxoIT28DZuhvVyUrYULLSMXVh3SmE1HzgxTSv7BysYkoiaKgbvh4NM7Tf3zVY4PKwdtm38ViRVJutqeWKEdDMxraS5kfC4wWXJzncorJQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=2e4ydoWu1DI+awJbzGc59H70vMAJAwYlrJ/iNGdwbs8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1049021536; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 08:44:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xWrZ5-0000000EE1o-2eUK;
 Fri, 27 Nov 2026 09:44:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>,  Eric Le Bihan
 <eric.le.bihan.dev@free.fr>,  Fiona Klute <fiona.klute@gmx.de>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 26 Nov 2026 20:26:12 +0100")
References: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
Date: Fri, 27 Nov 2026 09:44:19 +0100
Message-ID: <8733smirz0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/eudev: S10udevd: wait for udevd
 before triggering events
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > start-stop-daemon starts udevd in the background and returns before
 > udevd listens to kernel events. The coldplug events generated right
 > after by "udevadm trigger" may then get lost, so that no module is
 > loaded at boot.

 >   Starting network: Waiting for interface eth0 to appear............... timeout!

 > Wait until udevd answers on its control socket before triggering the
 > events. The udevadm control command of eudev has no --ping option, so
 > use --start-exec-queue, which has no effect on a daemon whose queue is
 > already running.

 > While at it, return right away when udevd fails to start, as there is
 > no point in triggering events then.

 > Fixes: 41258a81948fddfa7fc8ac06b69d77fa051b744d ("package/eudev: refactor init script and rename it to S10udevd")

Sorry, I know this is already committed - But if the bug was introduced
by the move to backgrounding with start-stop-daemon, wouldn't it be
simpler to just drop the --background argument to start-stop-daemon and
instead ask udevd to background itself with -d like we did before?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
