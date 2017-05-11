From: ren_guo <ren_guo@c-sky.com>
Date: Thu, 11 May 2017 20:05:26 +0800
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <20170511134113.5d0858c0@free-electrons.com>
References: <20170507145548.336e29ad@free-electrons.com>
 <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
 <20170508142023.6b95ccf7@free-electrons.com>
 <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
 <2a49a86b-da86-6e7e-df4d-bf857d3ee66c@mind.be>
 <6ac5b223-e348-7c0d-4ca0-2f4c4c1e6a1d@c-sky.com>
 <20170511134113.5d0858c0@free-electrons.com>
Message-ID: <043a824c-5d5b-35e1-646e-cc70f8199b98@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

>>>    You can just create a gitlab account, fork the official gitlab buildroot
>>> repository, modify .gitlab-ci.yml and push it. The you use the real gitlab
>>> server for you debugging.
>>>
>>>    You can do this on a branch that you delete later to "forget" about this
>>> debugging run.
>> 1. The problem is lose "libelf1" package, csky-linux-gcc will failed like this:
>>
>> |$ echo 'void main(){}' | ./bin/csky-linux-gcc -fstack-protector -x c -
>> -o hello && echo y
>> /builds/guoren83/buildroot/bin/../libexec/gcc/csky-linux/4.5.1/cc1:
>> error while loading shared libraries: libelf.so.1: cannot open shared
>> object file: No such file or directory test failed log:
>> https://gitlab.com/guoren83/buildroot/builds/16073656 2. I add libelf1
>> in .gitlab-ci.yml, see below
>> https://gitlab.com/guoren83/buildroot/commit/8e718d6ac2d49900042861652cac585c2cb063c7
>> Test is OK :) https://gitlab.com/guoren83/buildroot/builds/16074189
> Ah, good finding. Thanks for this investigation!
>
> However, do we want to add libelf1 ? Shouldn't you tweak your toolchain
> build process to link gcc statically with libelf1 ?

We use gcc 4.5.1 currently, and in gcc's configure file it linked with libelf.

So all gcc-4.5.1 will need libelf, not we cause this.

So pls add libelf1, and very very thx.

Best Regards

-- 
Guo Ren, Software Engineer, C-SKY
3 XiDoumen Rd,BldgA,15F,Hangzhou,China
P.C: 310012
http://www.c-sky.com
