Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A013D1356D
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 16:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8326078F;
	Sun, 27 Oct 2024 16:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqhqVDvEmtHW; Sun, 27 Oct 2024 16:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82153606C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82153606C0;
	Sun, 27 Oct 2024 16:45:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 026B7971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4704402C0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtNAXFmEAwlE for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 16:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC14640278
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC14640278
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC14640278
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:45:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.105]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1t86Wp2ptf-001kso; Sun, 27
 Oct 2024 17:45:32 +0100
Message-ID: <75be884f-08ea-432d-86b0-3b3604d25177@gmx.de>
Date: Sun, 27 Oct 2024 17:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>, Julien Olivain <ju.o@free.fr>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-14-adam.duskett@amarulasolutions.com>
 <20241026181808.4cae0be9@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241026181808.4cae0be9@windsurf>
X-Provags-ID: V03:K1:02SzwDZh8lE7JHMGKuErUHDT8JjuCiDHL65sBJ0ximQoefcfmSp
 HtKs4Ty+Eo0OOMW5fLHMH/4A7/8Gu1bIlgcrdIrNB5iTfI8pBWDnGFQgWf//y9WL545QGAa
 F/eniDvnnE8lxddlxqXps/AxbTfa1rT5UpTrlorZ1Vf2rqJIL4ZXhngfTQvkUWSuLZyHTEV
 8TUsMw8U6LIZTFl0PHxYw==
UI-OutboundReport: notjunk:1;M01:P0:5HpjBZ+2Zzo=;X7Mq5k794rYFjqhdYboEdGt/tpH
 2YMZCDgfDE6bQs7vS/a2WNK6MMnAuHjVXEpLCjvZYKVvj/5CXHDT2sIoHSId1wQSDflaPBf+D
 dmkb9Cql70P1h3sFEiHFSMgDW+Z4pO8efmlW24UFI2OhMd68saLdikMFw8NIBq/N/eOdY9O9Q
 qmW9acpdh1CqmRGfPhbm5DgPpIQuP2/pJp/jtYMo5p4HYOPuWvVh2f5GMMWe4TASugHyISkLd
 En0MC0QCajPeEO2fUJiqfObxpVhMIHSlURAMUmZ+2fSKV8w6DzmkLYQUHiJkTPOJIelXYTA2p
 I6MXoyuRj9f5RIKVyt2TsQjfr+ujAQ97tYEyZsGYnHqUTt4cWInrQUwmpoFhmCfIu6QdKCoYc
 H+AVGewyg6KYkTbVTW7TRB62ssqsv9MemJ9B6CLNBEUeY77VlR8tanrMVGhnlcA51ptjkpbR3
 oB4TQQ2ZGsdRiNtr3e2tvq9/wXVr0tM77aiZ0x4PV8PKCULjBhdrXgildZpNc1OWR7zOtJL1w
 tx48gtb5EM9XGh8jWn06Kn0Z33Yn4WGV4S29yqeiK3ToTbANfwqeYxqdnPoc35dFdnMwxt7Jh
 oGIyt2CvNFP9l4ZLmFUlURMm1R+Yu4jSJZnMO7yOJA7zRiBImYVwMLnzLyQiH13Wa6pHoZszu
 CzRxird/iCK/+NCAbeM4Undmwi3J2bJ5tSXZ9PlqANMGAPpklKbLqxbPvAqmLvnvEcd7/ozum
 lq0AQpuILT8Kn15Hm3RphHlrCd1OWrrgfGepMLYxrac8TFXC4E/wD9o7c0fSouAUw+lp4qHeU
 DwHSEs2mi1ydZr1ISKhA/2qA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730047532; x=1730652332; i=fiona.klute@gmx.de;
 bh=W5klarpOfXt6R0ZxGhYMVtAKYCbME7Fu3gOTTVJh6CE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LuXmSsiQ4MwuYDJKaaPN/FvPRohazAk980TYXN6ZreBTUYKVLhUKcMbtIl+SypfW
 0cOlau/bxfWOo5d1J4FOcFqqbJUF3uG2ybmtl4Rf+DY3rY0/yFxNMeibM2tSWHCGY
 PDr5V1wH9HXQdM+RZfz8lyvX6WkF5n8E0uYazkenPBfW0+/stRTRCPEGAyuPXLnfm
 Kb77zfnt90Dl1sENAGapd/gfaEo6CmkHls3Wod6diBPVcXVIbyC3MwYoScQgVKzt0
 squD1K3f4OvkBpu5HdS0hEd+KzHZ8kwW/I6PDkUdyr/DaSX0agHU30nQXgt3FEbjK
 P8DocEFJJivEw43NMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LuXmSsiQ
