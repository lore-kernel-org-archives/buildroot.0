From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 12 Feb 2010 13:14:06 +0100
Subject: [Buildroot] Q: Name resolving ?
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67016D522D@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Don't know if this is the right place to drop this question, but maybe
someone can help or give me a hint.

I've build a buildroot system (for an at91 based board) with busybox and
DHCP client  (udhcpc), which is all working.

Here comes the question: 

I would like to that the AT91BOARD1 registers his HOSTNAME (which is
AT91BOARD1) with our 'windows' network. 
Someone that can give me a hint how to get this working ?

( name resolving on the at91-board is working,but the at91-board  does
not register itself to the 'win32'-nameserver(s) )

Do I need a package to get this working or is this a option somewhere
(that is not enabled) ?

Regards Noel.



Maybe this 
<< log >>

AT91BOARD1 login:zzzzzzz
Password: yyyyyyy

# cat /etc/resolv.conf 
search xxxxxxx.com
nameserver 150.158.204.31
nameserver 150.158.148.101
nameserver 150.158.148.100

{ got this over dhcp , i.o.w. udhcpc }


# cat /etc/hostname  
AT91BOARD1

# ping busybox.net
PING busybox.net (140.211.167.224): 56 data bytes


On another host...

ping AT91BOARD1  fails..

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100212/2a0ba8b6/attachment.htm>
