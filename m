Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8153CC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 09:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB3240B26;
	Tue,  4 Oct 2022 09:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB3240B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKjElKIxLx7E; Tue,  4 Oct 2022 09:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBF3440B29;
	Tue,  4 Oct 2022 09:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF3440B29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4FC91BF27C
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 910564031D
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910564031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTLZsDECPMLV for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 09:05:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74A640B25
Received: from serv15.avernis.de (15-133.avernis.de
 [IPv6:2a01:4f8:151:30a2::cafe])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74A640B25
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 09:05:05 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 4E449BDE2A18;
 Tue,  4 Oct 2022 11:05:02 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 04 Oct 2022 09:05:02 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
In-Reply-To: <CA+_SqVYEAQa8hRCJGTM0iE7jbuq5td5zhUci3+KP0jdLPS218w@mail.gmail.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-2-angelo@amarulasolutions.com>
 <87v8plgg3p.fsf@dell.be.48ers.dk>
 <CA+_SqVYEAQa8hRCJGTM0iE7jbuq5td5zhUci3+KP0jdLPS218w@mail.gmail.com>
Message-ID: <c20f316624d3d80cc3883023e9ae4cc4@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 1/5] system: adding options for
 configuring wifi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Angelo, Peter, *,

On 2022-10-03 15:42, Angelo Compagnucci wrote:
> On Sun, Sep 18, 2022 at 11:57 AM Peter Korsgaard <peter@korsgaard.com>
> wrote:
> 
>> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>> 
>>  > These options can be used by packages to configure a wifi card
>>  > to connect at boot.
>> 
>>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>>  > ---
>>  >  system/Config.in | 15 +++++++++++++++
>>  >  1 file changed, 15 insertions(+)
>> 
>>  > diff --git a/system/Config.in b/system/Config.in
>>  > index 888c24ce81..9a5bdb2932 100644
>>  > --- a/system/Config.in
>>  > +++ b/system/Config.in
>>  > @@ -418,6 +418,21 @@ comment "automatic network configuration via 
>> DHCP
>> needs ifupdown or busybox or n
>>  >      depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
>>  >              BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
>> 
>>  > +config BR2_SYSTEM_CONNECT_WIFI
>>  > +    bool "Connect to a default wifi access point"
>>  > +    default n

Depending on BR2_SYSTEM_DHCP would remove some unwanted side effects:

+config BR2_SYSTEM_CONNECT_WIFI
+    bool "Connect to a default wifi access point"
+    depends on BR2_SYSTEM_DHCP != "" && BR2_PACKAGE_WPA_SUPPLICANT

Kind regards,
Andreas

>> 
>> 'n' is default, so drop that.
> 
> 
> Right.
> 
> 
>> This doesn't really do anything unless the
>> user also configures BR2_SYSTEM_DHCP="wlan0", right?
>> 
> 
> Right.
> 
> 
>> 
>> I must say I am not really convinced. This is only useful for quite
>> specific setups (E.G. a lot more specific than BR2_SYSTEM_DHCP which 
>> we
>> use in a number of defconfigs) and hard codes a number of things (like
>> WPA-PSK that may or may not make sense in the future).
>> 
> 
> This is what we have now on several readme.txt on how to connect to a 
> wifi
> 
> WiFi
> ====
> 
>  # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
>    (type password and enter)
>  # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
>  # udhcpc -i wlan0
> 
> I don't think this is nice.
> 
> I'd like to see something like that:
> 
> WiFi
> ====
> 
> # Enable BR2_SYSTEM_CONNECT_WIFI configure option
> # Set the Wifi SSID with the option BR2_SYSTEM_CONNECT_WIFI_SSID
> # Set the password with the option BR2_SYSTEM_CONNECT_WIFI_PASSWORD
> 
> Nicer and easier. I know that the wpa-psk could change in the feature, 
> but
> then we can change to whatever default mechanism will be in place at 
> that
> moment.
> 
> 
>> 
>> --
>> Bye, Peter Korsgaard
>> 
> 
> 
> --
> 
> Angelo Compagnucci
> 
> Software Engineer
> 
> angelo@amarulasolutions.com
> __________________________________
> Amarula Solutions SRL
> 
> Via le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
> 
> www.amarulasolutions.com
> [`as] https://www.amarulasolutions.com|
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
