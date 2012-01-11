From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 16:35:44 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <87hb029s3c.fsf@macbook.be.48ers.dk>
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
 <4F0D9B42.2070604@labri.fr> <87y5te9uxy.fsf@macbook.be.48ers.dk>
 <4F0D9D1E.7090406@labri.fr> <87lipe9sku.fsf@macbook.be.48ers.dk>
 <4F0DA91F.3000403@labri.fr> <87hb029s3c.fsf@macbook.be.48ers.dk>
Message-ID: <4F0DAC50.7080602@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/01/2012 16:28, Peter Korsgaard a ?crit :
>>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> 
>  >> That doesn't seem to match your first mail:
>  >> 
>  >> # Put a getty on the serial port
>  >> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>  >> 
> 
>  Jigar> Yep, sorry, I was just testing every ttySx at random. The command line
>  Jigar> indeed was with ttyS0 of course, everything in kernel command/serial
>  Jigar> console client/inittab/security is coherent with the ttySx I choose.
> 
>  Jigar> Same result with both.
> 
> What do you mean with 'same result'? From your first mail you mentioned
> you got 'Welcome to Buildroot' and a Login prompt. If you boot with
> init=/bin/sh you shouldn't get any of that.
> 
> I notice you don't provide any root=. What kind of file system are you
> trying to boot?
> 
> Perhaps just paste the entire boot log.
> 

Yes, I didn't get anything of that.

So, with ttyS0, with complete command = console=ttyS0,38400,
I get to the boot prompt, where I can't type anything, the keyboard
doesnt respond.

And with complete command = console=ttyS0,38400 init=/bin/sh
The boot process hangs on the first line which is Booting Linux....
and then..nothing. If I tried to type anything with my keyboard at that
time, same result, which is : nothing happens, the keyboard still doesnt
responding at all.

I also tried with a USB<->Serial converter (so, with ttyUSB0 then) and
had the same result without init=/bin/sh, I get to the Buildroot boot
prompt and then cannot login because I can't type anything ; and also
wiith init=/bin/sh where the boot process stops at Booting Linux...and
then nothing happens, even if I type something. Even with ENTER key, the
output doesnt go to the next blank line...

Sigh...
-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69
Web   : http://www.labri.fr/perso/solanki

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/9d1110fd/attachment.asc>
