From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Mar 2013 09:41:02 +0100
Subject: [Buildroot] [PATCH v3 2/2] buildroot: target: Add Blackfin
 architecture support.
In-Reply-To: <CAJxxZ0OOj=vi5xuCp79vU0_kX_KNx+UX+CSRkLkr4_xsfNtS2Q@mail.gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
 <20130322155400.410ec78e@skate>
 <CAJxxZ0NLV==GLHFP627kk_BiaDst+a8qp71k_gnv0y=Sqj5=qA@mail.gmail.com>
 <CAAXf6LUBQhxB60Tt9OsA0kW9JZs3vmZMc7_Qyr7SY1yQodzgzw@mail.gmail.com>
 <CAJxxZ0OOj=vi5xuCp79vU0_kX_KNx+UX+CSRkLkr4_xsfNtS2Q@mail.gmail.com>
Message-ID: <20130326094102.094def3d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Tue, 26 Mar 2013 16:16:07 +0800, Sonic Zhang wrote:

> > If you need to have different prefixes, isn't it possible to hook into one
> > of these variables, instead of creating a new variable
> > CROSS_COMPILE_SHARED_ELF/FLAT ?
> > Depending on the elf/flat choice, you would then for example set
> > BR2_TOOLCHAIN_EXTERNAL_PREFIX (possible from kconfig directly) (but this
> > would work only for external toolchains), or override TARGET_CROSS.
> > With such a change, you can reuse TARGET_CC and TARGET_READELF.
> 
> I do set BR2_TOOLCHAIN_EXTERNAL_PREFIX to bfin-uclinux via kconfig to
> build the complete packages in buildroot. Meanwhile, I would like to
> install FDPIC libraries as well from the bfin-linux-uclibc toolchain
> folder, which is different from the bfin-uclinux I set to
> BR2_TOOLCHAIN_EXTERNAL_PREFIX.
> 
> Blackfin toolchain bfin-linux-uclibc and bfin-uclinux are located in
> different path.

But the current external toolchain logic in
toolchain/toolchain-external/ext-tool.mk only extracts either the
bfin-uclinux sysroot *or* the bfin-linux-uclibc sysroot, so you in
practice don't have both at the same time, at least with the current
Buildroot. So presumably this would also need to be changed, right?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
