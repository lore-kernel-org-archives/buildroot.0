From: Mark Jackson <mpfj@mimc.co.uk>
Date: Fri, 18 Jul 2008 21:19:18 +0100
Subject: [Buildroot] mkfs.jffs2 error ...
Message-ID: <4880FAC6.6090506@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have encountered an error as follows:-

faust at faust-development:~/AVR32/buildroot$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
LD_LIBRARY_PATH sane:                           Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok          
C compiler '/usr/bin/gcc'                                   
C compiler version '4.2.3':                     Ok          
C++ compiler '/usr/bin/g++'                                 
C++ compiler version '4.2.3':                   Ok          
awk installed:                                  Ok          
bison installed:                                Ok          
flex installed:                                 Ok          
gettext installed:                              Ok          
makeinfo installed:                             Ok          
Build system dependencies:                      Ok          

rm -rf 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/buildroot-config
mkdir -p 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200              
cp -dpRf package/config/buildroot-config 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/buildroot-config
rm -rf 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/usr/include 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/usr/lib/pkgconfig                                                                                                                                  

find 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/usr/lib 
-name '*.a' -delete                                                  
find /home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/lib 
-name '*.a' -delete                                                      
find 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/usr/lib 
-name '*.la' -delete                                                 
find /home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/lib 
-name '*.la' -delete                                                     
test -x 
/home/faust/AVR32/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ldconfig 
&& 
/home/faust/AVR32/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ldconfig 
-r /home/faust/AVR32/buildroot/project_build_avr32/mimc200/root 
2>/dev/null                         
# Use fakeroot to pretend all target binaries are owned by 
root                                                                                 

rm -f 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2                                             

touch 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/.fakeroot.00000                                                                   

cat /home/faust/AVR32/buildroot/project_build_avr32/mimc200/.fakeroot* > 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2                                                                                                                          

echo "chown -R 0:0 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root" >> 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2
# Use fakeroot to pretend to create all needed device nodes
echo "/home/faust/AVR32/buildroot/build_avr32/staging_dir/bin/makedevs 
-d target/device/Atmel/mimc200/device_table.txt 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root" \
                >> 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2
# Use fakeroot so mkfs.jffs2 believes the previous fakery
echo 
"/home/faust/AVR32/buildroot/toolchain_build_avr32/mtd_orig/mkfs.jffs2 
-e 0x10000 -p -b -s 0x1000 -D 
target/device/Atmel/mimc200/device_table.txt -d 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root -o 
/home/faust/AVR32/buildroot/binaries/mimc200/rootfs.avr32-20080718.jffs2" \
                >> 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2
chmod a+x 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2
/home/faust/AVR32/buildroot/build_avr32/staging_dir/usr/bin/fakeroot -- 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2
rootdir=/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root
table='target/device/Atmel/mimc200/device_table.txt'
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
mkfs.jffs2: skipping device_table entry '/sys': no parent directory!
mkfs.jffs2: skipping device_table entry '/config': no parent directory!
mkfs.jffs2: skipping device_table entry '/proc': no parent directory!
mkfs.jffs2: skipping device_table entry '/lost+found': no parent directory!
mkfs.jffs2: skipping device_table entry '/media': no parent directory!
mkfs.jffs2: skipping device_table entry '/www': no parent directory!
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/_fakeroot.rootfs.avr32-20080718.jffs2: 
line 3:  7404 Aborted                 
/home/faust/AVR32/buildroot/toolchain_build_avr32/mtd_orig/mkfs.jffs2 -e 
0x10000 -p -b -s 0x1000 -D target/device/Atmel/mimc200/device_table.txt 
-d /home/faust/AVR32/buildroot/project_build_avr32/mimc200/root -o 
/home/faust/AVR32/buildroot/binaries/mimc200/rootfs.avr32-20080718.jffs2
make: *** 
[/home/faust/AVR32/buildroot/binaries/mimc200/rootfs.avr32-20080718.jffs2] 
Error 134

Running the "aborted" line one its own gives ...

mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: 
/home/faust/AVR32/buildroot/project_build_avr32/mimc200/root/dev/null: 
file type does not match specified type!

This is on buildroot version 22782.  The config / setup works on 3 other 
machines.

Does anyone have any ideas ?  Seen this before ?

Thanks
Mark
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpfj.vcf
Type: text/x-vcard
Size: 290 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080718/122aeaa6/attachment.vcf 
