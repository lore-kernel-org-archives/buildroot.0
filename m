From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 23:48:58 +0200
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
	BR2_INSTALL_LIBSTDCPP
In-Reply-To: <4F991F94.50608@rfnetech.com>
References: <CAAawjsQQ0nc9HYYAegCTs6sRM+rwXhimyV83hB+jwR6bo1B=SA@mail.gmail.com>
 <4F991F94.50608@rfnetech.com>
Message-ID: <201204272348.59110.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 26 April 2012 12:12:36 oreddy wrote:
> I have enabled BR2_INSTALL_LIBSTDCPP option in .config file and tried to build the toolchain I have received the following error:
> 
>  
> cp: cannot stat `/Reddy/11n_Build/Test/dev_main/build/gcc-4.3.3/build_mips/staging_dir/usr/mips-linux-uclibc/lib*/libstdc++.so*': No such file or directory

 Did you do a clean rebuild?

 Buildroot doesn't detect when you have changed the toolchain options,
so it may "forget" to perform some build steps (e.g. compiling the C++
library).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
