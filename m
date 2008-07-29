From: J. L. Sloan <jsloan@diag.com>
Date: Tue, 29 Jul 2008 16:23:00 -0600
Subject: [Buildroot] Buildroot for AT91RM9200-EK?
Message-ID: <00c101c8f1c9$ad9f5500$08ddff00$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just to make sure I'm not spinning my wheels, has anyone gotten Buildroot
(22987 is what I'm using right now) working for the Atmel AT91RM9200-EK
board (Atmel AT91 ARM9)?

 

I've got the 2.6.25.10 kernel booting okay, but as soon as it goes to run
/init (really, busybox) wackiness ensues. It traps in clear_user trying to
zero out part of the loaded ELF. GDB+BDI suggests that the address passed
from padzero to clear_user is bogus, but I'm not sure I'm trusting what it's
telling me (some of the other stuff on the stack trace looks questionable).

 

readelf-h suggests AFAIK that everything is built as OABI. (I may restart
from the beginning with EABI, but I'm not sure how U-Boot on the EK was
built, and I'm not sure if that really matters. But U-Boot does "call" the
kernel to start it.)

 

Thanks for any insight.

 

--

John Sloan <http://www.diag.com/navigation/metadata/jsloan.html>
Consulting Technologist

jsloan at diag.com          Digital Aggregates Corporation
<http://www.diag.com/> 

+1 303 489 5178 (Mobile) Arvada
<http://www.google.com/maps?f=q&hl=en&geocode=&q=Arvada+Colorado&ie=UTF8&z=1
1&iwloc=addr&om=1>  Colorado 80001-0587 USA

+1 303 940 9064 (Office) www.diag.com <http://www.diag.com/> 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080729/fc346d0d/attachment.htm 
