From: =?UTF-8?B?KioqKiogKioqKio=?= <zyama.abel@mail.ru>
Date: Fri, 11 May 2018 14:58:29 +0300
Subject: [Buildroot] 
 =?utf-8?q?BUG=3A_BR-2018=2E05-rc1_cannot_build_dahdi?=
 =?utf-8?q?-linux_2=2E11=2E1?=
In-Reply-To: <1933348917.58346.1526039534346.JavaMail.zimbra@datacom.com.br>
References: <1526036020.685182559@f413.i.mail.ru>
 <1933348917.58346.1526039534346.JavaMail.zimbra@datacom.com.br>
Message-ID: <1526039909.526243231@f402.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you. I know about $(BR2_DL_DIR)/dahdi-linux/$(f)


???????, 11 ??? 2018, 14:52 +03:00 ?? Carlos Santos <casantos@datacom.ind.br>:
>> From: "***** *****" < zyama.abel@mail.ru >
>> To: "buildroot" < buildroot@busybox.net >
>> Sent: Friday, May 11, 2018 7:53:40 AM
>> Subject: [Buildroot] BUG: BR-2018.05-rc1 cannot build dahdi-linux 2.11.1
>
>> --2018-05-11 10:40:40--
>> [
>>  http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te436-10017.tar.gz
>> |
>>  http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-te436-10017.tar.gz
>> ]
>> Resolving proxy.telros.lan (proxy.myname.lan)... 192.35.10.45
>> Connecting to proxy.telros.lan (proxy.myname.lan)|192.35.10.45|:2020...
>> connected.
>> Proxy request sent, awaiting response... 200 OK
>> Length: 210601 (206K) [application/x-gzip]
>> Saving to:
>> '/buildroot/output/build/.dahdi-fw-te436-10017.tar.gz.s6cXtq/output'
>
>> /buildroot/output/build/.dahdi-fw-te436-
>> 100%[=================================================================================>]
>> 205.67K --.-KB/s in 0.05s
>
>> 2018-05-11 10:40:40 (4.20 MB/s) -
>> '/buildroot/output/build/.dahdi-fw-te436-10017.tar.gz.s6cXtq/output'
>> saved [210601/210601]
>
>> dahdi-fw-te436-10017.tar.gz: OK (sha256:
>> 0980f4a8d191c6872aa27d971758046f0e7827ac161549f2cc1b0eeab0ae9333)
>> >>> dahdi-linux 2.11.1 Extracting
>> gzip -d -c /buildroot/dl/dahdi-linux/dahdi-linux-2.11.1.tar.gz | tar
>> --strip-components=1 -C /buildroot/output/build/dahdi-linux-2.11.1 -xf
>> -
>> cp "/buildroot/dl"/dahdi-fwload-vpmadt032-1.25.0.tar.gz
>> /buildroot/output/build/dahdi-linux-2.11.1/drivers/dahdi/firmware/dahdi-fwload-vpmadt032-1.25.0.tar.gz
>> cp: cannot stat '/buildroot/dl/dahdi-fwload-vpmadt032-1.25.0.tar.gz': No
>> such file or directory
>> package/ [  http://pkg-generic.mk:156/ | pkg-generic.mk:156 ] : recipe for target
>> '/buildroot/output/build/dahdi-linux-2.11.1/.stamp_extracted' failed
>> make: *** [/buildroot/output/build/dahdi-linux-2.11.1/.stamp_extracted]
>> Error 1
>
>[CC Yann]
>
>The dahdi-linux recipe is boken since commit 514291f39ef06, AFAICT.
>Notice that it attempts to copy from $(BR2_DL_DIR)/$(f) while it
>should copy from $(BR2_DL_DIR)/dahdi-linux/$(f).
>
>-- 
>Carlos Santos (Casantos) - DATACOM, P&D
>?Marched towards the enemy, spear upright, armed with the certainty
>that only the ignorant can have.? ? Epitaph of a volunteer



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180511/989ce026/attachment.html>
