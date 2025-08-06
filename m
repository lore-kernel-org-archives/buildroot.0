Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD784C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A47612F2;
	Wed,  6 Aug 2025 13:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MZqGCik2PLx; Wed,  6 Aug 2025 13:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD18613DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD18613DF;
	Wed,  6 Aug 2025 13:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F4E931
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 103D784443
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WOF9_5Xpu47 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 13:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A28F84628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A28F84628
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A28F84628
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:52:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1124428997; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 13:52:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujeZH-00Glmn-0k;
 Wed, 06 Aug 2025 15:52:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
Date: Wed, 06 Aug 2025 15:52:35 +0200
In-Reply-To: <20250716093401.1213358-1-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Wed, 16 Jul 2025 11:33:44
 +0200")
Message-ID: <87tt2kiml8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ITMK6kQLZfMovpmx/CjJnUoBu4MqpMGuB10VJRUo4unVe7HZG8H7WDe8KN4/86kd54L8XQv8x9uvzFjtGRWoVPFoJOWvjbcVi4s+ioalBFVX5WWp/5fg4kq7SIeRTiJNEIsFr9dLXVwoSuFutzAn14RyMHTlHf2I1xKRJ2mukXzLTN9Zfp33EfSZMQp1br9RuTOY484r/v2O9vhYQ7/FtOUYaqH4pm38/mWQvHmUqaQR6ZA4hElvslE0ns6hsSLxBsQ0AJP6JbHTqQzMWMFdsds+ygIs8m1as8ElaOeqfxA70FJwuJxHR3K+BWwVCybyT7kTaIXPcwc/gj8rnQjJLw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=IhN84okRzb9SypBAlsYwXNTbikpyCD6GLrsFyEshCaQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ITMK6kQL
Subject: Re: [Buildroot] [PATCH v2 1/5] utils/generate-cyclonedx: add option
 to filter host packages
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

>>>>> "Fabien" == Fabien Lehoussel via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
 > ---
 >  utils/generate-cyclonedx | 9 ++++++---
 >  1 file changed, 6 insertions(+), 3 deletions(-)

 > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
 > index 46f68ac63d..08c591e86b 100755
 > --- a/utils/generate-cyclonedx
 > +++ b/utils/generate-cyclonedx
 > @@ -279,6 +279,8 @@ def main():
 >                          default=sys.stdout)
 >      parser.add_argument("--virtual", default=False, action='store_true',
 >                          help="This option includes virtual packages to the CycloneDX output")
 > +    parser.add_argument("--no-host-packages", default=False, action='store_true',
 > +                        help="This option excludes host packages from the CycloneDX output")
 
 >      args = parser.parse_args()
 
 > @@ -288,11 +290,12 @@ def main():
 
 >      show_info_dict = json.load(args.in_file)
 
 > -    # Remove rootfs and virtual packages if not explicitly included
 > +    # Remove rootfs, host (if not included) and virtual packages (if not included)
 >      # from the cli arguments
 >      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
 > -                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 > -
 > +                               if ("rootfs" not in v["type"]) and 
 > +                                  (args.virtual or v["virtual"] is False) and
 > +                                  (not args.no_host_packages or "host" not in v["type"])}

As pointed out by Johan in
https://lore.kernel.org/buildroot/CAKHhJn1m5fZnPYki3jR0ZWa-2aB3291n3dyLUoQViBM_X5Zc2g@mail.gmail.com/
we need to also drop the host packages from the dependencies. Maybe it
makes sense to do this filtering in in a separate helper routine as this
dict comprehension is already quite complicated - And we may want to use
it to also drop any proprietary custom packages as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
