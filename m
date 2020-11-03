From: daggs <daggs@gmx.com>
Date: Tue, 3 Nov 2020 15:29:20 +0100
Subject: [Buildroot] Failed to initialize driver 'nl80211' wlan0:
 Unsupported driver 'nl80211'
In-Reply-To: <AM0PR10MB2433EAA9F63F022A4C6764C582110@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB2433EAA9F63F022A4C6764C582110@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <trinity-2332d7a9-9fe6-4053-9d87-241ec1f18361-1604413759972@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Kevin,

> Sent:?Tuesday, November 03, 2020 at 4:20 PM
> From:?"Kevin Tomary" <kevin.tomary@hotmail.com>
> To:?"buildroot at busybox.net" <buildroot@busybox.net>
> Subject:?[Buildroot] Failed to initialize driver 'nl80211' wlan0: Unsupported driver 'nl80211'
> 
> I am working with Buildroot, to flash an image on my STM32MP157C-DK2 I wanted to have Wi-Fi working it but I got this error:
> Successfully initialized wpa_supplicant nl80211: 'nl80211' generic netlink not found Failed to initialize driver 'nl80211' wlan0: Unsupported driver 'nl80211' FAIL
> I configure the?interfaces?and?wpa_supplicant.conf?files correctly normally. I don't know wthat that means but my configuration in the?menuconfigand?linux-menuconfigis right (I think). Does it maybe have something to do with my target machine (the STM in this case) ?
?
> Every Kind of Help is appreciated since I am a newby in Embedded Linux
>

I'd suggest you make sure that CONFIG_NL80211 is compiled as built-in or module in the kernel inside the image.
if it is marked as module, make sure you modprobe it.

Dagg.
