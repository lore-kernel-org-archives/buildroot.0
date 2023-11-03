Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A221C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 11:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9840E4F3DA;
	Fri,  3 Nov 2023 11:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9840E4F3DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3E9ecxi9Ctn9; Fri,  3 Nov 2023 11:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79CC4F3DB;
	Fri,  3 Nov 2023 11:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79CC4F3DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B05A41BF3AA
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 11:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898308531E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 11:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898308531E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDh7jPVTb_dm for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 11:53:38 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B0E785319
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 11:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0E785319
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 54A39440F61;
 Fri,  3 Nov 2023 13:52:45 +0200 (IST)
References: <20231102143608.3231106-1-hmaied.benabdellatif@etictelecom.com>
 <20231103105458.36622fb1@windsurf>
User-agent: mu4e 1.9.21; emacs 29.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Nov 2023 13:48:36 +0200
In-reply-to: <20231103105458.36622fb1@windsurf>
Message-ID: <87fs1n59z7.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1699012365;
 bh=5bw32mVxIMZ1FBIaGpEZTNsJr97w59YqpV7in6KwxAQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=PKJBnZagpniV+JW0BlriZ4fda1rj0aUKLqfANvN0bhXd+Wth8Sr+VnjbKAdjA3dNU
 VgCMRoR+meErlWOG15krZkNkf4JhHg1N/uCb/pe0Z55edq+srVSed7zRzQ4oKBre9i
 KNbFR0jf/SLKghNfxAYISVIargODzn8+5qy1Rb0nP04XkiLkV9hx0xUo65lTOPve93
 1zc/+8kw3V0dd6a0yFyB/uVSS7PcvH5D/vHslKEktMGtSWPnaPribA/79SJB5hR6To
 IiNbF70FByOL+zY82lpUlD6y3gksYCTNxomKMbjTT21kgUWEMtUu6P4Dd7On+OdqIs
 VBJcPtQQ0YYrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=PKJBnZag
Subject: Re: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.5.16
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: hmaied.benabdellatif@etictelecom.com, David Bender <codehero@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Nov 03 2023, Thomas Petazzoni via buildroot wrote:
> On Thu,  2 Nov 2023 15:36:08 +0100
> hmaied.benabdellatif@etictelecom.com wrote:
>
>> From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
>> 
>> Signed-off-by: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
>
> Thanks for the updated patch. Could you please comment in the commit
> log on why patches 0001-fix_cross_strip.patch and
> 0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch are
> removed?
>
> Also, I see you rename 0002-fix-bignum.patch to 0001-fix-bignum.patch,
> but it looks like you forgot to also rename 0003-disable-docs.patch to
> have a correct sequence number.
>
>
>> -# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.md5
>> -md5  6036a03b3a67b4a1fe1246e0a2c7265a  openldap-2.4.59.tgz
>> -# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.sha1
>> -sha1  b154d06bbf40fafafb34fffc4b116946d931efef  openldap-2.4.59.tgz
>>  # Locally computed
>> -sha256  99f37d6747d88206c470067eda624d5e48c1011e943ec0ab217bae8712e22f34  openldap-2.4.59.tgz
>> +sha512
>> ed0c3732c096807006a13df7484c889ccc6943ced3e50c0d01034e6c6823c0996ae1fda0348677243934fbe8715a467abc46f01dee87b7571f5392b0570eb04a
>> openldap-2.5.16.tgz
>
> Why are you no longer taking the md5+sha256 from the upstream website?
>
> Apparently, because they are now only providing
> https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
> which is using SHA3-512, but we don't have support for SHA3-512 in
> Buildroot. However, you could probably verify it on your side:
>
> $ wget https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.tgz
> $ sha3sum -a 512 openldap-2.5.16.tgz 

Where is this sha3sum utility from?

> 5a1fcef237bbcf119dc1be15c366283814c29e6433ebe320ad186f184f52befc1f4f1dd81faf29b1d078e2f59e8de081699a153f0821f3741d7d24913276d577
> openldap-2.5.16.tgz
> $ wget -q -O - https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
> SHA3-512(openldap-2.5.16.tgz)=
> 5a1fcef237bbcf119dc1be15c366283814c29e6433ebe320ad186f184f52befc1f4f1dd81faf29b1d078e2f59e8de081699a153f0821f3741d7d24913276d577

This form of output hints that sha3sum is a wrapper script around
'openssl dgst'. Is that the case?

For the record, the equivalent openssl command to generate the same
output is:

  openssl dgst -sha3-512 openldap-2.5.16.tgz

baruch

>
> They match, houra.
>
> $ sha256sum openldap-2.5.16.tgz 
> 546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327  openldap-2.5.16.tgz
>
> And then in the .hash file:
>
> # Verified by locally checking against the SHA3-512 hash available in
> # https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
> sha256  546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327  openldap-2.5.16.tgz
>
> Could you rework again your patch according to these changes?
>
> Also, when you send an updated version of the patch, we expect the new
> version to be [PATCH v2] or [PATCH v3] and have a small changelog below
> the --- line. See
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
> for more details.
>
> Thanks!
>
> Thomas


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
