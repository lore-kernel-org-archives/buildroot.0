Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D16CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC08A614E7;
	Sat, 16 Aug 2025 20:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1wcDm5f2Wxx; Sat, 16 Aug 2025 20:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0436560F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0436560F49;
	Sat, 16 Aug 2025 20:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C4D75
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA7760EA9
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55eS44vL5327 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B66D7605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B66D7605E6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B66D7605E6
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:12:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -599497234; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 16 Aug 2025 20:12:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1unNGp-00A6rI-2H;
 Sat, 16 Aug 2025 22:12:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Petr Vorel
 <petr.vorel@gmail.com>
References: <20250816193255.1429450-1-thomas.petazzoni@bootlin.com>
Date: Sat, 16 Aug 2025 22:12:55 +0200
In-Reply-To: <20250816193255.1429450-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 16 Aug 2025 21:32:55
 +0200")
Message-ID: <87frdrm3eg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=J1+ztb33O/9U3ReiK9Z0HFMtg0YqNEl6r4hqpIthiy7uFHT7rjaKKYkFLTgf8a2XiBfKFiI68fIxs9aKO3MXyVl+DKftM0CwCOYnptmhNjhxvzhpS+tMwV+ML+9uYCeGz3b44I4teJxFGZtqWq8OLc+QacqfIV+FxjgrS8YECLqar/PhTZ9H4klGOsrUFIhxdJk0F1YFbX+e4mQhkVuIgfgrB9J62PhppHnRONbzXmcokBSiw7A/+3bb97DNOLxdc6oAFDSaepFFUbIwiUKreMOXyCtdvN6/6ZgS+Q0oZjQK0TJfppHwPTdmm5XveD+g4rLliCiub6VDdN2HOC+9nQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=pjn6xWJRpfkbbvf1PWsmIbuLn5zcRJoR+Lh7UlCHwHg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=J1+ztb33
Subject: Re: [Buildroot] [PATCH] package/rpcbind: bump to version 1.2.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > List of commits between 1.2.7..1.2.8:
 > f979f1b8fa202cd0d6c352de0f2b64361ce5ea33 (HEAD -> master, tag:
 > rpcbind-1_2_8, origin/master, origin/HEAD) Release: 1.2.8
 > a9ecbb81940b23a4bb9814e126c1c1ae1db93b69 (tag: rpcbind-1_2_8-rc3)
 > rpcinfo: Removed a number of "old-style function definition" warnings
 > 8cc10d038c361f296b0a8e068c173acc33568997 rpcbind: Add -v flag to print version and config
 > 8ef2e504df6e5ec3321c0804a8c6684d781e7a84 man/rpcbind: Update list of options
 > 74da58dde5b1a1a7e54df1fb16315845195a69c0 (tag: rpcbind-1_2_8-rc2)
 > Comment out ListenStream=@/run/rpcbind.sock
 > b78689b8f1df42eb593dc3412698aa1b8aaa3532 [nfs/nfs-utils/rpcbind]
 > rpcbind: avoid dereferencing NULL from realloc()
 > fd1d5387de8078530d51eccf876afe6e6182b975 (tag: rpcbind-1_2_8-rc1) Move
 > rpbind's default configuration to /run verses /var/run
 > 7a6b1c58eee2e5fa74e3e4045c4950fbb4f8af0a Move rpcbind.lock to /run
 > be63348bd3dd9e69e151ff83f08f09e1a9df82bf systemd/rpcbind.service.in:
 > Want/After systemd-tmpfiles-setup
 > 626fd801a13cecd8eb79ac6e979c248d7214aad4 systemd/rpcbind.service.in:
 > Add various hardenings options
 > 511fc4f4bc5ca7b7c8dac877d590d0634e570e6d man/rpcbind: Add Files section to manpage
 > 31157ba6e60b0a8c4989010df8b1cf2aa673a86c systemd/rpcbind.service.in:
 > Add few default EnvironmentFile

 > So really not much.

 > While we're at it, let's add a sha1 hash provided directly by
 > Sourceforge, in addition to the locally calculated sha256.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
