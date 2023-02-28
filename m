Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96927C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32FC161171;
	Tue, 28 Feb 2023 15:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FC161171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39I9ObU0IJnw; Tue, 28 Feb 2023 15:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 630E0611A3;
	Tue, 28 Feb 2023 15:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 630E0611A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC8EF1BF2AA
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6C82417D2
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C82417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiBYYw_6mcIw for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:52:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB4B41904
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EB4B41904
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:52:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D403100009
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:52:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pX2HW-009pbc-9M
 for buildroot@buildroot.org; Tue, 28 Feb 2023 16:52:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230207170040.3503236-1-peter@korsgaard.com>
 <20230207170040.3503236-2-peter@korsgaard.com>
Date: Tue, 28 Feb 2023 16:52:46 +0100
In-Reply-To: <20230207170040.3503236-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 7 Feb 2023 18:00:40 +0100")
Message-ID: <878rghkcs1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/dependencies/dependencies.sh:
 ensure git is >= 2.0.0 for vendoring
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The go vendoring fails on CentOS 7 (which uses git 1.8.3.1) with errors
 > related to shallow clones:

 > make docker-compose-source
 > ..
 > go: downloading github.com/matttproud/golang_protobuf_extensions v1.0.4
 > github.com/docker/compose/v2/pkg/mocks imports
 >         github.com/theupdateframework/notary/client imports
 >         github.com/docker/go/canonical/json: github.com/docker/go@v1.5.1-1.0.20160303222718-d30aec9fd63c: invalid pseudo-version: git fetch --unshallow -f origin in /home/jacmet/source/buildroot-mirror/output/host/share/go-path/pkg/mod/cache/vcs/48fbd2dfabec81f4c93170677bfc89087d4bec07a2d08f6ca5ce3d17962677ee: exit status 128:
 >         fatal: git fetch-pack: expected shallow list
 > make[1]: *** [/home/jacmet/source/buildroot-mirror/output/build/docker-compose-2.15.1/.stamp_downloaded] Error 1

 > It works with git 2.0.0 (released May 2014, included in Debian 8), so check
 > for >= 2.0.0 with logic similar to the GNU patch version check.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
