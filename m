From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 25 May 2015 20:51:54 +0200
Subject: [Buildroot] BR 2015.02: questions re builds for a B3?
In-Reply-To: <01a101d0971a$f66fa480$e34eed80$@novadsp.com>
References: <016301d09701$da9e8e10$8fdbaa30$@novadsp.com>
 <CAGm1_kswdDzE4C1QrxEjHvcfnV2KRe7Weu9J87br7NgF_HdPFQ@mail.gmail.com>
 <018201d0970c$8786bb20$96943160$@novadsp.com>
 <CAGm1_kt550Li788Z4_D1VMq83atzXgabaVvynB8NxhBW4Tj=Sg@mail.gmail.com>
 <01a101d0971a$f66fa480$e34eed80$@novadsp.com>
Message-ID: <CAGm1_kt5r9W0UeRi+4LWg87kNdtMsDOjF6HrvUOt_VAEca0bfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 25, 2015 at 8:45 PM,  <g4@novadsp.com> wrote:
> Yegor,
>
>> >
>> > 'output/build/linux-4.0.4/arch/arm/configs/omap2plus_defconfig' ?
>>
>> BR2_LINUX_KERNEL_DEFCONFIG should just be omap2plus_defconfig,
>> because it is in-tree defconfig file.
>>
>
> Got it. Thanks again. If you have any ideas on the next problem please do chime in!

Great.

Have you read about BR2_EXTERNAL mechanism (the link I've sent you in
my first mail)? You just need to create your own repo with following
folders:

board/mycompany/bbb
configs
package

in board/mycompany/bbb you create following folders like

board/mycompany/bbb/fs-overlay/etc/network/

there you place your custom interfaces file.

You kernel config can be saved in board/mycompany/bbb and you BR
defconfig goes to configs folder.

Yegor
