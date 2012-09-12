From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Sep 2012 10:27:27 +0200
Subject: [Buildroot] big root fs
In-Reply-To: <1347438063.92384.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1347366592.32116.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120911154439.47e2b53a@skate>
 <1347427978.76430.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120912084434.13946c09@skate>
 <1347438063.92384.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <20120912102727.46894561@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 12 Sep 2012 01:21:03 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> It is hard to send output/target folder, because it is about 100MB uncompressed.
> Maybe someone will have suggestion, according to next size info:
> The biggest folder inside "target" is /lib(20MB) and? /usr - 86MB (/usr/lib -20MB ; /usr/share - 60).
> Inside /usr/share - the most parts go to folders: locale (35MB); 

Enable option BR2_ENABLE_LOCALE_PURGE. And you can probably set
BR2_ENABLE_LOCALE_WHITELIST to just "C en_US". This should get rid of
most of your usr/share/locale directory.

I'm wondering whether we should make BR2_ENABLE_LOCALE_PURGE=y and
BR2_ENABLE_LOCALE_WHITELIST="C en_US" the defaults.

> fonts(20MB) and X11(5MB).
> I can send some of them although I am aware that info I provided is not so clear.

Can you send the output of:

	cd output/target/
	ls -lRS

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
