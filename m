From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 25 Jul 2008 14:28:46 +0200
Subject: [Buildroot] Patch for gcc-uclibc-4.x.mk
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF3265388@bfl-exchange-1.BFL.local>
References: <49ED01FC03EE524BB7BB258E8F93BFF3265383@bfl-exchange-1.BFL.local>
	<20080725120725.GB12249@mx.loc>
	<49ED01FC03EE524BB7BB258E8F93BFF3265388@bfl-exchange-1.BFL.local>
Message-ID: <20080725122846.GC12249@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 25, 2008 at 02:16:01PM +0200, Matuschka, Sebastian wrote:
>
>
>> -----Urspr?ngliche Nachricht-----
>> Von: Bernhard Fischer [mailto:rep.dot.nop at gmail.com]
>> Gesendet: Freitag, 25. Juli 2008 14:07
>> An: Matuschka, Sebastian
>> Cc: buildroot at uclibc.org
>> Betreff: Re: [Buildroot] Patch for gcc-uclibc-4.x.mk
>> 
>> On Fri, Jul 25, 2008 at 01:46:42PM +0200, Matuschka, Sebastian wrote:
>> >Hi,
>> >
>> >when compiling with sstrip, the path $(TARGET_DIR)/usr/bin must exist,
>> >otherwise the compilation of gcc will abort and say that
>> >$(TARGET_DIR)/usr/bin doesn't exist.
>> 
>> Please show the actual error you were seeing.

>/atmel/buildrootWork/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -O3  -I/atmel/buildrootWork/build_avr32/staging_dir/usr/include -I/atmel/buildrootWork/build_avr32/staging_dir/include --sysroot=/atmel/buildrootWork/build_avr32/staging_dir/ -isysroot /atmel/buildrootWork/build_avr32/staging_dir -msoft-float .//toolchain/sstrip/sstrip.c -o /atmel/buildrootWork/project_build_avr32/GCD/root/usr/bin/sstrip

ok, so why do you think that creating that $(TARGET_DIR)/usr/bin
belongs to gcc?

Anyway. I've fixed this for me, just to be sure.

>/atmel/buildrootWork/build_avr32/staging_dir/usr/bin-ccache/../lib/gcc/avr32-linux-uclibc/4.2.2/../../../../avr32-linux-uclibc/bin/ld: cannot open output file /atmel/buildrootWork/project_build_avr32/GCD/root/usr/bin/sstrip: Datei oder Verzeichnis nicht gefunden
>collect2: ld returned 1 exit status
>make: *** [/atmel/buildrootWork/project_build_avr32/GCD/root/usr/bin/sstrip] Fehler 1
>
