From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 14:20:23 +0200
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
References: <20170507145548.336e29ad@free-electrons.com>
 <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
Message-ID: <20170508142023.6b95ccf7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 May 2017 10:33:02 +0800, ren_guo wrote:

> >   - The CSKY defconfig does not build, with "SSP support not available
> >     in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP".
> >     However, I can't reproduce locally. So I'm not sure what happening.  
> 
> Our toolchain support SSP. And I've tried the cmd from toolchain/helper.mk:419
> 
> "echo 'void main(){}' | csky-linux-gcc -fstack-protector -x c - -o hello  && echo y"
> 
> It's OK on my ubuntu 16.04.

Yes, it's OK here as well. And it seems to work fine on Gitlab CI for
many other toolchains as well. So we have something weird here.

> >     There is no hash on the toolchain tarball, but the one I downloaded
> >     locally has the exact same size as the one that was downloaded by
> >     Gitlab CI. While not an 100% guaranteed proof that it's the same
> >     toolchain, it would be unlikely to have the toolchain tarball
> >     changed in the mean time.  
> 
> Ok, I will add hash right now, thx.

Where will you add the hash? You can't add the hash in Buildroot for
custom external toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
