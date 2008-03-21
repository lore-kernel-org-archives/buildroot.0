From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 21 Mar 2008 22:00:53 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <d449ded70803211116k29dfe743u304b9bc59f317791@mail.gmail.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>	
	<47E3F85A.7000608@eclis.ch>
	<d449ded70803211116k29dfe743u304b9bc59f317791@mail.gmail.com>
Message-ID: <47E42205.40609@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Habib Bouaziz-Viallet a ?crit :
> 2008/3/21, Jean-Christian de Rivaz <jc@eclis.ch>:
>> Habib Bouaziz-Viallet a ?crit :
>>
>>> Hi all !
>>  >
>>  > I would like my tftp server provides access to another directory (e.g
>>  > /var/... param configured with /etc/inetd.conf  with my GNU Debian)
>>  >
>>  > '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
>>  > 'make menuconfig'
>>  >
>>  > How do i do ? Many thanks
>>  >
>>
>>
>> There is a symbol BR2_LINUX_COPYTO to adjust that. Some time ago I found
>>  it broken by the target/linux/Makefile.in.advanced file and I proposed a
>>  patch in this bug report: http://bugs.uclibc.org/view.php?id=2384
> Ok. Did you apply this successfully ? If so how to ?

You can apply with the "patch -p0" command like this:

buildroot$ patch -p0 < patch-tftpboot-kernel.diff
patching file target/linux/Makefile.in.advanced
Hunk #1 succeeded at 227 (offset 18 lines).
Hunk #2 succeeded@387 (offset 19 lines).

I have attached an updated patch that don't show "offset lines".

I am interested to know if it work for your case.
-- 
Jean-Christian de Rivaz
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch-tftpboot-kernel.diff
Type: text/x-patch
Size: 1042 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080321/077472de/attachment.bin 
