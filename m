From: Marco Cane <mca@apss.it>
Date: Fri, 21 Mar 2008 10:35:35 +0100
Subject: [Buildroot] pthread broken in avr32 build
Message-ID: <47E38167.7010908@apss.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
this is my first post on this list.

I'm developing an embedded system based on the atngw100 board, powered 
by an Atmel AVR32 CPU but I found a big issue.
It seems that libpthread has some problems because every program using 
threads ends with a segmentation fault. I first discovered this bug 
while testing JamVM & GNU Classpath. All worked fine, but simple 
applications using Java threads behaved in unexpected manner, while they 
worked fine on my Ubuntu box
So I tried a simple C program like this
http://www.opengroup.org/onlinepubs/009695399/functions/pthread_join.html, 
compiled by the toolchain and also by the installed gcc with the 
-lpthread option with the same result.

I also tried to compile uclibc with the new linux thread support but 
it's broken, due to a missing file (tls.h) for AVR32 architecture.

So my questions are:
1. has anyone experienced this bug and found any solution/workaround?
2. how can I retrieve, if exists, a snapshot of buildroot correctly 
supporting threads for AVR32? because I think something went wrong with 
some patches and I wonder if there is somewhere a working snapshot, 
older than recent ones

thanks in advance

Marco




Ai sensi del D.Lgs. 196/2003, si precisa che le informazioni contenute in questo messaggio e nei suoi eventuali allegati sono riservate e per uso esclusivo del destinatario. Nessuno, all'infuori dello stesso, pu? copiare o distribuire il messaggio, o parte di esso, a terzi. Chiunque riceva questo messaggio per errore, ? pregato di distruggerlo e di darne informazione all'indirizzo di origine.

The information contained in this message may be privileged and confidential and thus protected from disclosure. If the reader of this message is not the intended recipient, or an employee or agent responsible for delivering this message to the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please notify us immediately by replying to the message and deleting it from your computer. Thank you.
