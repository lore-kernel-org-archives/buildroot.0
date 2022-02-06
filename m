Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9DAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 13:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3B618124F;
	Sun,  6 Feb 2022 13:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxxZPp2P7y57; Sun,  6 Feb 2022 13:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3951680E7E;
	Sun,  6 Feb 2022 13:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 036FC1BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E6780D4B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpDgHWyElSYx for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 13:58:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F6BD80C36
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 13:58:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 26A5E100004;
 Sun,  6 Feb 2022 13:58:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGi3f-0000DK-GG; Sun, 06 Feb 2022 14:58:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220206131758.28001-1-peter@korsgaard.com>
Date: Sun, 06 Feb 2022 14:58:27 +0100
In-Reply-To: <20220206131758.28001-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 6 Feb 2022 14:17:57 +0100")
Message-ID: <87tudcw0zg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: nfsiostat used python3,
 not python2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

s/used/uses/ in the subject naturally.

 > nfsiostat is a python3 script, so keep it if python3 is enabled and not
 > python2:

 > head -n 1 target/usr/sbin/nfsiostat
 >  #!/usr/bin/python3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/nfs-utils/nfs-utils.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
 > index 6a3a801359..44653e2707 100644
 > --- a/package/nfs-utils/nfs-utils.mk
 > +++ b/package/nfs-utils/nfs-utils.mk
 > @@ -114,7 +114,7 @@ define NFS_UTILS_REMOVE_NFSIOSTAT
 >  endef
 
 >  # nfsiostat is interpreted python, so remove it unless it's in the target
 > -NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
 > +NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON3),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
 >  define HOST_NFS_UTILS_BUILD_CMDS
 >  	$(MAKE) -C $(@D)/tools/rpcgen
 > -- 
 > 2.20.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
