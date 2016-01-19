From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:03:47 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <20160119182947.GB3360@free.fr>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 <87lh7l3asr.fsf@dell.be.48ers.dk>
 <CAAXf6LUqCv04ZkCH5fKwq2_0w9hBYFYXM_Bf5t1yawG1D8yeTQ@mail.gmail.com>
 <20160119182947.GB3360@free.fr>
Message-ID: <20160119210347.70ddf3b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jan 2016 19:29:47 +0100, Yann E. MORIN wrote:

> > I was not aware that glibc already depends on skeleton. Then indeed
> > ThomasP's reasoning is correct and the patch should be simplified. I
> > will investigate that further and resubmit.
> 
> Skeleton is currently not a dependency of host-gcc-initial, so you'd
> have to make it so.

Why? As explained on IRC, the only reason why Thomas DS did create the
symlinks in host-gcc-initial is to avoid duplicating this logic in all
three C library packages. But the symlinks are really only needed
before building/installing the C libraries, as far as I'm aware. So
creating them in the skeleton is OK.

Remember: in the current situation (i.e before Thomas DS patch), the
symlinks *are* created in the skeleton. And things are working fine
today, right ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
