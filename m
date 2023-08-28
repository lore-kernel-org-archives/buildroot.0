Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095F7C83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 21:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5960260C11;
	Mon, 28 Aug 2023 21:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5960260C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlMSQznfn2oy; Mon, 28 Aug 2023 21:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 954F260BD0;
	Mon, 28 Aug 2023 21:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 954F260BD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68C141BF271
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 21:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E79760BD0
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 21:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E79760BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEXy_mg1L2H4 for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 21:59:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2338160BA0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 21:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2338160BA0
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC603240002;
 Mon, 28 Aug 2023 21:59:36 +0000 (UTC)
Date: Mon, 28 Aug 2023 23:59:35 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230828235935.4dcd6b5a@windsurf>
In-Reply-To: <20230627061104.9EB9285B2A@busybox.osuosl.org>
References: <20230627061104.9EB9285B2A@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693259977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igoAge5ta5Oj9VXNAL8zFsoBb5f8xs9C4oAKmPRiDRo=;
 b=ZsDdagnKxIsPeq80fhYo8wfQ5KDWdw5Y/sJSPmnCsAOcoHphG8YPk0J2PXZ+jeRFfYbF68
 0pSLxawptrOu3bvKnYDw5Xown7PMg+eDxlz33DCoqSfT8TKExuUG2n6zFMg7l97gEesWvq
 yaYHrxhauPRtM4NdJLb7IjGaQqE+q1LCQJasil9riGNAm13Ah+8ax3aWpPfE9ne/FOK0Ud
 NuW7VHsVvWf/kGuOI7RvDnC5so45oHoMIwx6VK11mknUzrT40+Gyo7dAWlU22NLsEG3mot
 RzGDtpRtMHStISjOEa+O9ji3QHcUiVaGCizJkcqyRJV5xbRVV9Rf1EaBZoX1yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZsDdagnK
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Tue, 27 Jun 2023 07:48:40 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=c97f27283b36ffc39dfb6223caee6055997b3234
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> For change log, see:
> https://git.savannah.gnu.org/cgit/dmidecode.git/tree/NEWS?h=dmidecode-3-5
> 
> Note: this patch also adds a comment about pgp signature verification in
> the hash file.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

FYI: this is a security bump, as it fixes
https://nvd.nist.gov/vuln/detail/CVE-2023-30630. "Dmidecode before 3.5
allows -dump-bin to overwrite a local file. This has security relevance
because, for example, execution of Dmidecode via Sudo is plausible."

Therefore, it needs to be backported to 2023.02.x and 2023.05.x, or
alternatively:

  https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=d8cfbc808f387e87091c25e7d5b8c2bb348bb206
  https://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=6ca381c1247c81f74e1ca4e7706f70bdda72e6f2

need to be backported. However, there are only 20 commits between
dmidecode 3.4 (which is in Buildroot 2023.02.x) and dmidecode 3.5
(which fixes this CVE):

484f8935b0fc768841f43fa388b191196b5e12fd (tag: dmidecode-3-5) Set the version to 3.5
8baf2f508c6eb5359f12c911a0d58b893c12f1ca Fix a build warning when USE_MMAP isn't set
b9ebecc6391c4ad36ce0088b93ca8333c2f05ee7 dmioem: HPE type 242: Fix ID on 32-bit systems
189ca352e9341778c21e95c27817574b2876ede7 Ensure /dev/mem is a character device file
8427888ccf068f2ae1105e0c9276a15191a16ee5 dmidecode: Use the right variable for -s bios-revision/firmware-revision
6ca381c1247c81f74e1ca4e7706f70bdda72e6f2 dmidecode: Do not let --dump-bin overwrite an existing file
d8cfbc808f387e87091c25e7d5b8c2bb348bb206 dmidecode: Write the whole dump file at once
39b2dd7b6ab719b920e96ed832cfb4bdd664e808 dmidecode: Split table fetching from decoding
11b168f206efe5b3ebe2f1e587fb3d816d6c4a6f dmioem: Avoid intermediate buffer (HPE type 216)
9d2bbd5db427b063da137d9016fe6628038334eb dmioem: Decode HPE OEM Record 216
3d6835047f80691678e5db3127f9d573956413f0 dmidecode: Drop the CPUID exception list
c1a2520433a31294fe9a0ccb52136d048f2d76e6 dmidecode: Add a --no-quirks option
67dc0b27d50e3986d5e7cd35ec25cc5901a2e9e9 dmidecode: Fortify entry point length checks
f8016734735486c99eacc1bca975913535905c1f dmioem: Typo fix (Virutal -> Virtual)
90d1323a8d14acbf32154c03074e3caf94b1e7a1 dmioem: Decode HPE OEM Record 242
f50b925c8d43ab2470fe750c49bd33c9a5f3bd1d dmioem: Update HPE OEM Record 238
ac24b672dee81cdbfb35b69b38459a1352dcbe8a dmioem: Decode HPE OEM Record 230
c3357b532941a8df387618e692e522cc7a43b3e8 dmioem: Fix segmentation fault in dmi_hp_240_attr()
a1a2258ffbe450e8561ee833787da9321fa734b0 dmioem: Decode HPE OEM Record 224
fb8766a9d26053b3ad5f6228ffaf09690b7cac90 NEWS: Fix typo

So getting dmidecode 3.5 in Buildroot 2023.02 and 2023.05 is probably OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
