From: softa at ttechgroup.com <softa@ttechgroup.com>
Date: Sun, 14 Oct 2007 15:37:11 +0300
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>	<47116C13.9020701@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net>
	<47120EE5.9040508@promwad.com>
Message-ID: <002c01c80e5e$f177bcd0$6614a8c0@softalap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message ----- 
From: "Ivan Kuten" <ivan.kuten@promwad.com>
To: "Leonid" <Leonid@a-k-a.net>
Cc: <buildroot@uclibc.org>
Sent: Sunday, October 14, 2007 3:43 PM
Subject: Re: [Buildroot] Some devices are not created in the ext2 
filesystem.


>> I see that correspondent files are indeed created in the root filesystem
>> tree:
>>
>> [leonid at jaipur buildroot]$ ls -al root/dev/mc*
>> -rw-r----- 1 root root 0 2007-10-13 21:56 root/dev/mcfp-0
>> -rw-r----- 1 root root 0 2007-10-13 21:56 root/dev/mcfp-1
>>
>> However when I load my ext2 root filesystem, I don't see these device
>> nodes in /dev directory. What is wrong?
>>
>
> Check that you are not using udev, because udev is mounted over /dev
> thus hiding your entries.

Listed files are regular files, not device nodes! Use devicetable.txt for 
creating device nodes.

BR
Assen

>
> BR,
> Ivan
>
> --------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
