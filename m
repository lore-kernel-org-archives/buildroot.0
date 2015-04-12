From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2015 16:23:35 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/exim: Add optional OpenSSL
	support
References: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
 <20150412132302.GF4218@free.fr> <20150412134418.GA21018@free.fr>
 <XnsA47AA092866DAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150412135643.GB21018@free.fr>
Message-ID: <XnsA47AA6C2493EDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20150412135643.GB21018 at free.fr: 

>> smtp_in.c: In function ?smtp_start_session?:
>> smtp_in.c:1976:36: error: invalid application of ?sizeof? to incomplete
>> type ?struct options?
>>      EXIM_SOCKLEN_T optlen = sizeof(struct ip_options) + MAX_IPOPTLEN;
> 
> Well, would it not be much simpler to just ditch support for static
> builds in exim? I.e. mark it as depends on !static .

Hi,

this compile bug is unrelated to static/shared linking, here is a fix 
proposal: http://patchwork.ozlabs.org/patch/460496/

For the nsl problem: http://patchwork.ozlabs.org/patch/460495/

Regards, Bernd
