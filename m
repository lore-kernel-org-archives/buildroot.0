From: Emil =?ISO-8859-1?Q?Kr=FCper?= <e.krueper@solcon-systemtechnik.de>
Date: Mon, 07 Apr 2008 08:21:10 +0200
Subject: [Buildroot] Compiled buildroot with iso,
	error during boot	"can't open /dev/ttyX: No such device or address"
In-Reply-To: <326f33790804041623l65cb5bfbub116b5391ff6ff3c@mail.gmail.com>
References: <326f33790804041623l65cb5bfbub116b5391ff6ff3c@mail.gmail.com>
Message-ID: <1207549270.3711.18.camel@PC-EK.Solcon>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You have to properly edit the content of
target/generic/mini_device_table.txt or target/generic/device_table.txt,
which ?depends on "Package Selection for the Target --->  [*] use
minimal target skeleton" in the config. In order to adopt the changes
you have to rebuild (to make) your buildroot.

Best regards,

Emil Kr?per


On Fri, 2008-04-04 at 16:23 -0700, Arun Reddy wrote:
> Hi everyone,
> 
> I have compiled buildroot and created a .iso image that I am now
> trying to use to boot a new kernel on VirtualBox. Unfortunately,
> during boot I am given consistent errors saying:
> 
> can't open /dev/tty1: No such device or address or tty2, tty3, up to
> tty5.
> 
> I looked online and it seems that the reason this occurs is because I
> don't have enough Virtual terminals to support all the users. The key
> lies in populating /dev/tty, but I am wondering how I can do this in
> buildroot? Does anyone know what I must set within Buildroot to avoid
> this problem, and then recompile again to get a new iso image that
> will boot fine without any problems?
> 
> Thank you in advance for your response.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Mit freundlichen Gr??en


Emil Kr?per

Solcon Systemtechnik GmbH
Niels-Bohr-Ring 3-5
23568 L?beck

Tel.: (0451)-40948-19
Fax.: (0451)-40948-88
Email: e.krueper at solcon-systemtechnik.de
www.solcon-systemtechnik.de

Sitz der Gesellschaft: L?beck
Amtsgericht: L?beck | HRB 3662
Gesch?ftsf?hrer: Dr.-Ing. Reiner Wieck, Dr.-Ing. Gerd Schneider



Der Inhalt dieser E-Mail ist vertraulich und oder rechtlich gesch?tzt,
und damit ausschlie?lich f?r den bezeichneten Adressaten bestimmt. Wenn
Sie nicht der vorgesehene Adressat dieser E-Mail oder dessen Vertreter
sein sollten, so beachten Sie bitte, dass jede Form der Kenntnisnahme,
Ver?ffentlichung, Vervielf?ltigung oder Weitergabe des Inhalts dieser
E-Mail unzul?ssig ist. Wir bitten Sie, sich in diesem Fall mit dem
Absender in Verbindung zu setzen und diese E-Mail und jeden Anhang von
Ihrem System zu l?schen. Vielen Dank.
