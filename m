From: Daniele Salvatore Albano <info@daccii.it>
Date: Tue, 12 Apr 2011 16:54:57 +0200
Subject: [Buildroot] mySQL Server for buildroot
In-Reply-To: <4DA45B59.10309@michaelburghart.de>
References: <4DA45B59.10309@michaelburghart.de>
Message-ID: <4DA467C1.7080107@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 12/04/2011 16:02, Michael Burghart ha scritto:
 > Hi,
 >
 > Is there a mysql server for buildroot available?

No, but try to create a package with default values for mysql.

Take a look at this package (quite simple, but uses conf end and conf 
optio for configure) to create mysql package
http://git.buildroot.net/buildroot/tree/package/iperf/iperf.mk

Put your package in
package/mysql

Add a Config.in (look at 
http://git.buildroot.net/buildroot/tree/package/iperf/Config.in as example)

and change package/Config.in to add your Config.in package to the list

PS: are you using an hdd on alix? i'm asking because an entire db like 
mysql does a lot of I/O and a compact flash could be killed really 
fastly by this work load

-- 
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.itechcon.it
  Website Design and Development         |
  Software Engineer and Developer        | e-mail:
  Linux Servers SetUp And Administration | info at itechcon.it
  Embedded Network Solutions             | d.albano at itechcon.it

Ai sensi del D.Lgs. 196/2003 si precisa che le informazioni contenute in 
questo messaggio sono riservate ed a uso esclusivo del destinatario. 
Qualora il messaggio in parola Le fosse pervenuto per errore, La 
invitiamo ad eliminarlo senza copiarlo e a non inoltrarlo a terzi, 
dandocene gentilmente comunicazione. Grazie.
Pursuant to Legislative Decree No. 196/2003, you are hereby informed 
that this message contains confidential information intended only for 
the use of the addressee. If you are not the addressee, and have 
received this message by mistake, please delete it and immediately 
notify us. You may not copy or disseminate this message to anyone. Thank 
you.
