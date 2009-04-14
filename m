From: Brad Johnson <bradjohn263@comcast.net>
Date: Mon, 13 Apr 2009 21:00:14 -0500
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <87fxgcbfcp.fsf@macbook.be.48ers.dk>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
Message-ID: <49E3EE2E.7050902@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,
What I have is a buildroot-built toolchain, but I initially installed 
the toolchain outside the buildroot tree so it could be shared by other 
developers (BR2_STAGING_DIR=/opt/arm-linux). I then changed it to use 
the externally installed toolchain, so other developers could start from 
the same shared config files and build a root file system without having 
to rebuild the toolchain every time.
I do have a build_arm/staging_dir/usr/include/zlib.h, but no 
/opt/arm-linux/usr/include/zlib.h.
And as I explain this, I think I understand that my problem is that when 
I add new packages (like ssh) to the buildroot config, I probably need 
to rebuild the externally installed toolchain so the proper header files 
get installed there? At the time, it seemed to me that it would be 
capable of finding the internal 
build_arm/staging_dir/usr/include/zlib.h, but it could be that it now 
only includes the external usr/include location?
I have attached my .config file.
Thanks,
Brad

On 4/13/2009 1:03 PM, Peter Korsgaard wrote:
>>>>>> "Brad" == Brad Johnson <bradjohn263@comcast.net> writes:
>>>>>>             
>
> Hi,
>
>  Brad> I am using buildroot to cross-compile an embedded ARM
>  Brad> system. Everything else works fine, but I can not get openssl to
>  Brad> compile (I am trying to add openssh and it requires openssl and
>  Brad> zlib). It can not find zlib.h, although I have zlib1g-dev installed on
>  Brad> my build machine (a 386 Ubuntu system).
>  Brad> I have tried manually configuring openssl (./Configure
>  Brad> --with-zlib-include=/usr/include), with no success.
>  Brad> Here is the error I get:
>
> Any special reason why you cannot use dropbear?
>
> Is this with an internal or external toolchain?
>
> There's no -I$(STAGING_DIR)/usr/include in the gcc invocation, so that
> probably fails with an external toolchain.
>
>  Brad> /opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include
>  Brad> -fPIC -DOPENSS
>  Brad> L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN
>  Brad> -DHAVE_DLF
>  Brad> CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c
>  Brad> c_zlib.c:25:18: error: zlib.h: No such file or directory
>
> If not, do you have a build_arm/staging_dir/usr/include/zlib.h? Please
> post your .config
>
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.0.238 / Virus Database: 270.11.54/2056 - Release Date: 04/13/09 05:51:00
>
>   
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090413/6964a653/attachment-0001.diff>
