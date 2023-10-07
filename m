Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C927E95A6A
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 20:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 055A0408FD;
	Sat,  7 Oct 2023 20:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 055A0408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ywpf4uNZ1OUF; Sat,  7 Oct 2023 20:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2ED7402F4;
	Sat,  7 Oct 2023 20:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2ED7402F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72BA41BF3BD
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD8082299
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD8082299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeelBV-aKb50 for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 20:40:15 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10F068220B
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 20:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F068220B
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so5742993a12.0
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 13:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696711213; x=1697316013;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5LOK5SQWHPcgFxNRoILkjTkMbpZK49114xYP+crYX/w=;
 b=T0b8Opm4voIVdvMPt9inIncWTOcrxy8+/mKSn/Hbt8ty66MQ7VZ2T3bRt/BQz3xFF7
 eplJjnt2SI3TpLqRMEvHocQHPLcbWKJes2C1zyovFt7v7qXIFraaruU2Hf4mIam25xvc
 3GkjEBo4q9r+zDQmSrFsI5FodhjCdGmA3VJpCu5oebbyQ/2SuX5n9ryUkoIfxItbI1pw
 LP0Mtiw+2uDSqtXnMC5Ckl1RsVh9eHCXf6xnMCNGWW0fUg/IAM7x2ZxEtLYA7uOQOky2
 z1sqEqWLlYsLtsA95C5T2dZBUrZr0FBjGm2dd5g9ADZBOkE2QQ6VmwqDZopMUp4jlIND
 S4pA==
X-Gm-Message-State: AOJu0YzCGTZ4bNGdhbgl3RWYBFcuW3sRx2Dja23+fDaI4SOLdhXAN51f
 5KwFlgIB0G+//cxvsKvVcbv4XLsniqvdKj7FPTc=
X-Google-Smtp-Source: AGHT+IE0SVYuq/eSsLImTEhpnc5B8MXa2Jn18PzvpXFpLztSGMcJcN3/HyFkuMdc1TOnQVHN7OEOpw==
X-Received: by 2002:a17:906:2d2:b0:9ad:8ef8:a7e8 with SMTP id
 18-20020a17090602d200b009ad8ef8a7e8mr10739770ejk.25.1696711212959; 
 Sat, 07 Oct 2023 13:40:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170906360f00b0099d804da2e9sm4719516ejb.225.2023.10.07.13.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Oct 2023 13:40:12 -0700 (PDT)
Message-ID: <b69f465b-2faf-02a9-20d9-ba8ff6f9c6e5@mind.be>
Date: Sat, 7 Oct 2023 22:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
 <20221004110421.137795-6-angelo@amarulasolutions.com>
In-Reply-To: <20221004110421.137795-6-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696711213; x=1697316013; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5LOK5SQWHPcgFxNRoILkjTkMbpZK49114xYP+crYX/w=;
 b=YWElHThmjKqpwHwRI0gGSKcFPwUSwHlDec5cMfgxehwaXs4QmXW/311YWrhGKurK52
 xN62scYSVReR5g4zh0sw+BfL327jmYZkhTC3UHJHtfHo1Q0XAAidVgChsJNn/PvZ0S9b
 2q0W4YL8iZ7tInBlIO3Z3U/J/ExhtQMArOdAKxpVg0LaAD/c9f7nF+nn2DmZOU2rT0ad
 9xftP+B0fbuyhq8ZaE0Hry0kSo/y5ZAid5a+3ausHMPMpwzbp+mEKn9RIsenKOGaf36u
 3zgDIzNgx+25endhbxNUmjSsRYEVjpcsheUIzvzRQQ2XcYzFF7rxCryRHiKtnSOZthpF
 IW4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YWElHThm
Subject: Re: [Buildroot] [PATCH v4 5/5] package/initscripts: add service to
 load kernel modules at boot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2022 13:04, Angelo Compagnucci wrote:
> In cases where no hotplug is available (by choice or by the lack of a
> proper hotplug method for a device), this service can be used to load
> kernel module drivers by reading the /etc/modules-load.d/*.conf files.
> The modules files matches the one used by systemd, which in turn has
> a builtin mechanism to load a module at boot, therefore making systemv
> init on par with systemd features.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v2:
> * Moved script to initscripts (Arnout)
> * Moved script to S11modules, after S10[mu]dev (Andreas)
> * Use /etc/modules-load.d/ to share the same setup with systemd (me)
> v4:
> * Select only .conf file (Peter)
> * Better ouput: printing module name only when loaded successfully,
>    print a FAIL when at least one module fails (Peter)
> 
>   package/initscripts/init.d/S11modules | 59 +++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 package/initscripts/init.d/S11modules
> 
> diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
> new file mode 100644
> index 0000000000..dcc2e79135
> --- /dev/null
> +++ b/package/initscripts/init.d/S11modules
> @@ -0,0 +1,59 @@
> +#!/bin/sh
> +
> +MODULES_DIR="/etc/modules-load.d/"

  The script was failing check-package because there's no DAEMON variable. Of 
course, it's not appropriate to have a DAEMON variable in this init script 
because there's no daemon to start...

  On option would be to set a dummy DAEMON variable, but that would be rather 
pointless. So instead, I used the check-package exception comment to avoid it. 
However, that feature didn't exist yet for global checks (done in the after() 
function). So I added that feature to check-package.

  Because the change became a bit too big to apply directly, I resent. Of 
course, stupid me forgot to add versioning information :-(

> +
> +[ -z "$(ls -A ${MODULES_DIR} 2> /dev/null)" ] && exit 0
> +
> +load_unload() {
> +	for module_file in $(ls -1 ${MODULES_DIR}/*.conf); do

  This (and a few other lines) triggered a shellcheck warning. I fixed those. 
Could you test with the patch I sent?

  Regards,
  Arnout

> +		while read module args; do
> +
> +			case "$module" in
> +				""|"#"*) continue ;;
> +			esac
> +
> +			if [ "$1" = "load" ]; then
> +				modprobe -q ${module} ${args} >/dev/null && \
> +					printf '%s ' "$module" || RET='FAIL'
> +			else
> +				rmmod ${module} >/dev/null
> +			fi
> +
> +		done < ${module_file}
> +	done
> +
> +	RET='OK'
> +}
> +
> +start() {
> +	printf 'Starting modules: '
> +
> +	load_unload load
> +
> +	echo $RET
> +}
> +
> +stop() {
> +	printf 'Stopping modules: '
> +
> +	load_unload unload
> +
> +	echo $RET
> +}
> +
> +restart() {
> +	stop
> +	sleep 1
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
