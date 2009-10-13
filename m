From: W.P. <laurentp@wp.pl>
Date: Tue, 13 Oct 2009 21:41:10 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <4AD4C7B6.3000202@wp.pl>
References: <4AD389B2.20400@wp.pl>	<87my3w4bw6.fsf@macbook.be.48ers.dk>	<4AD3918B.5000908@wp.pl>	<20091012203645.GX2266@mx.loc>	<4AD3B2BE.2010809@wp.pl>	<20091013111009.GB23718@mx.loc>	<4AD4C1BB.5000304@wp.pl>	<877huz2m5l.fsf@macbook.be.48ers.dk>
	<4AD4C7B6.3000202@wp.pl>
Message-ID: <4AD4D7D6.6020305@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik W.P. napisa?:
> U?ytkownik Peter Korsgaard napisa?:
>   
>>>>>>> "W" == W P <laurentp@wp.pl> writes:
>>>>>>>             
>>>>>>>               
>>  W> Heeelllp. Where may I find buildroot-0.9.28(29)? I mean later than
>>  W> 0.9.27 and earlier than 2009.09.
>>
>>   
>>     
> I take it you mean 2009.02. There is no such thing, there were no
>
> Yes, 2009-02.
>   
>> releases between 0.9.27 in 2005 and 2009.02.
>>
>>  W> Why am I asking: in buildroot 0.9.27 I have found patches for gcc 3.4.3
>>  W> and I need 3.4.4 (google at linux-2.6.12.6-venus to see why).
>>  W> And in 2009.02 earliest version of patches for gcc is 3.4.6. So there is
>>  W> a "gap" between files available on buildroot download site.
>>
>> 3.4.6 patches most likely apply to 3.4.4.
>>
>>   
>>     
> OK, i'll try to copy them for 3.4.4.
>   
>>  W> For binutils i need version 2.15.94 which i may find in 0.9.27.
>>
>>  W> The rest (if I understand well the build process) is relatively simple:
>>  W> patching config.in with versions i need?
>>
>> yes.
>>
>> Have you tried the oldest versions supported by 2009.02 before you do
>> all this work? Chances are that they'll work.
>>
>>   
>>     
> No, I didn't. But for binutils 2.15.94.0.2.2 patch directory is empty in
> 2009-02, and there are patches in 0.9.27 in 2.15.94.0.2 dir.
>
> Will try and report results.
>   
Made "patches" for Config.in for kernel headers, gcc and binutils. No
software packages/kernel selected, just toolchain.

First error (download generic 2.6.12.6 kernel OK, and then error):

[root at laurent-home buildroot]# make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /usr/src/buildroot/project_build_mipsel/uclibc/buildroot-config
mkdir -p /usr/src/buildroot/project_build_mipsel/uclibc
cp -dpRf package/config/buildroot-config
/usr/src/buildroot/project_build_mipsel/uclibc/buildroot-config
(cd /usr/src/buildroot/toolchain_build_mipsel/linux-2.6.12.6; \
         /usr/bin/make -j1 ARCH=mips \
                HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" \
                HOSTCXX="/usr/bin/g++" \
               
INSTALL_HDR_PATH=/usr/src/buildroot/toolchain_build_mipsel/linux
headers_install; \
        )
make[1]: Entering directory
`/usr/src/buildroot/toolchain_build_mipsel/linux-2.6.12.6'
Makefile:485: .config: No such file or directory
make[1]: *** No rule to make target `headers_install'.  Stop.
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_mipsel/linux-2.6.12.6'
make: *** [/usr/src/buildroot/toolchain_build_mipsel/linux/.configured]
Error 2
[root at laurent-home buildroot]#

What should I do?

W.P.
