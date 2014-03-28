From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Mar 2014 07:24:51 -0300
Subject: [Buildroot] - /bin/ld: cannot find -lcrypto Compilation
	wpa_suplicant
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F0081F801@srvexch01.SODIELEC.local>
References: <EE97821C81277E459BEA5C6384C6F241012F0081F7FF@srvexch01.SODIELEC.local>
 <20140327212758.GA12104@w1.fi>
 <EE97821C81277E459BEA5C6384C6F241012F0081F800@srvexch01.SODIELEC.local>,
 <20140328083110.GD26179@tarshish>
 <EE97821C81277E459BEA5C6384C6F241012F0081F801@srvexch01.SODIELEC.local>
Message-ID: <53354DF3.3000102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/28/2014 05:38 AM, Vu Hai NGUYEN wrote:

> Hello every one,
> I tried to compile the program wpa_suplicant, when I run make, I was able to create 2 files executable wpa_supplicant and wpa_cli but I have this error:
> 
>   CC  wpa_passphrase.c
> /home/alberix2/Cross-Compiler/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/../lib/gcc/arm-marvell-linux-gnueabi/4.6.2/../../../../arm-marvell-linux-gnueabi/bin/ld: cannot find -lcrypto
> collect2: ld returned 1 exit status
> make: *** [wpa_passphrase] Error 1
> 
> I have looked on the internet and found that the problem may concerned about missing library file "libcrypto.so" in the directory /lib/usr, I went into the directory of my cross compiler:
> /home/alberix2/../ACCESS_POINT2_prj/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib
> I saw 2 file libcrypto.so.1.0.0 and libcrypto.so (this is just a link to libcrypto.so.1.0.0). Their permission is Read only, but even if I changed their permission to Read & Write, the error is still there and I don't know how to correct it.
> So anyone can help me through this?
> Thanks in advanced for your response.
> Sincerely,

Hi.
As Baruch wrote, it would be good to see your .config to reproduce the
issue.
Also knowing which buildroot version you're using would also help.
Thanks.
Regards.
