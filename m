Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E53C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543AC423CC;
	Sat, 11 Dec 2021 20:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7KnbfXIRE2C; Sat, 11 Dec 2021 20:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8301A4246C;
	Sat, 11 Dec 2021 20:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC4A1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D7AD4246C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mib6QWILhOjp for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:41:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17C75423CC
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:41:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e3so40909414edu.4
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QYp1Z6Z+J2dYxi0QJkCvqo3tct5e6NniC3khbiN2+Co=;
 b=EerJvqofdrlsWZbV0GynsFm8l3anB0D3kvM7EpSxm4fVJvuDkR9V/LobDcMzUggQS3
 YHpIamhDexuRWmiygqkYH/0+mBUFocKds30FGIgk1aNdXgdq4JHjyQ/pamWNmdLdC9sd
 Ebq4xHpn9NF6oOGMH53xWVeG7LroH1lqhKbEfC4rSrj5cd5mlLKQwv9oFa/PhGZRPwUP
 kSiCSK1OohPZRIXQWAfj2wwEM+Ek2QTQZIe26n899DqjrYykZjJCHisbrq7WuVFm17yU
 Y5SWDaELkBeqFZMEcoCrS7NqMZpWsySADa3u3Te7Ic0nMAk+WGfJlIs+SE2EkVgmtUAG
 N1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QYp1Z6Z+J2dYxi0QJkCvqo3tct5e6NniC3khbiN2+Co=;
 b=2n/eYiSR+pHfq4i4Qugi6KMwUU0yz5L7cYr4qQPG7f2sA3fvgIY1IpU7MZNEeYYp2F
 IT3E2xdBoiBQLhAxVSK4GzPhph+PSJJDr+8ZI6EwqjoMHAZLhpvmgYruxfTs7nebJ8rP
 7eK1EHP28gpXDkbASqmVlFU2GmtF88N5xrmC1crqebRGW9c/+Xr7vw0FCUl/FAC+qQ4x
 D9Xiyd5u+45K22gvl0tTiWtphqcO8kTk1Fb8OVMLn2oZ+5SSOgNVrA12waKB1z+ONebD
 qyv+KNdgWi+c2RpR5dBrjFD20eD/jDLS5fHjzxB6mLl9jD18luHB7tCfMdAhL6ktMhEk
 TgtA==
X-Gm-Message-State: AOAM530hj4tJpF2QNvI1+aPGMEswNt99Pe/rKVuSd0Z3ccBLMZaOv6Nh
 dPc+6JppXzjPSCJK4AnHpjZ9tg==
X-Google-Smtp-Source: ABdhPJxSlDUiWErspTpis5kd4/Fc3UXXY/ZOOKj7Rz4e1zAvhhpPtApXGOkdzl6J25TL6yTmzQRGFw==
X-Received: by 2002:a50:eacb:: with SMTP id u11mr48961736edp.290.1639255299190; 
 Sat, 11 Dec 2021 12:41:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e7sm3824326edk.3.2021.12.11.12.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:41:38 -0800 (PST)
Message-ID: <730758a8-dac8-1fc4-cf6b-5b9cfc841479@mind.be>
Date: Sat, 11 Dec 2021 21:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211121215713.4167839-1-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211121215713.4167839-1-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix developer
 being reported for unrelated path
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
Cc: James Knight <james.d.knight@live.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/11/2021 22:57, Ricardo Martincoski wrote:
> Currently, by following the instructions in the manual and querying for
> developers for a patch that changes path
> package/foobar
> the script reports both developers that have these entries in the
> DEVELOPERS file:
> F:	package/foo/
> F:	package/foobar/
> 
> Starting from commit "afc112b0e4 utils/getdeveloperlib.py: fix issue
> with hasfile()" get-developers script uses os.path.abspath() and
> os.path.relpath().
> The catch is that those functions return the absolute path and the
> relative path without the trailing slash.
> 
> When the paths associated to a developer are then compared to the paths
> a patch touches, using the string.startswith(), any substring returns
> True, leading to developers for package/foo/ being wrongly reported
> for package/foobar/ .
> 
> Fix this by re-adding the trailing slash after using relpath().
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: James Knight <james.d.knight@live.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> NOTICE: this change makes 'get-developers -c' to return more results.
> This is expected, since i.e:
> fmt has a developer
> fmtools has none
> jo has a developer
> joe has none
> openjdk has a developer
> openjdk-bin has none
> opentyrian has a developer
> opentyrian-data has none
> board/raspberrypi has a few developers
> board/raspberrypi0 has none
> 
> Examples of wrong results *before* this patch:
> 
> $ ./utils/get-developers -p stress-ng
> Romain Naour <romain.naour@gmail.com>
> $ ./utils/get-developers -p stress
> Arnout Vandecappelle <arnout@mind.be>
> $ ./utils/get-developers outgoing/*-stress-ng-*.patch
> git send-email --to buildroot@buildroot.org --cc "Romain Naour
> <romain.naour@gmail.com>" --cc "Arnout Vandecappelle <arnout@mind.be>"
> 
> $ ./utils/get-developers -p atop
> Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> $ ./utils/get-developers -p at
> Giulio Benetti <giulio.benetti@benettiengineering.com>
> $ ./utils/get-developers outgoing/*-atop-*.patch
> git send-email --to buildroot@buildroot.org --cc "Ricardo Martincoski
> <ricardo.martincoski@datacom.com.br>" --cc "Giulio Benetti
> <giulio.benetti@benettiengineering.com>"
> ---
>   utils/getdeveloperlib.py | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index f2b36862e3..c05e1f888b 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -247,18 +247,20 @@ def parse_developers():
>               elif line.startswith("F:"):
>                   fname = line[2:].strip()
>                   dev_files = glob.glob(os.path.join(brpath, fname))
>                   if len(dev_files) == 0:
>                       print("WARNING: '%s' doesn't match any file" % fname,
>                             file=sys.stderr)
>                   for f in dev_files:
>                       dev_file = os.path.relpath(f, brpath)
>                       dev_file = dev_file.replace(os.sep, '/')  # force unix sep
> +                    if f[-1] == '/':  # relpath removes the trailing /
> +                        dev_file = dev_file + '/'
>                       files.append(dev_file)
>               elif line == "":
>                   if not name:
>                       continue
>                   developers.append(Developer(name, files))
>                   files = []
>                   name = None
>               else:
>                   print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
