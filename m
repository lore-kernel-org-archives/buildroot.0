From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Wed, 7 Nov 2018 16:07:32 -0200 (BRST)
Subject: [Buildroot] Weird OOM problem
In-Reply-To: <CAF_dkJDX+XuGWcxahLLr4wCAgg9r6PdUrUC-+oPEVuXgAPyMHQ@mail.gmail.com>
References: <CAF_dkJDX+XuGWcxahLLr4wCAgg9r6PdUrUC-+oPEVuXgAPyMHQ@mail.gmail.com>
Message-ID: <391130199.694669.1541614052863.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

----- Mensagem original -----
> De: "Patrick Doyle" <wpdster@gmail.com>
> Para: "buildroot" <buildroot@busybox.net>
> Enviadas: Quarta-feira, 7 de novembro de 2018 13:07:54
> Assunto: [Buildroot] Weird OOM problem

> Hello fellow buildrooters.
> I know this is the wrong list on which to ask this question, but you
> are all experts in this field and can probably either direct me to the
> proper list, or give me some tips here.  (After all, this is where I
> hang out).
> 
> I have an embedded system with 128MB of RAM and no SWAP.
> 
> /tmp is mounted on a tmpfs
> 
> Shortly after boot, I can log in and look at how much memory is free:
> 
> # free
>             total       used       free     shared    buffers     cached
> Mem:        120912      45224      75688        100       7700      17900
> -/+ buffers/cache:      19624     101288
> Swap:            0          0          0
> 
> I create a 25MB file in /tmp, and look again:
> # dd if=/dev/urandom bs=1M count=25 of=/tmp/foo
> 25+0 records in
> 25+0 records out
> # free
>             total       used       free     shared    buffers     cached
> Mem:        120912      53620      67292      25700       1040      33324
> -/+ buffers/cache:      19256     101656
> Swap:            0          0          0
> 
> If I try to create a 2nd 25MB file (or even an 8MB file) in /tmp, then
> the OOM killer kicks in, despite the cat that I have somewhere between
> 67 and 101MB free.
> 
> It would appear that the OOM killer kicks in when the disk cache (aka
> "shared") grows beyond 25% of total RAM.
> 
> Is that true?  Can I tune that?
> 
> I am going to keep looking on my own now that I have learned this
> much, but I figured I would put the question out to the experts in the
> mean time.
> 
> Thanks for any tips you can give me, (even if the tip is, "Go ask SO").
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Had some problems with this, it was caused by the use of a RAMDISK and a wrong parameter passed by uboot for the kernel.

Can you post the line you use ?

Thanks

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
