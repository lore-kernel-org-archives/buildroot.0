From: Brad Johnson <bradjohn263@comcast.net>
Date: Mon, 13 Apr 2009 22:10:39 -0500
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <20090413220823.210225fe@surf>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf>
Message-ID: <49E3FEAF.7040705@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
I tried to build the latest (4/13/09) svn version of buildroot with my 
external buildroot toolchain (cross-compiler for arm). I assume the fix 
described in r25879 is in this version?
I still get an error compiling openssl:

/opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include -fPIC 
-DOPENSS
L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
-DHAVE_DLF
CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c
c_zlib.c:25:18: error: zlib.h: No such file or directory

I do not see a --sysroot gcc argument. There is a 
build_arm/staging_dir/usr/include/zlib.h.
Please advise me as to how I can build openssl within buildroot using an 
external toolchain.

Thanks,
Brad

On 4/13/2009 3:08 PM, Thomas Petazzoni wrote:
> Le Mon, 13 Apr 2009 20:03:50 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
>   
>> There's no -I$(STAGING_DIR)/usr/include in the gcc invocation, so that
>> probably fails with an external toolchain.
>>     
>
> There's no need for -I$(STAGING_DIR)/usr/include with an external
> toolchain if --sysroot $(STAGING_DIR) is passed (at least my
> experiments confirm this). See r25879.
>
> Thomas
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.0.238 / Virus Database: 270.11.54/2056 - Release Date: 04/13/09 05:51:00
>
>   
