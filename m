Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C88C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 903D540420;
	Mon, 11 Apr 2022 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQwbOqjgPxOS; Mon, 11 Apr 2022 20:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ED39403B8;
	Mon, 11 Apr 2022 20:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 267631BF32D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B06403B8
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 20:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vgb3WxN7WLFt for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 20:35:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC3FA4038E
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 20:35:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 35AF0FF807;
 Mon, 11 Apr 2022 20:34:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ne0kR-008AMu-Tg; Mon, 11 Apr 2022 22:34:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
 <87bkx7h299.fsf@dell.be.48ers.dk>
Date: Mon, 11 Apr 2022 22:34:55 +0200
In-Reply-To: <87bkx7h299.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 11 Apr 2022 21:02:42 +0200")
Message-ID: <874k2zgxzk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > @@ -55,7 +55,7 @@ var (
 >         // NOTE: The $Format strings are replaced during 'git archive' thanks to the
 >         // companion .gitattributes file containing 'export-subst' in this same
 >         // directory.  See also https://git-scm.com/docs/gitattributes
 > -       gitVersion   string = "v0.0.0-master+3df54a85234"
 > +       gitVersion   string = "v0.0.0-master+3df54a8523"
 >         gitCommit string = "3df54a852345ae127d1fa3092b95168e4a88e2f8"
 > // sha1 from git, output of $(git rev-parse HEAD)
 >         gitTreeState string = ""            // state of git tree, either "clean" or "dirty"

 > So the gitVersion field lost a digit. No idea how this could
 > happen. Looking at the file in the git repo I see that this is listed
 > as:

 > 	gitVersion   string = "v0.0.0-master+$Format:%H$"
 > 	gitCommit    string = "$Format:%H$" // sha1 from git, output of $(git rev-parse HEAD)

 > https://github.com/containerd/containerd/blob/main/vendor/k8s.io/client-go/pkg/version/base.go

 > So I guess something in github is wrongly expanding this $Format?

The format logic itself is part of git, as the export-subst attibute has
been set for base.go:

https://git-scm.com/docs/gitattributes

But why the two $Format:%H$ lines expand to different things and why it
has changed over time is unclear to me.

In any case, I've pushed a commit to 2022.02.x to adjust the hash to
what Github is now serving.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
