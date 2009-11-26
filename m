From: Joachim Pihl <jpihl@nevion.com>
Date: Thu, 26 Nov 2009 15:15:11 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
Message-ID: <op.u3z7srteyqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just trying out building RC1 straight from the "box", basically all  
defaults and adding a few packages. Set to use headers matching a  
previously configured kernel. Running on Ubuntu 9.10



make[1]: Entering directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux-2.6.27.10'
   CHK     include/linux/version.h
   HOSTCC  scripts/basic/fixdep
   UPD     include/linux/version.h
   HOSTCC  scripts/basic/docproc
   HOSTCC  scripts/unifdef
scripts/unifdef.c:209: error: conflicting types for ?getline?
/usr/include/stdio.h:651: note: previous declaration of ?getline? was here
make[2]: *** [scripts/unifdef] Error 1
make[1]: *** [__headers] Error 2
make[1]: Leaving directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux-2.6.27.10'
make: ***  
[/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux/.configured]  
Error 2
jpihl at jap-lappis:~/system_controller/buildroot-2009.11_rc1$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:				Ok
CC clean:					Ok
CXX clean:					Ok
CPP clean:					Ok
CFLAGS clean:					Ok
INCLUDES clean:					Ok
CXXFLAGS clean:					Ok
which installed:				Ok
sed works:					Ok (/bin/sed)
GNU make version '3.81':			Ok
C compiler '/usr/bin/gcc'
C compiler version '4.4.1':			Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.4.1':			Ok
awk installed:					Ok
bash installed:					Ok
bison installed:				Ok
flex installed:					Ok
gettext installed:				Ok
makeinfo installed:				Ok
patch installed:				Ok
Build system dependencies:			Ok

rm -rf  
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/buildroot-config
mkdir -p /home/jpihl/system_controller/buildroot-2009.11_rc1/output/build
cp -dpRf package/config/buildroot-config  
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/buildroot-config
(cd  
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux-2.6.27.10;  
\
	 /usr/bin/make -j2 ARCH=arm \
		HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" \
		HOSTCXX="/usr/bin/g++" \
		INSTALL_HDR_PATH=/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux  
headers_install; \
	)
make[1]: Entering directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux-2.6.27.10'
   CHK     include/linux/version.h
   HOSTCC  scripts/unifdef
scripts/unifdef.c:209: error: conflicting types for ?getline?
/usr/include/stdio.h:651: note: previous declaration of ?getline? was here
make[2]: *** [scripts/unifdef] Error 1
make[1]: *** [__headers] Error 2
make[1]: Leaving directory  
`/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux-2.6.27.10'
make: ***  
[/home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux/.configured]  
Error 2



-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 20027 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091126/67ca1779/attachment-0001.obj>
