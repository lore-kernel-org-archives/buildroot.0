From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Tue, 25 Mar 2008 12:01:57 +0100
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <071301c88e62$eced8f30$070514ac@atmel.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
	<47E3F85A.7000608@eclis.ch>
	<071301c88e62$eced8f30$070514ac@atmel.com>
Message-ID: <47E8DBA5.3040304@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
>> 
>> Habib Bouaziz-Viallet a ?crit :
>>> Hi all !
>>>
>>> I would like my tftp server provides access to another directory (e.g
>>> /var/... param configured with /etc/inetd.conf  with my GNU Debian)
>>>
>>> '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
>>> 'make menuconfig'
>>>
>>> How do i do ? Many thanks
>>>
>> 
>> There is a symbol BR2_LINUX_COPYTO to adjust that. Some time ago I found 
>> it broken by the target/linux/Makefile.in.advanced file and I proposed a 
>> patch in this bug report: http://bugs.uclibc.org/view.php?id=2384
>> 
>> Maybe the situation is better now.
 >
 >The linux kernel should possibly be copied several times, and
 >you cannot use a single symbol for this.

Thanks Ulf for your hint, but did you have a more precise example ? I 
observed that only the Atmel targets uses a second symbol 
BR2_TARGET_ATMEL_COPYTO.

I have updated my two proposed patchs 
http://bugs.uclibc.org/view.php?id=2384 and 
http://bugs.uclibc.org/view.php?id=2394 to match the current SVN head. 
There don't change the fact that there is two symbols, there only make 
the COPYTOP symbols possibly work if the tftpboot directory is anything 
other than "/tftpboot" like this is more and more the case on the new 
distributions.

The idea to use only one symbol cam after I see that there is two of 
them for Atmel targets. I still don't see why something would go wrong 
if the BR2_TARGET_ATMEL_COPYTO will be replaced by the BR2_LINUX_COPYTO. 
 From my point of view this remove the confusion for the users to set 
two symbols instead of a single one. I will propose a patch to do that 
only if the first two will be accepted as this one will obviously be 
useless without them.

Best Regards,
-- 
Jean-Christian de Rivaz
