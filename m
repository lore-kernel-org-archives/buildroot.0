From: Daniele Salvatore Albano <info@daccii.it>
Date: Fri, 15 Jul 2011 11:46:00 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <201107151122.41685.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
Message-ID: <4E200C58.4050401@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 15/07/2011 11:34, Thomas De Schampheleire ha scritto:
> This works fine in the context of buildroot. However, I need to access
> these files from a non-buildroot context (external makefiles/scripts)
> and so the variable BR2_LINUX_KERNEL_VERSION is not known.
>
> Thomas

If you're using *sh scripts, you can just do something like
. /PATH/TO/BUILDROOT/.config

to access buildroot config variables so you can use that variable

If you're using make file i don't know, but there is a way to do it too, 
sure :)

In the end, if you're using anithing else you can try to parse using 
regular expressions (needs delimiters and/or backslashes around quotes)
BR2_LINUX_KERNEL_VERSION="?([a-zA-Z0-9\.\-]+)"?

or cat, grep and cut
cat .config | grep BR2_LINUX_KERNEL_VERSION | cut -d"\"" -f2


Best Regards,
Daniele

-- 
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.itechcon.it
  Webapps Design and Development         |
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
