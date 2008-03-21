From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 21 Mar 2008 22:20:29 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <47E42205.40609@eclis.ch>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>	
	<47E3F85A.7000608@eclis.ch>
	<d449ded70803211116k29dfe743u304b9bc59f317791@mail.gmail.com>
	<47E42205.40609@eclis.ch>
Message-ID: <47E4269D.3060207@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christian de Rivaz a ?crit :
> Habib Bouaziz-Viallet a ?crit :
>> 2008/3/21, Jean-Christian de Rivaz <jc@eclis.ch>:
>>> Habib Bouaziz-Viallet a ?crit :
>>>
>>>> Hi all !
>>>  >
>>>  > I would like my tftp server provides access to another directory (e.g
>>>  > /var/... param configured with /etc/inetd.conf  with my GNU Debian)
>>>  >
>>>  > '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
>>>  > 'make menuconfig'
>>>  >
>>>  > How do i do ? Many thanks
>>>  >
>>>
>>>
>>> There is a symbol BR2_LINUX_COPYTO to adjust that. Some time ago I found
>>>  it broken by the target/linux/Makefile.in.advanced file and I 
>>> proposed a
>>>  patch in this bug report: http://bugs.uclibc.org/view.php?id=2384
>> Ok. Did you apply this successfully ? If so how to ?
> 
> You can apply with the "patch -p0" command like this:
> 
> buildroot$ patch -p0 < patch-tftpboot-kernel.diff
> patching file target/linux/Makefile.in.advanced
> Hunk #1 succeeded at 227 (offset 18 lines).
> Hunk #2 succeeded at 387 (offset 19 lines).
> 
> I have attached an updated patch that don't show "offset lines".
> 
> I am interested to know if it work for your case.

Ooops! The attached patch need to be applyed with the -p1 option like this:

buildroot$ patch -p1 < ../buildroot-patch/patch-tftpboot-kernel.diff
patching file target/linux/Makefile.in.advanced

Sorry for the mistake.
-- 
Jean-Christian de Rivaz
