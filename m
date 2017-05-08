From: ren_guo <ren_guo@c-sky.com>
Date: Mon, 8 May 2017 10:33:02 +0800
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <20170507145548.336e29ad@free-electrons.com>
References: <20170507145548.336e29ad@free-electrons.com>
Message-ID: <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>   - The CSKY defconfig does not build, with "SSP support not available
>     in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP".
>     However, I can't reproduce locally. So I'm not sure what happening.

Our toolchain support SSP. And I've tried the cmd from toolchain/helper.mk:419

"echo 'void main(){}' | csky-linux-gcc -fstack-protector -x c - -o hello  && echo y"

It's OK on my ubuntu 16.04.

>     There is no hash on the toolchain tarball, but the one I downloaded
>     locally has the exact same size as the one that was downloaded by
>     Gitlab CI. While not an 100% guaranteed proof that it's the same
>     toolchain, it would be unlikely to have the toolchain tarball
>     changed in the mean time.

Ok, I will add hash right now, thx.

>     So the only explanation would be that the SSP check for some reason
>     fails in the Gitlab CI infrastructure.
>
>     Arnout, what do you think ?
>
>     Ren, do you have an idea ?
>
>     See https://gitlab.com/buildroot.org/buildroot/builds/15762185

I think the problem is exec toolchain/helper.mk:419 failed on Gitlab CI.

-- 
Guo Ren, Software Engineer, C-SKY
3 XiDoumen Rd,BldgA,15F,Hangzhou,China
P.C: 310012
http://www.c-sky.com
