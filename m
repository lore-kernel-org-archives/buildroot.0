From: Marc Egli <marc.egli@hsr.ch>
Date: Tue, 8 Dec 2009 22:39:21 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
In-Reply-To: <F9A30328-AECD-494A-A1BB-D28339481F10@hsr.ch>
References: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
	<87r5r5on5c.fsf@macbook.be.48ers.dk>
	<0BEC155F-0AE3-43B6-B538-9C024D89964F@hsr.ch>
	<87my1tocab.fsf@macbook.be.48ers.dk>
	<F9A30328-AECD-494A-A1BB-D28339481F10@hsr.ch>
Message-ID: <61BF8DB1-9217-4309-9B0A-7306170E9A43@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

now i did only a make flush and again make and now it works. seems something is wrong with the config cache. i'll do a rebuild during the night and diff the config cache from now with the one wich leads to this error

Am 08.12.2009 um 22:27 schrieb Marc Egli:

> make clean and make did result in the same error i got before:
> checking for linux/wireless.h... (cached) no
> find ./ -name wireless.h gave me:
> ./output/toolchain/linux-2.6.31.6/include/linux/wireless.h
> ./output/toolchain/uClibc_dev/usr/include/linux/wireless.h
> ./output/toolchain/linux/include/linux/wireless.h
> ./output/build/staging_dir/usr/include/linux/wireless.h
> ./output/build/linux-2.6.31.6/include/config/wireless.h
> ./output/build/linux-2.6.31.6/include/linux/wireless.h
> ./output/build/ifplugd-0.28/src/wireless.h
> 
> and my config is attached
> <brconfig>
> greetings marc
> 
> Am 08.12.2009 um 13:55 schrieb Peter Korsgaard:
> 
>>>>>>> "Marc" == Marc Egli <marc.egli@hsr.ch> writes:
>> 
>> Marc> problem solved. 
>> Marc> i did make flush again and now it works. but i did this 2 times this morning and it didn't help. i hope it builds again if i do a make clean this night.
>> 
>> Please give it a try and/or send your .config to the list so we can fix
>> the problem if there is one.
>> 
>> -- 
>> Bye, Peter Korsgaard
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
