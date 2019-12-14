From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 15:14:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/polkit: needs C++11
In-Reply-To: <20191214103535.602066-1-fontaine.fabrice@gmail.com>
References: <20191214103535.602066-1-fontaine.fabrice@gmail.com>
Message-ID: <20191214151437.7f86ea57@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 11:35:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> polkit depends on spidermonkey since bump to version 0.116 in commit
> ce2a5eff7890815afeb26105c7760b6f8d2986e0 however build fails with gcc 5:
> 
> /home/naourr/work/instance-0/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
>  #error This file requires compiler and library support for the \
>   ^
> polkitbackendjsauthority.cpp:223:13: warning: G_ADD_PRIVATE
>                                                   PolkitBackendJsAuthorityPrivate);
>              ^
> In file included from /home/naourr/work/instance-0/output-1/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include/mozjs-60/js/RequiredDefines.h:32:0,
>                  from <command-line>:0:
> /home/naourr/work/instance-0/output-1/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include/mozjs-60/mozilla/Char16.h:136:15: error: 'char16_t' does not name a type
>  typedef const char16_t* char16ptr_t;
>                ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a7ea21a8e10f32239ee28f58331899912f232ca2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It is a bit annoying that users of spidermonkey have to manually pass
this compiler flag. But well, since polkit is the only user of
spidermonkey, there's not much point in doing something more advanced
at least for now. So I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
