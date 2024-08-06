Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8023C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41870606AE;
	Tue,  6 Aug 2024 22:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sN6EoSm3SUvA; Tue,  6 Aug 2024 22:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33622606F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33622606F1;
	Tue,  6 Aug 2024 22:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9BF1BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F121D40237
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkZR-1rok19s for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD98C400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD98C400D7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD98C400D7
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:37:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 175E320004;
 Tue,  6 Aug 2024 22:37:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbSo9-00095O-1b;
 Wed, 07 Aug 2024 00:37:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-27-ricardo.martincoski@gmail.com>
 <f430f9e8-8ef4-4f89-8463-36dfc046d8b7@mind.be>
Date: Wed, 07 Aug 2024 00:37:33 +0200
In-Reply-To: <f430f9e8-8ef4-4f89-8463-36dfc046d8b7@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 12 Jul 2024 16:46:59
 +0200")
Message-ID: <87r0b1p9aq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 26/29] utils/check-package: check linux-tools
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 02/01/2023 00:36, Ricardo Martincoski wrote:
 >> Each linux tool uses a fragment of a .mk file, named, for instance:
 >> package/linux-tools/linux-tool-cpupower.mk.in
 >> So currently check-package does not check these files.
 >> Add the support in check-package script.
 >> At the same time, factor out a function to derive package prefix from
 >> the filename being checked, so the fix (calling os.path.splitext twice)
 >> can be applied in a single place.
 >> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 >> ---
 >> Running on current master generates no warnings.
 >> ---
 >> utils/check-package                  |  3 ++-
 >> utils/checkpackagelib/lib_mk.py      | 28 ++++++++++---------
 >> utils/checkpackagelib/test_lib_mk.py | 40 ++++++++++++++++++++++++++++
 >> 3 files changed, 57 insertions(+), 14 deletions(-)
 >> diff --git a/utils/check-package b/utils/check-package
 >> index f64daed84c..6bd0c0b31f 100755
 >> --- a/utils/check-package
 >> +++ b/utils/check-package
 >> @@ -61,6 +61,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
 >> DO_NOT_CHECK_INTREE = re.compile(r"|".join([
 >> r"boot/barebox/barebox\.mk$",
 >> r"fs/common\.mk$",
 >> +    r"package/alchemy/atom.mk.in$",
 >> r"package/doc-asciidoc\.mk$",
 >> r"package/pkg-\S*\.mk$",
 >> r"toolchain/helpers\.mk$",
 >> @@ -84,7 +85,7 @@ def get_lib_from_filename(fname):
 >> return checkpackagelib.lib_config
 >> if fname.endswith(".hash"):
 >> return checkpackagelib.lib_hash
 >> -    if fname.endswith(".mk"):
 >> +    if fname.endswith(".mk") or fname.endswith(".mk.in"):
 >> return checkpackagelib.lib_mk
 >> if fname.endswith(".patch"):
 >> return checkpackagelib.lib_patch
 >> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
 >> index b0bd52bdf6..931fa39dda 100644
 >> --- a/utils/checkpackagelib/lib_mk.py
 >> +++ b/utils/checkpackagelib/lib_mk.py
 >> @@ -21,6 +21,16 @@ continue_conditional = ["elif", "else"]
 >> end_conditional = ["endif"]
 >> +def get_package_prefix_from_filename(filename):

 >  I added a docstring and a comment explaining the double splitext here.

 >  Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
