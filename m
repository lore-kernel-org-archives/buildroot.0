Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CDAC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F1B61B77;
	Wed,  6 Aug 2025 14:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDmjq5xRgZeu; Wed,  6 Aug 2025 14:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63B461B96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63B461B96;
	Wed,  6 Aug 2025 14:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2971531
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B87F40E00
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqJP4WRM9gQk for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:01:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B9CC40D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B9CC40D7C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B9CC40D7C
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:01:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1925920276; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 14:01:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujehc-00GmYZ-1Z;
 Wed, 06 Aug 2025 16:01:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-2-fabien.lehoussel@smile.fr>
Date: Wed, 06 Aug 2025 16:01:12 +0200
In-Reply-To: <20250716093401.1213358-2-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Wed, 16 Jul 2025 11:33:45
 +0200")
Message-ID: <87pld8im6v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=yWe2I6kODwmjViHi0HO4zB69BBtHdDcYc29pqSGkalR2AvIBI7evEaf+2N0sEm2OPGcIpNGwgZHcJPVd+Mh+n6bupBZk3i8qI8ap8VRRh6eB0awBeSPO2P3Z1Z5Jsp/AJJnQyq+/wkPEQ+mbUYdMuo3F3PRrkwWHm2OMowqdBbFGKLtbvcUiObIsa3D0Weci1ppnjRYGv9NGNpz6O56SF3txILc2LgD/C5BRYvt9hAXXya9of78Ee3Qc7+51pB4InEVWsDpDSZQ/vqjDMP16utq6MXfIsiijKKM2x8ma4R40ucqUDWIq/3X85uB0Z+oqQh+ur6f5RE+2Gijv0uuBqw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0nLSZUE0O75ImoppNi/jlpDJDBg92PJq3+RgQDuwje0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=yWe2I6kO
Subject: Re: [Buildroot] [PATCH v2 2/5] utils/generate-cyclonedx: update
 package filtering
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
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabien" == Fabien Lehoussel via buildroot <buildroot@buildroot.org> writes:

 > Keep only upstream packages, i.e., those for which XX_SITE is set

The term "upstream packages" sounds a bit confusing to me, I guess the
intention is to only include "real" packages, E.G. packages not bundled
inside Buildroot.

Your v1 series explicitly mentioned skeleton packages, so maybe give
that as an example?

It would IMHO make more sense to have this as the first commit in your
patch series, so before the host filtering one.

> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
 > ---
 >  utils/generate-cyclonedx | 12 +++++-------
 >  1 file changed, 5 insertions(+), 7 deletions(-)

 > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
 > index 08c591e86b..14f655bca2 100755
 > --- a/utils/generate-cyclonedx
 > +++ b/utils/generate-cyclonedx
 > @@ -277,8 +277,7 @@ def main():
 >                          default=(None if sys.stdin.isatty() else sys.stdin))
 >      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
 >                          default=sys.stdout)
 > -    parser.add_argument("--virtual", default=False, action='store_true',
 > -                        help="This option includes virtual packages to the CycloneDX output")
 > +


I am not sure exactly what the use case is of --virtual, but why remove
it?

>      parser.add_argument("--no-host-packages", default=False, action='store_true',
 >                          help="This option excludes host packages from the CycloneDX output")
 
 > @@ -290,11 +289,10 @@ def main():
 
 >      show_info_dict = json.load(args.in_file)
 
 > -    # Remove rootfs, host (if not included) and virtual packages (if not included)
 > -    # from the cli arguments
 > +    # Only keep upstream packages, i.e., those for which XX_SITE is set
 > +    # Also filter out host packages if --no-host-packages is specified
 >      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
 > -                               if ("rootfs" not in v["type"]) and 
 > -                                  (args.virtual or v["virtual"] is False) and
 > +                                if (v.get("downloads") and len(v["downloads"]) > 0) and
 >                                    (not args.no_host_packages or "host" not in v["type"])}
 >      cyclonedx_dict = {
 >          "bomFormat": "CycloneDX",
 > @@ -305,7 +303,7 @@ def main():
 >          ],
 >          "dependencies": [
 >              cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
 > -            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
 > +            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, True))

If we were to drop the virtual option, then it should IMHO also be
dropped from br2_parse_deps_recursively.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
