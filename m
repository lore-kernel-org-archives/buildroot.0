From: Adeel Nafis <adeel@linkwisetech.com>
Date: Thu, 31 Jan 2013 07:51:32 +0500
Subject: [Buildroot] can not open ttyUSB0 [solved]
In-Reply-To: <mailman.5.1359547202.23860.buildroot@busybox.net>
References: <mailman.5.1359547202.23860.buildroot@busybox.net>
Message-ID: <5109DC34.1070701@linkwisetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To: Adeel Nafis<adeel@linkwisetech.com>
Cc:buildroot at busybox.net
Subject: Re: [Buildroot] can not open ttyUSB0
Message-ID:<5108F2DF.7030805@zacarias.com.ar>
Content-Type: text/plain; charset=ISO-8859-1

Thanks everyone, the problem was not related to driver, it was related 
to incorrect path (my stupidity), previously my command for executing 
usb_modeswitch from my 'c' code was

FILE *fp = popen("usb_modeswitch -v 12d1 -p 1446 -c 
/usr/share/usb_modeswitch/12d1:1446", "r");

have to quote the path due to the colon

FILE *fp = popen("usb_modeswitch -v 12d1 -p 1446 -c 
\"/usr/share/usb_modeswitch/12d1:1446\"", "r");


-- 
Adeel Ahmed Nafis
Design Engineer
LINKWISE TECHNOLOGY PTE LTD
Blk 3 Ang Mo Kio Industrial Park 2A
#06-08, AMK TECH 1
Singapore 568050
