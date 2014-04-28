From: Parsa Panahi <panahi.parsa@paravisioner.com>
Date: Mon, 28 Apr 2014 18:01:05 +0430
Subject: [Buildroot] Grub or Network driver Compilation error !
Message-ID: <37401db706d9ddea13b5101ae56a1983@paravisioner.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi 

My buildroot make process stuck in the grub configuration and I don't
know what exactly it is suffering from ?! I think it's something related
to realtek 8139 network driver but I don't know what caused the error
here .... 

Can anyone help me what to do ? I've attached my config file too. 

parsa at parsa-pc:~/Software/buildroot/buildroot-2014.02$ SUDO MAKE 

>>> GRUB 0.97 BUILDING
PATH="/home/parsa/Software/buildroot/buildroot-2014.02/output/host/bin:/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin:/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
/usr/bin/make -j9 -C
/home/parsa/Software/buildroot/buildroot-2014.02/output/build/grub-0.97/
make[1]: Entering directory
`/home/parsa/Software/buildroot/buildroot-2014.02/output/build/grub-0.97'
/usr/bin/make all-recursive
make[2]: Entering directory
`/home/parsa/Software/buildroot/buildroot-2014.02/output/build/grub-0.97'
Making all in netboot
make[3]: Entering directory
`/home/parsa/Software/buildroot/buildroot-2014.02/output/build/grub-0.97/netboot'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/parsa/Software/buildroot/buildroot-2014.02/output/build/grub-0.97/netboot'
Making all in stage2
make[3]: Entering directory
`/home/parsa/Software/buildroot/buildroot-2014.02/output/build/grub-0.97/stage2'
/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/ccache
/usr/bin/gcc -m32 -O2
-I/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/include
-DSUPPORT_LOOPDEV -O0 -Wl,--build-id=none -fno-stack-protector -m32
-L/home/parsa/Software/buildroot/buildroot-2014.02/output/host/lib
-L/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/lib
-Wl,-rpath,/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/lib
-o pre_stage2.exec -nostdlib -Wl,-N -Wl,-Ttext -Wl,8200
pre_stage2_exec-asm.o pre_stage2_exec-bios.o pre_stage2_exec-boot.o
pre_stage2_exec-builtins.o pre_stage2_exec-char_io.o
pre_stage2_exec-cmdline.o pre_stage2_exec-common.o
pre_stage2_exec-console.o pre_stage2_exec-disk_io.o
pre_stage2_exec-fsys_ext2fs.o pre_stage2_exec-fsys_fat.o
pre_stage2_exec-fsys_ffs.o pre_stage2_exec-fsys_iso9660.o
pre_stage2_exec-fsys_jfs.o pre_stage2_exec-fsys_minix.o
pre_stage2_exec-fsys_reiserfs.o pre_stage2_exec-fsys_ufs2.o
pre_stage2_exec-fsys_vstafs.o pre_stage2_exec-fsys_xfs.o
pre_stage2_exec-gunzip.o pre_stage2_exec-hercules.o
pre_stage2_exec-md5.o pre_stage2_exec-serial.o
pre_stage2_exec-smp-imps.o pre_stage2_exec-stage2.o
pre_stage2_exec-terminfo.o pre_stage2_exec-tparm.o
pre_stage2_exec-graphics.o ../netboot/libdrivers.a 
/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/ccache
/usr/bin/gcc -m32 -O2
-I/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/include
-DSUPPORT_LOOPDEV -O0 -Wl,--build-id=none -fno-stack-protector -m32
-L/home/parsa/Software/buildroot/buildroot-2014.02/output/host/lib
-L/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/lib
-Wl,-rpath,/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/lib
-o diskless.exec -nostdlib -Wl,-N -Wl,-Ttext -Wl,8200
diskless_exec-asm.o diskless_exec-bios.o diskless_exec-boot.o
diskless_exec-builtins.o diskless_exec-char_io.o diskless_exec-cmdline.o
diskless_exec-common.o diskless_exec-console.o diskless_exec-disk_io.o
diskless_exec-fsys_ext2fs.o diskless_exec-fsys_fat.o
diskless_exec-fsys_ffs.o diskless_exec-fsys_iso9660.o
diskless_exec-fsys_jfs.o diskless_exec-fsys_minix.o
diskless_exec-fsys_reiserfs.o diskless_exec-fsys_ufs2.o
diskless_exec-fsys_vstafs.o diskless_exec-fsys_xfs.o
diskless_exec-gunzip.o diskless_exec-hercules.o diskless_exec-md5.o
diskless_exec-serial.o diskless_exec-smp-imps.o diskless_exec-stage2.o
diskless_exec-terminfo.o diskless_exec-tparm.o diskless_exec-graphics.o
../netboot/libdrivers.a 
../netboot/libdrivers.a(e1000.o): In function `e1000_io_read':
e1000.c:(.text+0xf0): undefined reference to .`__inl.'/
netboot./.libdrivers.a/(netboote1000.o/)libdrivers.a:( e1000.oIn)
:function In` e1000_io_readfunction' :`
e1000_io_writee1000.c'::(
.e1000.ctext:+(0xf0.)text:+ 0x10dundefined) :reference undefinedto
reference` __inlto' 
`.__outl.'/
netboot./.libdrivers.a/(netboote1000.o/)libdrivers.a:( eepro100.oIn)
:function In` e1000_io_writefunction' :`
wait_for_cmd_donee1000.c'::(
.eepro100.ctext:+(0x10d.)text:+ 0x34undefined) :reference undefinedto
reference` __outlto' 
`.__inb.'/
netbooteepro100.c/:libdrivers.a((.eepro100.otext)+:0x52 )In:
functionundefined `referencewait_for_cmd_done 'to: 
`eepro100.c__inb:'(
.eepro100.ctext:+(0x34.)text:+ 0x66undefined) :reference undefinedto
reference` __inbto' 
`eepro100.c__inb:'(
..text.+/0x52netboot)/:libdrivers.a (undefinedeepro100.o )reference:
toIn `function__inb '`
mdio_writeeepro100.c'::(
.eepro100.ctext:+(0x66.)text:+ 0xd1undefined) :reference undefinedto
reference` __inbto' 
`.__outl.'/
netbooteepro100.c/:libdrivers.a((.eepro100.otext)+:0xf0 )In:
functionundefined `referencemdio_write 'to: 
`eepro100.c__inl:'(
..text.+/0xd1netboot)/:libdrivers.a (undefinedeepro100.o )reference:
toIn `function__outl '`
mdio_readeepro100.c'::(
.eepro100.ctext:+(0xf0.)text:+ 0x15fundefined) :reference undefinedto
reference` __inlto' 
`.__outl.'/
netbooteepro100.c/:libdrivers.a((.eepro100.otext)+:0x17e )In:
functionundefined `referencemdio_read 'to: 
`eepro100.c__inl:'(
..text.+/0x15fnetboot)/:libdrivers.a (undefinedeepro100.o )reference:
toIn `function__outl '`
do_eeprom_cmdeepro100.c'::(
.eepro100.ctext:+(0x17e.)text:+ 0x1e3undefined) :reference undefinedto
reference` __inlto' 
`.__outw.'/
netbooteepro100.c/:libdrivers.a((.eepro100.otext)+:0x205 )In:
functionundefined `referencedo_eeprom_cmd 'to: 
`eepro100.c__outw:'(
.eepro100.ctext:+(0x1e3.)text:+ 0x24dundefined) :reference undefinedto
reference` __outwto' 
`eepro100.c__outw:'(
.eepro100.ctext:+(0x205.)text:+ 0x275undefined) :reference undefinedto
reference` __outwto' 
`eepro100.c__outw:'(
.eepro100.ctext:+(0x24d.)text:+ 0x295undefined) :reference undefinedto
reference` __outwto' 
`eepro100.c__inw:'(
.eepro100.ctext:+(0x275.)text:+ 0x2d4undefined) :reference undefinedto
reference` __outwto' 
`eepro100.c__outw:'(
.eepro100.ctext:+(0x295.)text:+ 0x2f6undefined) :reference undefinedto
reference` __inwto' 
`eepro100.c__outw:'(
..text.+/0x2d4netboot)/:libdrivers.a (undefinedeepro100.o )reference:
toIn `function__outw '`
eepro100_transmiteepro100.c'::(
.eepro100.ctext:+(0x2f6.)text:+ 0x331undefined) :reference undefinedto
reference` __outwto'
../netboot/libdrivers.a(eepro100.o): In function `eepro100_transmit':
eepro100.c :(.`text__inw+'0x331
)eepro100.c:: (undefined. textreference+ 0x353to) :` __inwundefined' 
referenceeepro100.c :to( .`text__outw+'0x353
)eepro100.c:: (undefined. textreference+ 0x432to) :` __outwundefined'
reference 
toeepro100.c :`(__outl.'text
+eepro100.c0x432:)(:. textundefined+ 0x44dreference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x44d:)(:. textundefined+ 0x46dreference) :to undefined`
__outwreference' 
toeepro100.c :`(__inw.'text
+eepro100.c0x46d:)(:. textundefined+ 0x4a5reference) :to undefined`
__inwreference' 
toeepro100.c :`(__inw.'text
+.0x4a5.)/:netboot /undefinedlibdrivers.a (referenceeepro100.o )to:
`In__inw 'function
 .`.speedo_rx_soft_reset/'netboot:/
libdrivers.aeepro100.c(:eepro100.o().:text +In0x4e2 )function:
`undefinedspeedo_rx_soft_reset 'reference: 
toeepro100.c :`(__outb.'text
+eepro100.c0x4e2:)(:. textundefined+ 0x517reference) :to undefined`
__outbreference' 
toeepro100.c :`(__outb.'text
+.0x517.)/:netboot /undefinedlibdrivers.a (referenceeepro100.o )to:
`In__outb 'function
 .`.eepro100_poll/'netboot:/
libdrivers.aeepro100.c(:eepro100.o().:text +In0x530 )function:
`undefinedeepro100_poll 'reference: 
toeepro100.c :`(__inw.'text
+eepro100.c0x530:)(:. textundefined+ 0x5aereference) :to undefined`
__inwreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x5ae:)(:. textundefined+ 0x5c9reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+.0x5c9.)/:netboot /undefinedlibdrivers.a (referenceeepro100.o )to:
`In__outw 'function
 .`.eepro100_disable/'netboot:/
libdrivers.aeepro100.c(:eepro100.o().:text +In0x63e )function:
`undefinedeepro100_disable 'reference: 
toeepro100.c :`(__outl.'text
+eepro100.c0x63e:)(:. textundefined+ 0x659reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x659:)(:. textundefined+ 0x680reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x680:)(:. textundefined+ 0x690reference) :to undefined`
__outwreference' 
toeepro100.c :`(__inw.'text
+eepro100.c0x690:)(:. textundefined+ 0x6acreference) :to undefined`
__inwreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x6ac:)(:. textundefined+ 0x6bcreference) :to undefined`
__outwreference' 
toeepro100.c :`(__inw.'text
+.0x6bc.)/:netboot /undefinedlibdrivers.a (referenceeepro100.o )to:
`In__inw 'function
 .`.eepro100_probe/'netboot:/
libdrivers.aeepro100.c(:eepro100.o().:text +In0x832 )function:
`undefinedeepro100_probe 'reference: 
toeepro100.c :`(__outl.'text
+eepro100.c0x832:)(:. textundefined+ 0x859reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x859:)(:. textundefined+ 0x874reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x874:)(:. textundefined+ 0x8a7reference) :to undefined`
__outwreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x8a7:)(:. textundefined+ 0x8c2reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x8c2:)(:. textundefined+ 0x93dreference) :to undefined`
__outwreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x93d:)(:. textundefined+ 0x958reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x958:)(:. textundefined+ 0x99dreference) :to undefined`
__outwreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x99d:)(:. textundefined+ 0x9b8reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x9b8:)(:. textundefined+ 0x9d3reference) :to undefined`
__outwreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0x9d3:)(:. textundefined+ 0x9eereference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+eepro100.c0x9ee:)(:. textundefined+ 0xc05reference) :to undefined`
__outwreference' 
toeepro100.c :`(__outl.'text
+eepro100.c0xc05:)(:. textundefined+ 0xc20reference) :to undefined`
__outlreference' 
toeepro100.c :`(__outw.'text
+.0xc20.)/:netboot /undefinedlibdrivers.a (referencertl8139.o )to:
`In__outw 'function
 .`.rtl8139_probe/'netboot:/
libdrivers.artl8139.c(:rtl8139.o().:text +In0x81 )function:
`undefinedrtl8139_probe 'reference: 
tortl8139.c :`(__outb.'text
+rtl8139.c0x81:)(:. textundefined+ 0x101reference) :to undefined`
__outbreference' 
tortl8139.c :`(__inb.'text
+rtl8139.c0x101:)(:. textundefined+ 0x11ereference) :to undefined`
__inbreference' 
tortl8139.c :`(__inw.'text
+rtl8139.c0x11e:)(:. textundefined+ 0x1a2reference) :to undefined`
__inwreference' 
tortl8139.c :`(__inb.'text
+.0x1a2.)/:netboot /undefinedlibdrivers.a (referencertl8139.o )to:
`In__inb 'function
 .`.read_eeprom/'netboot:/
libdrivers.artl8139.c(:rtl8139.o().:text +In0x236 )function:
`undefinedread_eeprom 'reference: 
tortl8139.c :`(__outb.'text
+rtl8139.c0x236:)(:. textundefined+ 0x24creference) :to undefined`
__outbreference' 
tortl8139.c :`(__outb.'text
+rtl8139.c0x24c:)(:. textundefined+ 0x25areference) :to undefined`
__outbreference' 
tortl8139.c :`(__inl.'text
+rtl8139.c0x25a:(.text+)0x2a2): :undefined undefinedreference
referenceto to`__outb `'
__inl'rtl8139.c
rtl8139.c::((.text.+0x2a2text+)0x2b0):: undefined undefinedreference
referenceto to ``__outb'__inl
rtl8139.c':(
.textrtl8139.c+0x2b0:(): undefined.text +0x2cbreference): undefinedto
reference`__inl to'
 `rtl8139.c:__outb'(.
rtl8139.ctext+:(0x2cb).text: +0x2d9undefined ):reference to `undefined
__outb'reference 
rtl8139.cto :(`__inl.text'
+0x2d9rtl8139.c:):(. text+0x2f9undefined ):reference undefined to
reference ` to__inl' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x2f9.text):+0x307 undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__inl':(
rtl8139.c.text:(+0x307.text):+0x326 undefined): reference undefined to
reference ` to__inl' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x326.text):+0x334 undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__inl':(
rtl8139.c.text:(+0x334.text):+0x348 undefined): reference undefined to
reference ` to__inl' `
rtl8139.c__inb':(
rtl8139.c.text:(+0x348.text):+0x369 undefined): reference undefined to
reference ` to__inb' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x369.text):+0x377 undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__inl':(
rtl8139.c.text:(+0x377.text):+0x397 undefined): reference undefined to
reference ` to__inl' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x397.text):+0x3a5 undefined): reference undefined to
reference ` to__outb' `__inl'
.
rtl8139.c./:(netboot/.textlibdrivers.a(+0x3a5rtl8139.o)):: undefinedIn
referencefunction to`set_rx_mode `':__inl'
rtl8139.c
.:(./.textnetboot/+0x3ealibdrivers.a():rtl8139.o) undefined: referenceIn
tofunction ``set_rx_mode__outl'':
rtl8139.c
rtl8139.c:(.text:(+0x3ea.text):+0x405 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x405.text):+0x420 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outl':(
..text./+0x420netboot/):libdrivers.a( undefinedrtl8139.o) reference:
toIn `function __outl'`rtl_reset
.':./
rtl8139.cnetboot/:(libdrivers.a(.textrtl8139.o)+0x445: ):In
undefinedfunction reference`rtl_reset to': `
rtl8139.c__outb':(
rtl8139.c.text:(+0x445.text):+0x47a undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__inb':(
rtl8139.c.text:(+0x47a.text):+0x4c3 undefined): reference undefined to
reference ` to__inb' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x4c3.text):+0x4e9 undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x4e9.text):+0x505 undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x505.text):+0x521 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x521.text):+0x545 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x545.text):+0x561 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outb':(
rtl8139.c.text:(+0x561.text):+0x57e undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x57e.text):+0x59a undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x59a.text):+0x5c1 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outw':(
..text./+0x5c1netboot/):libdrivers.a( undefinedrtl8139.o) reference:
toIn `function __outw'`rtl_transmit
.':./
rtl8139.cnetboot/:(libdrivers.a(.textrtl8139.o)+0x69b: ):In
undefinedfunction reference`rtl_transmit to': `
rtl8139.c__outl':(
rtl8139.c.text:(+0x69b.text):+0x6c7 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__outl':(
rtl8139.c.text:(+0x6c7.text):+0x6e6 undefined): reference undefined to
reference ` to__outl' `
rtl8139.c__inw':(
rtl8139.c.text:(+0x6e6.text):+0x710 undefined): reference undefined to
reference ` to__inw' `
rtl8139.c__outw':(
rtl8139.c.text:(+0x710.text):+0x747 undefined): reference undefined to
reference ` to__outw' `
rtl8139.c__inl':(
..text./+0x747netboot/):libdrivers.a( undefinedrtl8139.o) reference:
toIn `function __inl'`rtl_poll
.':./
rtl8139.cnetboot/:(libdrivers.a(.textrtl8139.o)+0x791: ):In
undefinedfunction reference`rtl_poll to': `
rtl8139.c__inb':(
rtl8139.c.text:(+0x791.text):+0x7c9 undefined): reference undefined to
reference ` to__inb' `
rtl8139.c__inw':(
rtl8139.c.text:(+0x7c9.text):+0x7f3 undefined): reference undefined to
reference ` to__inw' `
rtl8139.c__outw':(
rtl8139.c.text:(+0x7f3.text):+0x93a undefined): reference undefined to
reference ` to__outw' `
rtl8139.c__outw':(
rtl8139.c.text:(+0x93a.text):+0x95b undefined): reference undefined to
reference ` to__outw' `
rtl8139.c__outw':(
..text./+0x95bnetboot/):libdrivers.a( undefinedrtl8139.o) reference:
toIn `function __outw'`rtl_irq
.':./
rtl8139.cnetboot/:(libdrivers.a(.textrtl8139.o)+0x992: ):In
undefinedfunction reference`rtl_irq to': `
rtl8139.c__inw':(
rtl8139.c.text:(+0x992.text):+0x9ca undefined): reference undefined to
reference ` to__inw' `
rtl8139.c__outw':(
rtl8139.c.text:(+0x9ca.text):+0x9e8 undefined): reference undefined to
reference ` to__outw' `
rtl8139.c__outb':(
..text./+0x9e8netboot/):libdrivers.a( undefinedrtl8139.o) reference:
toIn `function __outb'`rtl_disable
.':./
rtl8139.cnetboot/:(libdrivers.a(.textrtl8139.o)+0xa1e: ):In
undefinedfunction reference`rtl_disable to': `
rtl8139.c__outb':(
rtl8139.c.text:(+0xa1e.text):+0xa3f undefined): reference undefined to
reference ` to__outb' `
rtl8139.c__inb':(
..text./+0xa3fnetboot/):libdrivers.a( undefinedlibdrivers_a-
referencei386_timer.o) to: `In __inb'function 
.`__load_timer2./':netboot/
i386_timer.clibdrivers.a(:(libdrivers_a-.texti386_timer.o): +In
0xefunction )`__load_timer2:': 
i386_timer.cundefined :(reference .textto +0xe`__inbc):'
 undefinedi386_timer.c: reference(. totext+ `0x27)__inbc': 
i386_timer.cundefined :(reference .textto +0x27`__outbc):'
 undefinedi386_timer.c: reference(. totext+ `0x3b)__outbc': 
i386_timer.cundefined :(reference .textto +0x3b`__outbc):'
 undefinedi386_timer.c: reference(. totext+ `0x51)__outbc': 
i386_timer.cundefined :(reference .textto +0x51`__outbc):'
 undefinedi386_timer.c: reference(. totext+ `0x6a)__outbc': 
i386_timer.cundefined :(reference .textto +0x6a`__outbc):'
 undefined.. reference/netboot to/libdrivers.a
