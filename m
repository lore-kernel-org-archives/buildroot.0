From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 21 Nov 2013 15:47:25 +0100
Subject: [Buildroot] [PATCH 1/1] Added stage2 ldscripts
In-Reply-To: <20131121114731.3623f716@skate>
References: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
 <20131121091316.16816a89@skate> <528DDAA9.20309@wanadoo.fr>
 <20131121114731.3623f716@skate>
Message-ID: <528E1CFD.2070000@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 21/11/2013 11:47, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,
>
> On Thu, 21 Nov 2013 11:04:25 +0100, Thierry Bultel wrote:
>
>> I have taken your branch and compiled it. I am testing like this:
>>
>> sudo kvm -cdrom rootfs.iso9660
>>
>> which works with upstream + the lscript patch
>>
>> However, on your branch, the grub menu does not show up, I am only
>> getting the grub minimal prompt. For the moment I cannot figure out why.
>>
>> So that would mean that stage2 is OK but there is another extra issue.
>
> I *believe* this usually means that it can't find the grub
> configuration file.

Yes that's the point. I have attempted to debug:
grub_open fails on /boot/grub/menu.lst

But when I mount my iso image, it is there:

$ ls /mnt/boot/grub/
menu.lst         stage2_eltorito

I finally found out that it is grub does not support the iso9660 filesystem.

I have added it to the list of supported ones and it works.
That is a little bit annoying to have to do it manually.

On your branch it is explicitly deselected when configured, whereas it 
was configured by default on mainstream.

I think it could be could to :
1) Set the supported FS as choices in xconfig
2) Make iso9660 automatically selected when an iso image must be built

Regards
Thierry


>
> Thomas
>
