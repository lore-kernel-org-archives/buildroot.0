From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 27 Aug 2007 23:15:09 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:	atngw100/target_skeleton
	atngw100/target etc...
In-Reply-To: <1188218331.7840.26.camel@localhost.localdomain>
References: <20070821013441.98D34A610B@busybox.net>
	<1188218331.7840.26.camel@localhost.localdomain>
Message-ID: <20070827211509.GX11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 27, 2007 at 02:38:51PM +0200, Hans-Christian Egtvedt wrote:
>On Mon, 2007-08-20 at 18:34 -0700, ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2007-08-20 18:34:40 -0700 (Mon, 20 Aug 2007)
>> New Revision: 19596
>> 
>> Log:
>> additional skeleton for AVR32
>> 
>> Added:
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/
>
>What is up with all the directories? Is not defining them
>in .../<board>/device_table.txt enough? I find it far better defining
>them there since the access permissions can be defined as well.

Ulf, all your crap added a compressed (!) 2MB during the last month.

It would be way better to clean-up that mess and _not_ duplicate it over
all of target/device/Atmel. Furthermore, it's absolutely ugly to force
all such helper-files upon your users, because they will not build the
majority of those packages anyway.

Fortunetely i don't use those at all, but even the fact that you guys
force me to download such a mess is disgusting, at best. Don't get me
wrong, but such skeletons are really unacceptable.

Apart from that, i can only what Hans-Christian writes below :-/

*sigh*. oh well,
Bernhard
>Same for all the directories below.
>
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/boot/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/config/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/dev/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/home/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/lib/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/mnt/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/opt/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_history
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_logout
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bash_profile
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.bashrc
>
>What are the needs for these bash-files? I find the default bash
>behavior to be ok.
>
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/sbin/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/tmp/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/cache/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lib/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lib/pcmcia/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lock/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/log/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/pcmcia/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/run/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/spool/
>>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/tmp/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/bin/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/boot/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/config/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/dev/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/home/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/lib/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/mnt/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/opt/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/proc/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_history
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_logout
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bash_profile
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.bashrc
>
>Same as previous .bash-files.
>
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/sbin/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/tmp/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/cache/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lib/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lib/pcmcia/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lock/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/log/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/pcmcia/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/run/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/spool/
>>    trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/tmp/
>
><cut diff>
>
>-- 
>With kind regards,
>Hans-Christian Egtvedt, Applications Engineer
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
