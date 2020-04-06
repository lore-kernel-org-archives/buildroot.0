From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 6 Apr 2020 12:00:19 +0000
Subject: [Buildroot] Strange non-deterministic error while building
 buildroot 2020.02 package iio-tools
In-Reply-To: <26420_1586173595_5E8B169B_26420_140_1_20200406114633.GE3140@r-lnx-nyma7486-2>
References: <04a6cac9-7763-db6d-b3c5-d6156b374196@microchip.com>
 <26420_1586173595_5E8B169B_26420_140_1_20200406114633.GE3140@r-lnx-nyma7486-2>
Message-ID: <d66896fd-3a57-6fe7-9df4-4f22a4ef2524@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.04.2020 14:46, yann.morin at orange.com wrote:

> Eugen, All,
> 
> On 2020-04-06 11:38 +0000, Eugen.Hristev at microchip.com spake thusly:
>> Hello,
>>
>> Has anyone encountered such error?
>> Attempting to build it again works... however it stopped at this error
>> several times when building (10 % of cases)
>>
>> At first I suspected my file system, but, why does this crash happen all
>> the time in the same place ?
>>
>> Thanks in advance !
>>
>>   >>> linux-tools  Building
>> PATH="/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/bin:/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
>> /usr/bin/make -j41 -C
>> /home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/iio
>> HOSTCC="/usr/bin/gcc -O2
>> -I/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/include
>> -L/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/lib
>> -Wl,-rpath,/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/lib"
>> ARCH=arm
>> INSTALL_MOD_PATH=/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/target
>> CROSS_COMPILE="/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/bin/arm-buildroot-linux-gnueabihf-"
>> DEPMOD=/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/sbin/depmod
>> INSTALL_MOD_STRIP=1
>> mkdir -p include/linux/iio 2>&1 || true
>> ln -sf
>> /home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/iio/../../include/uapi/linux/iio/events.h
>> include/linux/iio
>> ln -sf
>> /home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/iio/../../include/uapi/linux/iio/types.h
>> include/linux/iio
>>     CC       iio_event_monitor.o
>>     CC       lsiio.o
>>     CC       iio_utils.o
>>     CC       iio_generic_buffer.o
>>     CC       iio_utils.o
>>     CC       iio_utils.o
>>     LD       iio_event_monitor-in.o
>>     LD       iio_generic_buffer-in.o
>> /home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/bin/arm-buildroot-linux-gnueabihf-ld:
>> iio_utils.o: file not recognized: file truncated
> 
> I guess you'll want to cary linux commit 731b60afcb3d3 (tools: iio:
> Correctly add make dependency for iio_utils) as a local patch.

Thanks very much for quick reply and solution !

Eugen

> 
> Regards,
> Yann E. MORIN.
> 
>> /home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/build/Makefile.build:144:
>> recipe for target 'iio_generic_buffer-in.o' failed
>> make[3]: *** [iio_generic_buffer-in.o] Error 1
>> Makefile:49: recipe for target 'iio_generic_buffer-in.o' failed
>> make[2]: *** [iio_generic_buffer-in.o] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>>     LD       lsiio-in.o
>> package/pkg-generic.mk:266: recipe for target
>> '/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-tools/.stamp_built'
>> failed
>> make[1]: ***
>> [/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-tools/.stamp_built]
>> Error 2
>> Makefile:84: recipe for target '_all' failed
>> make: *** [_all] Error 2
>> Buildroot: failed to make
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
>                                          ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> | +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> |      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
> '--------------------------------------:______/_____:------------------'
> 
> 
> _________________________________________________________________________________________________________________________
> 
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
