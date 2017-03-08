From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Mar 2017 14:35:31 -0300
Subject: [Buildroot] libglu config error, while X.Org enabled
In-Reply-To: <CAD6G_RTkov1OJatw14LDVTNodndDav5JSeqgPF0FajGKg=4J7A@mail.gmail.com>
References: <CAD6G_RTkov1OJatw14LDVTNodndDav5JSeqgPF0FajGKg=4J7A@mail.gmail.com>
Message-ID: <CAOMZO5BrHBr8HkrC7hepcAMHE-sgE9MbhQmnWhybwKqqYuW9xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Wed, Mar 8, 2017 at 2:13 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Hi,
>
> Any idea about below error while configuring libglu
>
> Log:
> ----
> checking dynamic linker characteristics... (cached) GNU/Linux ld.so
> checking how to hardcode library paths into programs... immediate
> checking whether make supports nested variables... (cached) yes
> checking pkg-config is at least version 0.9.0... yes
> checking for GL... no
> checking GL/gl.h usability... no
> checking GL/gl.h presence... no
> checking for GL/gl.h... no
> configure: error: GL not found
> make: *** [/workspace/buildroot/output/build/libglu-9.0.0/.stamp_configured]
> Error 1
>
> I did see this when I enable X.org X Window System, I've mesa3d, Qt5.8 enabled.
> and even host have required packages installed.

It seems you want to use X11 with mx6. In this case you would need to
use Russell's X11 driver:

http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/tree/README?h=unstable-devel

Then you need to create support for it in Buildroot.

Regards,

Fabio Estevam
