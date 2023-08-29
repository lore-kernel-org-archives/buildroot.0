Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D299C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 08:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A48740C53;
	Tue, 29 Aug 2023 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A48740C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_W1_NyrL_ue; Tue, 29 Aug 2023 08:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76BA40C39;
	Tue, 29 Aug 2023 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76BA40C39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C06391BF29D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 08:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9816C408B0
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 08:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9816C408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mD6b2IwCQDS for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 08:55:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35E1C40351
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 08:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E1C40351
Received: by mail.gandi.net (Postfix) with ESMTPSA id C727A1C0014;
 Tue, 29 Aug 2023 08:55:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qauVA-006iPL-T1; Tue, 29 Aug 2023 10:55:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230627061104.9EB9285B2A@busybox.osuosl.org>
 <20230828235935.4dcd6b5a@windsurf>
Date: Tue, 29 Aug 2023 10:55:08 +0200
In-Reply-To: <20230828235935.4dcd6b5a@windsurf> (Thomas Petazzoni's message of
 "Mon, 28 Aug 2023 23:59:35 +0200")
Message-ID: <87edjm5itv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/dmidecode: bump to version 3.5
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter,
 > On Tue, 27 Jun 2023 07:48:40 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> commit: https://git.buildroot.net/buildroot/commit/?id=c97f27283b36ffc39dfb6223caee6055997b3234
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> For change log, see:
 >> https://git.savannah.gnu.org/cgit/dmidecode.git/tree/NEWS?h=dmidecode-3-5
 >> 
 >> Note: this patch also adds a comment about pgp signature verification in
 >> the hash file.
 >> 
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > FYI: this is a security bump, as it fixes
 > https://nvd.nist.gov/vuln/detail/CVE-2023-30630. "Dmidecode before 3.5
 > allows -dump-bin to overwrite a local file. This has security relevance
 > because, for example, execution of Dmidecode via Sudo is plausible."

OK. Somewhat unlikely threat model expecting people to run dmidecode
-dump-bin on untrusted machines in directories with other files, but oh well.

 > So getting dmidecode 3.5 in Buildroot 2023.02 and 2023.05 is probably OK.

Yes, I'll do that. Thanks for the heads up!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
