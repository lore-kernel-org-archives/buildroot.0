From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jan 2014 23:58:28 +0100
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <748467273.4509268.1390205590826.JavaMail.root@openwide.fr>
References: <748467273.4509268.1390205590826.JavaMail.root@openwide.fr>
Message-ID: <52DDAA14.5060307@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/01/2014 09:13, Jeremy Rosen a ?crit :
> aaand reproduced.
>
> following the steps described, I get that problem systematically
>
> I use make 3.81 (debian testing) and I'm not sure what else is
> involved when crashing that early.
>
>
> I tried with LANG=C in case there was anything weird, but apparently not
>
> My make skills are not very high so i'll gladly take any help on
> figuring that one out...
>
> Cordialement
>
> J?r?my Rosen
> +33 (0)1 42 68 28 04
>
> fight key loggers : write some perl using vim
>
>
> Open Wide Ingenierie
>
> 23, rue Daviel
> 75012 Paris - France
> www.openwide.fr
>
>
>
>
>
> ----- Mail original -----
>>>> J?r?my, can you describe your setup, so we can try to reproduce
>>>> it,
>>>> and
>>>> find a proper fix?
>>
>> Ok, i'll look into it and try to figure out...
>>
>> it's really weird that you were not able to reproduce with the steps
>>   in the patch, it was pretty systematic for me. I'll try to reproduce
>> and report whatever I find
>>
Hi J?r?my, Yann

I'm able to reproduce the issue here.

There is no specific setup, I used my current buildroot directory and run:

make O=.. BR2_EXTERNAL=.. raspberrypi_defconfig
make: stat: /home/naourr/git/buildroot/configs/../configs/../configs/..
[snip]
../configs/raspberrypi_defconfig ?. Stop

Or

make O=../output BR2_EXTERNAL=.. raspberrypi_defconfig
make: stat: /home/naourr/git/buildroot/configs/../configs/../configs/..
[snip]
../configs/raspberrypi_defconfig ?. Stop

But it's ok with :

make O=../output BR2_EXTERNAL=../external raspberrypi_defconfig  GEN     
../output/Makefile
#
# configuration written to ../output/.config
#

I have no solution currently, but I hope this help...

Yann, what's wrong with relative path for BR2_EXTERNAL or O ?

Best regards,
Romain Naour
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140120/bc34c76b/attachment.html>
