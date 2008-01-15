From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Tue, 15 Jan 2008 09:39:28 -0500
Subject: [Buildroot] error messages
In-Reply-To: <000d01c85704$1d397690$e5031a0a@atmel.com>
References: <00b501c853c9$4fc21330$6e00a8c0@JONATHAN><00a601c85644$796a65c0$020514ac@atmel.com><01f101c856c9$be8ff5e0$6e00a8c0@JONATHAN><d6cda7730801140911x5b866f6ew44f96f7f93084f49@mail.gmail.com>
	<022d01c856e1$f8f27a10$6e00a8c0@JONATHAN>
	<020401c856e7$d9220a60$e5031a0a@atmel.com>
	<028001c856f7$53f33de0$6e00a8c0@JONATHAN>
	<000d01c85704$1d397690$e5031a0a@atmel.com>
Message-ID: <004b01c85784$6ec6c8c0$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I replace it with a mDNS routine because if you look at it, it use the
memset function like you suggest to me. If you prefer to have the memset
directly in the code, I will change it. 

Regards

Jonathan
-----Message d'origine-----
De?: Ulf Samuelsson [mailto:ulf at atmel.com] 
Envoy??: 14 janvier 2008 18:21
??: Jonathan Dumaresq
Objet?: Re: [Buildroot] error messages


Here the result patch.

I hope I done the right thing. This is my first patch !!!

Even with the correction I always have errors. 

Jonathan

==> No, you are replacing the bzero with an mDNS specific routine,
        and you should use the uClibc routine I proposed.

        Best Regards
        Ulf Samuelsson


-----Message d'origine-----
De : Ulf Samuelsson [mailto:ulf at atmel.com] 
Envoy? : 14 janvier 2008 14:52
? : Jonathan Dumaresq; buildroot at uclibc.org
Objet : Re: [Buildroot] error messages

> Hi,

> This is not something that i'm normaly do on a daily basis. So I have the
> file modified, but I'm try to make a patch. I try with svn diff, but
thoses
> file are not part of the svn. So what is the best way of providing a
working
> patch ?
> Regards
> Jonathan


==>

$ svn add <file>
$ svn diff

    or create two trees and do

$    diff -urN <original tree> <new tree>    >   mychanges.patch




Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