`(libdrivers_a__outbc'-i386_timer.o
.):./ Innetboot/ functionlibdrivers.a(
`libdrivers_a-__timer2_running'i386_timer.o):
: i386_timer.c:In (.function text+`__timer2_running0x7e)':: 
i386_timer.cundefined :(reference .textto +0x7e`__inbc):'
 undefined reference to `__inbc'
collect2: error: ld returned 1 exit status
collect2: error: ld returned 1 exit status
MAKE[3]: *** [PRE_STAGE2.EXEC] ERROR 1
MAKE[3]: *** WAITING FOR UNFINISHED JOBS....
MAKE[3]: *** [DISKLESS.EXEC] ERROR 1
MAKE[3]: LEAVING DIRECTORY
`/HOME/PARSA/SOFTWARE/BUILDROOT/BUILDROOT-2014.02/OUTPUT/BUILD/GRUB-0.97/STAGE2'
MAKE[2]: *** [ALL-RECURSIVE] ERROR 1
MAKE[2]: LEAVING DIRECTORY
`/HOME/PARSA/SOFTWARE/BUILDROOT/BUILDROOT-2014.02/OUTPUT/BUILD/GRUB-0.97'
MAKE[1]: *** [ALL] ERROR 2
MAKE[1]: LEAVING DIRECTORY
`/HOME/PARSA/SOFTWARE/BUILDROOT/BUILDROOT-2014.02/OUTPUT/BUILD/GRUB-0.97'
MAKE: ***
[/HOME/PARSA/SOFTWARE/BUILDROOT/BUILDROOT-2014.02/OUTPUT/BUILD/GRUB-0.97/.STAMP_BUILT]
ERROR 2 
parsa at parsa-pc:~/Software/buildroot/buildroot-2014.02$ 
-- 

Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140428/babb27cd/attachment.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Myconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140428/babb27cd/attachment.ksh>
