From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Tue, 05 Jul 2011 14:28:03 +0200
Subject: [Buildroot] DNS resolv issue with localhost
In-Reply-To: <23843298-AAFD-4E03-A77D-2883BBA856B2@labri.fr>
References: <23843298-AAFD-4E03-A77D-2883BBA856B2@labri.fr>
Message-ID: <4E130353.7030207@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem SOLVED :
I was missing the nsswitch.conf file in /etc, so the resolv order was
wrong (nslookup localhost was requesting the dns server in
/etc/resolv.conf whereas it should have beeb /etc/hosts)
I just added a nsswitch.conf from an another correctly running linux.


Le 05/07/2011 00:42, Jigar SOLANKI a ?crit :
> Hello all,
> 
> I have a LEON3 / XILINX Virtex / Buildroot Linux running on my fpga.
> 
> I have a weird issue with localhost :
> 
> When there is no default route, ping localhost works fine.
> When I set a default route (route add default gw 1.2.3.4), ping localhost doesnt work anymore (but ping 127.0.0.1 still does).
> 
> I have checked my /etc/hosts and my /etc/network/interfaces, they are fine :
> 
> auto lo
> iface lo inet loopback
> 
> hosts :
> 127.0.0.1 localhost
> 
> 
> What am I missing ? 
> 
> Thanks.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110705/851d329f/attachment.asc>
