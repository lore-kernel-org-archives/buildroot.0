From: =?ISO-8859-1?Q?J=F6rg?= Rebenstorf <Joerg.Rebenstorf@GiN.de>
Date: Tue, 30 Aug 2011 10:19:22 +0200
Subject: [Buildroot] no core dumps
Message-ID: <1314692362.2640.144.camel@jr-ThinkCentre-A57>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using buildroot-2009.11.

I'd like to know how to enable the linux core dump feature in buildroot.
I have written a program that intentionally makes a segfault but still I
get no core dump file. Is there something special with buildroot here?
Do I need to activate a specific build option?
As you can see below I already enabled core dumps with the 'ulimit'
command.

I would also expect the output to be:
Segmentation fault (core dumped)

GL-SH> ./simplecom -h

Usage: ./simplecom [option]
No options means all filters are disabled.
Options:
   -h, --help                      Display this information and exit.
   -v, --version                   Shows the current version and exit.
   -a, --all                       Enables all filters, see below.
   -b, --sync_bus_statistic_rx     Enables 'sync_bus_statistic_rx'
filter.
   -c, --sync_alloctable_change_rx Enables 'sync_alloctable_change_rx'
filter.
   -d, --sync_admindata_rx         Enables 'sync_admindata_rx' filter.
   -s, --sync_async_rx             Enables 'sync_async_rx' filter.
   -t, --sync_alloctable_rx        Enables 'sync_alloctable_rx' filter.
   -u, --bus_status_rx             Enables 'bus_status_rx' filter.
   -l, --sync_lock                 Enables 'sync_lock' filter.
   -o, --sync_shutdown             Enables 'sync_shutdown' filter.
   -r, --sync_ctrl_rx              Enables 'sync_ctrl_rx' filter.
   -e, --sync_eth_rx               Enables 'sync_eth_rx' filter.

Segmentation fault

GL-SH> ulimit -a
time(seconds)        unlimited
file(blocks)         unlimited
data(kb)             unlimited
stack(kb)            8192
coredump(blocks)     unlimited
memory(kb)           unlimited
locked memory(kb)    64
process              2007
nofiles              1024
vmemory(kb)          unlimited
locks                unlimited
GL-SH> 

Cheers,
Crayor
-- 
G.i.N. Gesellschaft f?r industrielle Netzwerke GmbH
Dipl.-Inform. J?rg Rebenstorf
Raiffeisenstr. 15
D-64347 Griesheim
Telefon: +49 6155 - 8259 - 0
Telefax: +49 6155 - 8259 - 11
E-Mail:   joerg.rebenstorf at gin.de
Internet: http://www.gin.de
Sitz: Griesheim
Registergericht: Amtsgericht Darmstadt, HRB 5068
Gerichtsstand: Darmstadt
USt.-ID-Nr. DE 111633284
WEEE-Reg.-Nr. DE 20824942
Gesch?ftsf?hrer:
Dipl.-Ing. Wolfgang Bassenauer
Dipl.-Inform. Andreas Schoenberg

IMPORTANT NOTICE:
This message is intended only for the use of the individual or entity to which it is addressed, and may contain information that is privileged, confidential and exempt from disclosure under applicable law. If the reader of this message is not the intended recipient, or the employee or agent responsible for delivering the message to the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please notify the sender immediately by email.
The above information is automatically added to this e-mail. This addition does not constitute a representation that the content of this e-mail is legally relevant and/or is intended to be legally binding upon G.i.N. mbH.
Thank you.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110830/8baca810/attachment.asc>
