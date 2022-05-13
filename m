Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03BDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DEC60B69;
	Fri, 13 May 2022 20:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugF7Q3l_Mfak; Fri, 13 May 2022 20:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FFE360B32;
	Fri, 13 May 2022 20:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 100AC1BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 091CC827A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YX7mCJRdeg0s for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:54:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC6958278F
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:54:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6BC30FF802;
 Fri, 13 May 2022 20:54:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npcJ4-00BI32-4a; Fri, 13 May 2022 22:54:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
 <878rr6ahop.fsf@dell.be.48ers.dk>
 <d7ce3402-a37a-ca9b-52c5-1f85eeb79a7d@mind.be>
 <87wneq7yqf.fsf@dell.be.48ers.dk>
 <d31498c0-ae87-12ed-eae6-6efbd37bcca2@mind.be>
Date: Fri, 13 May 2022 22:54:38 +0200
In-Reply-To: <d31498c0-ae87-12ed-eae6-6efbd37bcca2@mind.be> (Arnout
 Vandecappelle's message of "Fri, 13 May 2022 21:42:00 +0200")
Message-ID: <87fsld886p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: yann.morin@orange.com, Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >  If you really need spaces, you can still use $(space). So,
 >> after
 >> >  adding single quotes, the following should work:
 >> > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="date;$(space)date"
 >> Nice and easy for newcomers :P

 >  Sure, but do you have an actual use case where you want spaces in the
 >  CMD or ENTRYPOINT? Note that even in the Dockerfile itself you need
 > to switch to JSON syntax to support that case. I think it's
 > exceedingly rare.

Sorry, what do you mean? If I have a silly container like:

FROM busybox

CMD for i in 1 2 3; do date; done

Then that works fine (as CMD expands to sh -c "<args>" if you don't use
the array format).

docker inspect <container> | jq '.[] | .Config.Cmd'
[
  "/bin/sh",
  "-c",
  "for i in 1 2 3; do date; done"
]


I don't think I have ever seen embedded spaces in ENTRYPOINT (but I have
seen multiple arguments), but in CMD I have.


 >  If you really have such complicated cases, you're probably better off
 >  doing it with a post-image script that imports the tarball after
 > all. But the simple case that covers 95% of the use cases can be
 > covered by fs/oci.

I would argue that just doing docker (or podman) import in the
post-image script is easier than fs/oci as people doing container stuff
are likely to already know docker and Dockerfiles, but oh well.


 >> >  That requires a docker daemon installed on the host, while
 >> >  sloci-image can be run as normal user without any host support
 >> > required.
 >> s/docker import/podman import/.

 >  So it requires a podman daemon installed on the host... podman can do
 >  rootless containers, but it's still mediated by the daemon.

No, podman is daemon-less.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
