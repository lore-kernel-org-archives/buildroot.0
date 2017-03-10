From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 10 Mar 2017 14:55:46 +0530
Subject: [Buildroot] libglu config error, while X.Org enabled
In-Reply-To: <CAOMZO5BrHBr8HkrC7hepcAMHE-sgE9MbhQmnWhybwKqqYuW9xQ@mail.gmail.com>
References: <CAD6G_RTkov1OJatw14LDVTNodndDav5JSeqgPF0FajGKg=4J7A@mail.gmail.com>
 <CAOMZO5BrHBr8HkrC7hepcAMHE-sgE9MbhQmnWhybwKqqYuW9xQ@mail.gmail.com>
Message-ID: <CAD6G_RTfj4KnFZjfOwAuh9GPKS4Q8Vs9ep0HwgvdUzGH9gxMFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Wed, Mar 8, 2017 at 11:05 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Jagan,
>
> On Wed, Mar 8, 2017 at 2:13 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>> Hi,
>>
>> Any idea about below error while configuring libglu
>>
>> Log:
>> ----
>> checking dynamic linker characteristics... (cached) GNU/Linux ld.so
>> checking how to hardcode library paths into programs... immediate
>> checking whether make supports nested variables... (cached) yes
>> checking pkg-config is at least version 0.9.0... yes
>> checking for GL... no
>> checking GL/gl.h usability... no
>> checking GL/gl.h presence... no
>> checking for GL/gl.h... no
>> configure: error: GL not found
>> make: *** [/workspace/buildroot/output/build/libglu-9.0.0/.stamp_configured]
>> Error 1
>>
>> I did see this when I enable X.org X Window System, I've mesa3d, Qt5.8 enabled.
>> and even host have required packages installed.
>
> It seems you want to use X11 with mx6. In this case you would need to
> use Russell's X11 driver:
>
> http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/tree/README?h=unstable-devel

Did you try building this before?

Actually I'm cross-compiling, externally as of now. I install all
dependences block while building

xf86-video-armada# make
make  all-recursive
make[1]: Entering directory `/workspace/armada/xf86-video-armada'
Making all in common
make[2]: Entering directory `/workspace/armada/xf86-video-armada/common'
  CC       bo-cache.lo
In file included from bo-cache.h:7:0,
                 from bo-cache.c:4:
compat-list.h:4:18: fatal error: list.h: No such file or directory
 #include <list.h>
                  ^
compilation terminated.
make[2]: *** [bo-cache.lo] Error 1
make[2]: Leaving directory `/workspace/armada/xf86-video-armada/common'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/work

  CC       bo-cache.lo
In file included from bo-cache.h:7:0,
                 from bo-cache.c:4:
compat-list.h:4:18: fatal error: list.h: No such file or directory
 #include <list.h>

Any idea about this?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
