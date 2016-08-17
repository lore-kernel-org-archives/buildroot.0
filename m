From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Aug 2016 20:26:08 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-AALR9MO5iY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

--- Comment #2 from CB <christophebricout@yahoo.fr> ---
Dear Ezequiel,

In order to clarify my issue, I made some additional test.
Please find here after the results 

SUMMARY: 

Using the default buildroot configuration paramaters, I am not able to mount an
external USB. For information, linux was booting sucessfully from SDcard.

So, I would like to know if I missed some steps/actions on buildroot
configuration in order to access an external USB drive .... 
Is that normal or a unix workaround is available.

Thanks in advance for your support.
I can make addionnal test.

Regards

Technical information: 

BUILDROOT VERSION:

I am using the last stable version of buildrppt (2016.05) and I am 
configuring  buildroot using minnowboard_max_defconfig file.

Note: The problem still exists with 2015.11.1


MINNOWBOARD MAX/TURBOT LOG FILE:

Here after, please find an extract of the screenshot.
The usb 2-1 device has been found but I am not able to mount it.

......       
usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd                      
fbcon: inteldrmfb (fb0) is primary device                                       
input: HDA Intel PCH HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:1b.0/sound/ca4
input: HDA Intel PCH HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:1b.0/sound/ca5
mmc2: new high speed SDHC card at address 0001                                  
mmcblk0: mmc2:0001 SD16G 14.6 GiB                                               
 mmcblk0: p1 p2  
Console: switching to colour frame buffer device 128x48                         
i915 0000:00:02.0: fb0: inteldrmfb frame buffer device                          
EXT4-fs (mmcblk0p2): couldn't mount as ext3 due to feature incompatibilities    
EXT4-fs (mmcblk0p2): couldn't mount as ext2 due to feature incompatibilities    
EXT4-fs (mmcblk0p2): INFO: recovery required on readonly filesystem             
EXT4-fs (mmcblk0p2): write access will be enabled during recovery               
clocksource: Switched to clocksource tsc                                        
EXT4-fs (mmcblk0p2): recovery complete                                          
EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)    
VFS: Mounted root (ext4 filesystem) readonly on device 179:2.                   
devtmpfs: mounted                                                               
Freeing unused kernel memory: 808K (ffffffff81783000 - ffffffff8184d000)        
EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered                             
Starting logging: OK                                                            
Initializing random number generator... random: dd urandom read with 10 bits
ofe
done.    

Welcome to Buildroot                                                            
buildroot login: root   


MOUNT COMMAND :

# mount                                                                         
/dev/root on / type ext4 (rw,relatime,data=ordered)                             
devtmpfs on /dev type devtmpfs
(rw,relatime,size=975292k,nr_inodes=243823,mode=)
proc on /proc type proc (rw,relatime)                                           
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)                     
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)                             
tmpfs on /tmp type tmpfs (rw,relatime)                                          
tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)                    
sysfs on /sys type sysfs (rw,relatime)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
