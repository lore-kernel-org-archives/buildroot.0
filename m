Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5693EC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0564A60678;
	Fri,  7 Feb 2025 19:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AntV5Zc4ErM8; Fri,  7 Feb 2025 19:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF6360AAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF6360AAE;
	Fri,  7 Feb 2025 19:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06A08E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01DC284B74
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6mXckLO5qOF for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0871D84B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0871D84B73
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0871D84B73
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:48:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40E204439A
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:48:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tgULO-000Fki-21
 for buildroot@buildroot.org; Fri, 07 Feb 2025 20:48:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <865a4927-ae1c-45f5-86d4-205ec9ef7a02@korsgaard.com>
Date: Fri, 07 Feb 2025 20:48:54 +0100
In-Reply-To: <865a4927-ae1c-45f5-86d4-205ec9ef7a02@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 4 Feb 2025 16:20:29 +0100")
Message-ID: <87y0yhcz89.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeffffffvdfhfeelheetgfelhefgvdfhieekhfduueehtdffkeeiieevveegveelueenucffohhmrghinhepfigvsghkihhtghhtkhdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/2] package/webkitgtk: bump to 2.44.4
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On 12/16/24 19:17, Thomas Devoogdt wrote:
 >> Bugfix release with many security fixes, including (but not limited to)
 >> patches for CVE-2024-40776, CVE-2024-40779, CVE-2024-40780, CVE-2024-40782,
 >> CVE-2024-40789, and CVE-2024-4558.
 >> Release notes:
 >> https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
 >> https://www.webkitgtk.org/release/webkitgtk-2.44.4.html
 >> Accompanying security advisory:
 >> https://webkitgtk.org/security/WSA-2024-0004.html
 >> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 >> ---
 >> v2: bump to 2.44.4 iso 2.44.3
 >> v3: no change


 > Committed after adjusting the summary line to make it clear that this
 > is a security bump, thanks.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
