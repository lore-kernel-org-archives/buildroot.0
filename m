From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 06 Jan 2013 16:15:10 +0200
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <20130106054113.GD13545@sapphire.tkos.co.il>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar> <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
Message-ID: <50E986EE.3030904@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch

6.1.2013 7:41, Baruch Siach kirjoitti:
> Hi Stefan,
>
> On Fri, Jan 04, 2013 at 04:56:53PM +0200, Stefan Fr?berg wrote:
>> Hello Gustavo, all
> [...]
>
>> (It took a long time for me to figure why wireshark that im trying to
>> compile here did not
>> work out with libpcap, untill I found out that the
>> $(STAGING_DIR)/usr/bin/pcap-config spit a
>> wrong prefix all the time...)
> Good to see work on wireshark. Did you fix the RPATH problem I encountered 
> while trying to build tshark 
> (http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/48053) ?
>
> baruch
>

Well, I have managed to compile almost out of the box of wireshark
version 1.8.4.
The only patch
I borrowed was from gentoo linux witch is suppose to fix those damn
-L/usr/lib being
included. Also needed to fix buildroots libpcap config file,
$(STAGING_DIR)/usr/bin/pcap-config.

I did the full gui-wireshark build with almost all the stuff inluded
(left out kerberos and geoip) and
then it stopped at the final linking phase where it was suppose to
create wireshark binary.
Really frustrating.

My buildroot full system is soon rebuild and then I will try to build
wireshark again and post
the error message here.

Regards
Stefan
