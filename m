From: BertHuber <3237-15@online.de>
Date: Sat, 26 Nov 2016 23:19:06 +0100
Subject: [Buildroot] Request for Help
In-Reply-To: <CAOoxthMGQrNFD9c160b1dnRxZpXMn_jbL=wHt9tri=XrFgaOsA@mail.gmail.com>
References: <7E88E7AAEAD14AB9A2F395B26D76F9AF@SYSTEMTECHNIK>
 <CAOoxthNsH-bDWWVgHFmJ03kdPtqGcbjgOUr7YRftMQBfpdx=+w@mail.gmail.com>
 <040E51172C6148C2B2607CC22897F0C2@SYSTEMTECHNIK>
 <CAOoxthMGQrNFD9c160b1dnRxZpXMn_jbL=wHt9tri=XrFgaOsA@mail.gmail.com>
Message-ID: <179527168FDC482AB3A4A137957E4028@SYSTEMTECHNIK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you. I did this and recognized that iproute2 was already selected.
So that means I already have the correct Version on my target system ?
 

  _____  

Von: Cassiano Martin [mailto:cassiano at polaco.pro.br] 
Gesendet: Samstag, 26. November 2016 22:38
An: BertHuber
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Request for Help


Ok, so you go under Target Packages -> Networking Applications -> iproute2 

Check it and do a rebuild. It will install legacy ip and tc tools.

[]'s

2016-11-26 14:06 GMT-02:00 BertHuber <3237-15@online.de>:



I don't know. As I said I'm quite new to the whole Buildroot world.
How can I find out ? .. and if it is the wrong how do I install the right ?
 
 

  _____  

Von: Cassiano Martin [mailto:cassiano at polaco.pro.br] 
Gesendet: Samstag, 26. November 2016 16:52
An: BertHuber
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Request for Help


Right, 

maybe an issue with iproute, are you using busybox one, or the real one,
from 'ip tools' package?

AFAIK bbox ip does not support can. I might be wrong too.

[]'s

2016-11-26 9:38 GMT-02:00 BertHuber <3237-15@online.de>:



Hello,
I am new to this mailinglist and also quite new to the buildroot
environment.
I got stuck in my current project with the following problem:
 
I am currently trying to build an embedded Linux System with Buildroot. 

It works so far, I get a bootable SD Card for my A20 based board. 

I included all CAN Drivers & protocols I could find (can, can_raw and vcan) 

My problem is : after booting and loggin in as root

I type:

 ip link add dev vcan0 type vcan ---- THAT WORKS



but

 ip link add dev can0 type can 



produces:

RTNETLIINK answers: Operation not supported

What is wrong ?? Thanks in advance for any ideas.

Regards

Bert

 


_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailm
<http://lists.busybox.net/mailman/listinfo/buildroot> an/listinfo/buildroot




_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/
<http://lists.busybox.net/mailman/listinfo/buildroot>
mailman/listinfo/buildroot



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161126/e79c6d27/attachment-0001.html>
