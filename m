From: Shlomi Vaknin <shlomi.39sd@gmail.com>
Date: Wed, 4 Nov 2020 16:08:12 +0200
Subject: [Buildroot] Failed to initialize driver 'nl80211' wlan0:
 Unsupported driver 'nl80211'
In-Reply-To: <trinity-cc1383a1-5a3d-4caf-a578-81afa03d6dc1-1604424640778@3c-app-mailcom-bs08>
References: <AM0PR10MB2433EAA9F63F022A4C6764C582110@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
 <trinity-2332d7a9-9fe6-4053-9d87-241ec1f18361-1604413759972@3c-app-mailcom-bs14>
 <AM0PR10MB243357223E03870295ABE43F82110@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>
 <trinity-cc1383a1-5a3d-4caf-a578-81afa03d6dc1-1604424640778@3c-app-mailcom-bs08>
Message-ID: <CALxJ29TJZugSLCzTzbqUU_sCWmg9KZTB+RPMdBYSYMv8TFGfAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

As I told you in another email, there is an issue with the mainline kernel.
I asked st about that and they told me how to fix the problem. I am
attaching the kernel patch. Apply it using buildroot and it should work
(worked for me)

Regards,
Shlomi

??????? ??? ??, 3 ????? 2020 ?-19:30 ??? ?daggs?? <?daggs@gmx.com??>:?

> please keep it in the mailing list.
>
> see
> https://buildroot.org/downloads/manual/manual.html#_configuration_of_other_components
>
>
> *Sent:* Tuesday, November 03, 2020 at 4:32 PM
> *From:* "Kevin Tomary" <kevin.tomary@hotmail.com>
> *To:* "daggs" <daggs@gmx.com>
> *Subject:* Re: [Buildroot] Failed to initialize driver 'nl80211' wlan0:
> Unsupported driver 'nl80211'
> Can you guide me to do that ?
>
> I am new to buildroot here that's why.
>
> Thank you
>
>
>
> ------------------------------
> *From:* daggs <daggs@gmx.com>
> *Sent:* Tuesday, November 3, 2020 3:29 PM
> *To:* Kevin Tomary <kevin.tomary@hotmail.com>
> *Cc:* buildroot at busybox.net <buildroot@busybox.net>
> *Subject:* Re: [Buildroot] Failed to initialize driver 'nl80211' wlan0:
> Unsupported driver 'nl80211'
>
> Greetings Kevin,
>
> > Sent: Tuesday, November 03, 2020 at 4:20 PM
> > From: "Kevin Tomary" <kevin.tomary@hotmail.com>
> > To: "buildroot at busybox.net" <buildroot@busybox.net>
> > Subject: [Buildroot] Failed to initialize driver 'nl80211' wlan0:
> Unsupported driver 'nl80211'
> >
> > I am working with Buildroot, to flash an image on my STM32MP157C-DK2 I
> wanted to have Wi-Fi working it but I got this error:
> > Successfully initialized wpa_supplicant nl80211: 'nl80211' generic
> netlink not found Failed to initialize driver 'nl80211' wlan0: Unsupported
> driver 'nl80211' FAIL
> > I configure the interfaces and wpa_supplicant.conf files correctly
> normally. I don't know wthat that means but my configuration in
> the menuconfigand linux-menuconfigis right (I think). Does it maybe have
> something to do with my target machine (the STM in this case) ?
>
> > Every Kind of Help is appreciated since I am a newby in Embedded Linux
> >
>
> I'd suggest you make sure that CONFIG_NL80211 is compiled as built-in or
> module in the kernel inside the image.
> if it is marked as module, make sure you modprobe it.
>
> Dagg.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201104/2a0d65af/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-stm32mp157c-dk2-add-wifi-support.patch
Type: text/x-patch
Size: 10556 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201104/2a0d65af/attachment.bin>
