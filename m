From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sat, 22 Mar 2008 18:36:00 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <d449ded70803220954o3faacc4dn6d1668334432a782@mail.gmail.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>	
	<47E3F85A.7000608@eclis.ch>	
	<d449ded70803211116k29dfe743u304b9bc59f317791@mail.gmail.com>	
	<47E42205.40609@eclis.ch> <47E4269D.3060207@eclis.ch>	
	<d449ded70803220329u576c9854kf10c4fa1cf1f4e48@mail.gmail.com>	
	<47E535F7.5050707@eclis.ch>
	<d449ded70803220954o3faacc4dn6d1668334432a782@mail.gmail.com>
Message-ID: <47E54380.6040101@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Habib Bouaziz-Viallet a ?crit :
> 2008/3/22, Jean-Christian de Rivaz <jc@eclis.ch>:
>> Habib Bouaziz-Viallet a ?crit :
>>
>>
>>>>  > I am interested to know if it work for your case.
>>  > Oh it does not work for me ... unfortunately. I resolved the pb by a
>>  > symbolic link.
>>
>>
>> Ok. Can you give me the error message or the configuration to reproduce
>>  the problem ? I have some motivation to solve this issue.
> As i noticed in my previous post i make a symlink from /tftpboot -->
> /home/ ..../buildroot/tftpboot and build process works fine now
> 
> habib at mizar:~/PROJETS/PERSO/buildroot$ ls tftpboot/
> at91sam9260dfc-dataflashcardboot-2.3.bin        autoscript.loopee!  vmlinux
> at91sam9260dfc-u-boot-1.2.0-atmel-20080322.bin  bzImage
> 
> So what configuration would you see ? Is it my .config in buildroot root tree ?

Initially yes, but finally no.

I see now that you use an Atmel target. Atmel target have an other 
symbol used to copy file into the tftpboot directory. I suspect that the 
patch you tryed only solve the tftpboot issue with the kernel, but not 
the issue with the Atmel target. I really don't know the rational for 
having two symbols for the tftpboot directory, this is maybe the result 
of some historic of the Atmel targets. Anyone know ?

I was hoping that you used a target other than Atmel to see if my patch 
was helpful. I am now back to the staring point. Sorry for having lost 
some of your time.

Still, I will be very happy if some maintainers can give to me an guess 
if the BR2_TARGET_ATMEL_COPYTO should be replaced by to BR2_LINUX_COPYTO 
symbol. I am motivated to provide a appropriate patch to make the 
tftpboot directory working correctly if it is not exactly "/tftpboot".

Have a good day,
-- 
Jean-Christian de Rivaz
