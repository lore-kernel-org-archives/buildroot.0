From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 16:34:21 +0200
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <043a824c-5d5b-35e1-646e-cc70f8199b98@c-sky.com>
References: <20170507145548.336e29ad@free-electrons.com>
 <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
 <20170508142023.6b95ccf7@free-electrons.com>
 <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
 <2a49a86b-da86-6e7e-df4d-bf857d3ee66c@mind.be>
 <6ac5b223-e348-7c0d-4ca0-2f4c4c1e6a1d@c-sky.com>
 <20170511134113.5d0858c0@free-electrons.com>
 <043a824c-5d5b-35e1-646e-cc70f8199b98@c-sky.com>
Message-ID: <20170511163421.4115398e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 20:05:26 +0800, ren_guo wrote:

> >> |$ echo 'void main(){}' | ./bin/csky-linux-gcc -fstack-protector -x c -
> >> -o hello && echo y
> >> /builds/guoren83/buildroot/bin/../libexec/gcc/csky-linux/4.5.1/cc1:
> >> error while loading shared libraries: libelf.so.1: cannot open shared
> >> object file: No such file or directory test failed log:
> >> https://gitlab.com/guoren83/buildroot/builds/16073656 2. I add libelf1
> >> in .gitlab-ci.yml, see below
> >> https://gitlab.com/guoren83/buildroot/commit/8e718d6ac2d49900042861652cac585c2cb063c7
> >> Test is OK :) https://gitlab.com/guoren83/buildroot/builds/16074189  
> > Ah, good finding. Thanks for this investigation!
> >
> > However, do we want to add libelf1 ? Shouldn't you tweak your toolchain
> > build process to link gcc statically with libelf1 ?  
> 
> We use gcc 4.5.1 currently, and in gcc's configure file it linked with libelf.
> 
> So all gcc-4.5.1 will need libelf, not we cause this.

Yes, all gcc 4.5 will need libelf, but you could link your gcc
statically against libelf so that you don't need to use the
system-provided libelf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
