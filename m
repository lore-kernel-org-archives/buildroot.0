From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 19 Apr 2007 11:28:11 +0200
Subject: [Buildroot] udev problems.
Message-ID: <1176974892.8982.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK; so I was able to boot after copying libgcc_s.so to the root file
system.
Still get an error from udev which complains about lacking something 
in /etc/fstab.
I attach my /etc/fstab at the bottom.



U-Boot> bootm
21000000                                                          
## Booting image at
21000000 ...                                                
   Image Name:
Linux-2.6.20.4                                                 
   Image Type:   ARM Linux Kernel Image
(uncompressed)                          
   Data Size:    1286364 Bytes =  1.2
MB                                        
   Load Address:
20008000                                                       
   Entry Point:
20008000                                                       
   Verifying Checksum ...
OK                                                    
OK                                                                              
                                                                                
Starting
kernel ...                                                             
                                                                                
Uncompressing
Linux.............................................................
Linux version 2.6.20.4 (ulf at elrond) (gcc version 3.4.6) #1 Wed Apr 18
23:50:06 7
CPU: ARM920T [41129200] revision 0 (ARMv4T),
cr=c0007177                        
Machine: Atmel
AT91RM9200-EK                                                    
Memory policy: ECC disabled, Data cache
writeback                               
Clocks: CPU 179 MHz, master 59 MHz, main 18.432
MHz                             
CPU0: D VIVT write-back
cache                                                   
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8
sets             
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8
sets             
Built 1 zonelists.  Total pages:
8128                                           
Kernel command line: root=/dev/ram rw initrd=0x2114A000,6000000
ramdisk_size=15M
AT91: 128 gpio irqs in 4
banks                                                  
PID hash table entries: 128 (order: 7, 512
bytes)                               
Console: colour dummy device
80x30                                              
Dentry cache hash table entries: 4096 (order: 2, 16384
bytes)                   
Inode-cache hash table entries: 2048 (order: 1, 8192
bytes)                     
Memory: 32MB = 32MB
total                                                       
Memory: 23904KB available (2320K code, 255K data, 104K
init)                    
Security Framework v1.0.0
initialized                                           
Capability LSM
initialized                                                      
Mount-cache hash table entries:
512                                             
CPU: Testing write buffer coherency:
ok                                         
NET: Registered protocol family
16                                              
Generic PHY: Registered new
driver                                              
SCSI subsystem
initialized                                                      
usbcore: registered new interface driver
usbfs                                  
usbcore: registered new interface driver
hub                                    
usbcore: registered new device driver
usb                                       
NET: Registered protocol family
2                                               
IP route cache hash table entries: 1024 (order: 0, 4096
bytes)                  
TCP established hash table entries: 1024 (order: 0, 4096
bytes)                 
TCP bind hash table entries: 512 (order: -1, 2048
bytes)                        
TCP: Hash tables configured (established 1024 bind
512)                         
TCP reno
registered                                                             
checking if image is initramfs...it isn't (bad gzip magic numbers);
looks like d
Freeing initrd memory:
5859K                                                    
NetWinder Floating Point Emulator V0.97 (double
precision)                      
JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat,
Inc.                           
io scheduler noop
registered                                                    
io scheduler anticipatory registered
(default)                                  
at91_spi: Baud rate set to
5990400                                              
AT91 SPI driver
loaded                                                          
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a
ATMEL_SERIAL             
atmel_usart.1: ttyS1 at MMIO 0xfffc4000 (irq = 7) is a
ATMEL_SERIAL             
RAMDISK driver initialized: 16 RAM disks of 15360K size 1024
blocksize          
Davicom DM9161E: Registered new
driver                                          
Davicom DM9131: Registered new
driver                                           
PPP generic driver version
2.4.2                                                
eth0: Link now
100-FullDuplex                                                   
eth0: AT91 ethernet at 0xfefbc000 int=24 100-FullDuplex
(04:25:fe:ed:00:18)     
eth0: Davicom 9161 PHY
(Copper)                                                 
usbmon: debugfs is not
available                                                
at91_ohci at91_ohci: AT91
OHCI                                                  
at91_ohci at91_ohci: new USB bus registered, assigned bus number
1              
at91_ohci at91_ohci: irq 23, io mem
0x00300000                                  
usb usb1: Product: AT91
OHCI                                                    
usb usb1: Manufacturer: Linux 2.6.20.4
ohci_hcd                                 
usb usb1: SerialNumber:
at91                                                    
usb usb1: configuration #1 chosen from 1
choice                                 
hub 1-0:1.0: USB hub
found                                                      
hub 1-0:1.0: 2 ports
detected                                                   
Initializing USB Mass Storage
driver...                                         
usbcore: registered new interface driver
usb-storage                            
USB Mass Storage support
registered.                                            
usbcore: registered new interface driver
usbhid                                 
drivers/usb/input/hid-core.c: v2.6:USB HID core
driver                          
usbcore: registered new interface driver
usbserial                              
drivers/usb/serial/usb-serial.c: USB Serial support registered for
generic      
usbcore: registered new interface driver
usbserial_generic                      
drivers/usb/serial/usb-serial.c: USB Serial Driver
core                         
udc: at91_udc version 3 May
2006                                                
mice: PS/2 mouse device common for all
mice                                     
at91_rtc at91_rtc: rtc core: registered at91_rtc as
rtc0                        
AT91 Real Time Clock
driver.                                                    
i2c /dev entries
driver                                                         
at91_i2c at91_i2c: AT91 i2c bus
driver.                                         
TCP cubic
registered                                                            
NET: Registered protocol family
1                                               
NET: Registered protocol family
17                                              
at91_rtc at91_rtc: setting the system clock to 1998-01-01 00:01:57
(883612917)  
eth0: Link now
100-FullDuplex                                                   
IP-Config:
Complete:                                                            
      device=eth0, addr=10.175.196.18, mask=255.255.255.0,
gw=10.175.196.1,     
     host=10.175.196.18, domain=,
nis-domain=(none),                            
     bootserver=10.175.196.220, rootserver=10.175.196.220,
rootpath=            
RAMDISK: ext2 filesystem found at block
0                                       
RAMDISK: Loading 6120KiB [1 disk] into ram disk...
done.                        
VFS: Mounted root (ext2
filesystem).                                            
Freeing init memory:
104K                                                       
mount: can't find udev
in /etc/fstab                                            
Initializing random number generator...
done.                                   
Starting
network...                                                             
ip: RTNETLINK answers: File
exists                                              
Starting HPA's tftpd:
done                                                      
                                                                                
                                                                                
                                                                                
Welcome to the Erik's uClibc development environment running on the
AT91RM9200DF
at91rm9200df login: 



contents of /etc/fstab
# <file system> <mount pt>     <type>           <options>
<dump>  <pass>
/dev/root       /               ext2            rw,noauto
0       1
proc            /proc           proc            defaults
0       0
devpts          /dev/pts        devpts          defaults,gid=5,mode=620
0       0
tmpfs           /tmp            tmpfs           defaults
0       0
configfs        /config         configfs        defaults
0       0
#sysfs          /sys            sysfs           defaults
0       0
usbfs           /proc/bus/usb   usbfs           defaults
0       0
none            /dev/shm        tmpfs           defaults
0       0

-- 
Best Regards
Ulf Samuelsson