Subject: Re: [Buildroot] [PATCH 13/13] package/audit: bump version to 4.0.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 26.10.24 um 18:18 schrieb Thomas Petazzoni:
> Hello Adam,
>
> Cc Julien for runtime test, Cc Fiona for init script.
>
> On Mon, 16 Sep 2024 17:12:06 +0200
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
>
>> In addition, audit 4.x now provides two service files:
>>   - audit-rules.service
>>   - auditd.service, which depends on audit-rules.service
>>
>> audit-rules.service is a one-shot service that runs augenrules --load.
>> To keep audit compatible with sysvinit-based systems, create a new file,
>> S02augenrules, and move S02auditd to S03auditd. This change keeps the basic
>> format of the systemd provided service files for ease of maintance.
>
> I don't follow you here. What do you mean by "keep audit compatible
> with sysvinit-based systems" ?
>
> Are you saying that to keep consistency/symmetry with the systemd unit
> files, you introduce two separate init scripts, one for augenrules
> --load, and one for starting the daemon itself?
>
>> Other changes:
>>   - The --without-python option is no longer present.
>>   - There is no longer a --enable/--disable-systemd option.
>>   - audit.rules are no longer autogenerated on startup. As such, the RedHat
>>     rpm .spec logic is copied, and $(@D)/rules/10-base-config.rules is copied
>>     to $(TARGET_DIR)/etc/audit/rules.d/audit.rules as part of the
>>     POST_INSTALL_TARGET_HOOKS. If /etc/audit/rules.d/audit.rules does not exit
>
>                                                                             ^^^ exists ?
>
>>     on the target, auditd fails to run. This change is also a bonus for
>>     read-only systems and the audit.rules file is guaranteed to be on the system.
>
>                         ^^^ as ?
>
>> Tested with qemu_x86_64_defconfig and running checking if audit is running
>> properly.
>
> Would be nice to have an audit test case in support/testing :-)
>
>> diff --git a/package/audit/S02augenrules b/package/audit/S02augenrules
>> new file mode 100644
>> index 0000000000..70342a231c
>> --- /dev/null
>> +++ b/package/audit/S02augenrules
>> @@ -0,0 +1,31 @@
>> +#!/bin/sh
>> +#
>> +# audi       This starts and stops auditd
>
> audi?
>
> This scripts doesn't starts auditd.
>
>> +#
>> +# description: This starts the Linux Auditing System Daemon,
>> +#              which collects security related events in a dedicated
>> +#              audit log. If this daemon is turned off, audit events
>> +#              will be sent to syslog.
>
> Nope, this is not what this script does.
>
>> +#
>> +
>> +DAEMON="augenrules"
>> +
>> +start(){
>> +	printf "Starting %s: " "${DAEMON}"
>
> We're not really starting a daemon here.
>
>> +	# Run audit daemon executable
>
> Nope, this is not what is happening.
>
>> +	if /usr/sbin/"${DAEMON}" --load > /dev/null 2>&1; then
>> +		echo "OK"
>> +	else
>> +		echo "FAIL"
>> +	fi
>> +}
>
> This init script is kind of special, as it doesn't really start a
> service, but does a one-shot action. Could you Cc: the next iteration
> to Fiona so that she can review the proposal? Or maybe Fiona can even
> review this first iteration.

I'm not that familiar with SELinux, so I have to ask: Is that rule
loading something one might want to do independently of starting auditd,
or is it something that only makes sense if you're using auditd? In the
latter case I think it should stay part of the auditd init script, just
like package/openssh/S50sshd runs host key generation if needed. With
systemd you can define explicit relationships between units, but we
don't have anything of the kind with Busybox init, and implicit
dependencies tend to be confusing & error prone.

If having a separate script makes sense, I agree that the description
needs to be fixed. ;-) And there's the question in how far implementing
other targets make sense, currently I'd expect stop during shutdown to fail.

In general, the nftables script I sent a while ago (unfortunately not
yet merged) is how I think oneshot actions should be handled, in that
case (un-)loading firewall rules:
https://patchwork.ozlabs.org/project/buildroot/patch/20240726162013.2183792-2-fiona.klute@gmx.de/
That series also tidies up the iptables init script for consistency if
you want another example, though in my opinion that script is mostly
useless now because it is by nature IPv4 only, if anyone really wants to
use it they'll need to add ip6tables support (but that's a different
matter).

Best regards,
Fiona

>> +	mkdir -p $(TARGET_DIR)/etc/audit/rules.d
>
> This mkdir -p is useless if you add -D to the following $(INSTALL)
> command.
>
>> +	$(INSTALL) -m 0640 $(@D)/rules/10-base-config.rules \
>> +		$(TARGET_DIR)/etc/audit/rules.d/audit.rules
>> +endef
>> +AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_RULES
>
> Thanks a lot!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
