From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 3 Nov 2015 16:20:36 -0300
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <20151103151730.1e9dcc3c@free-electrons.com>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
Message-ID: <56390904.7010101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/15 11:17, Thomas Petazzoni wrote:

> Dear Alvaro Gamez,
>
> Adding in Cc: some PowerPC folks: Gustavo Zacarias who added the 6500
> config option, and Cody who added the initial PowerPC64 support.
> Gustavo, Cody, can you look below ?
>
> Alvaro, read only below for some suggestions.
>
> Thanks!
>
> Thomas
>
> Can you rebuild with BR2_ENABLE_DEBUG=y, then run "ulimit -c unlimited"
> on your target, run the crashing Python stuff, grab back the "core"
> file on your host machine, and 1 /look at the backtrace and 2/ at the
> specific instruction that caused the crash ?
>
> This would probably help quite a bit I believe.
>
> Thanks a lot!
>
> Thomas

Hi All.
I've added e5500/e6500 support with basic testing from Dwayne Fontenot, 
i never had any e5500/6500 hardware in my hands to test though, so it's 
kind of YMMV/best spare effort.
Testing with qemu_ppc64_pseries_defconfig which is the closest i can get 
seems to have no issues importing xmlrpclib, so a wild guess is that the 
toolchain has some bug with e6500 code generation, likely gcc.
Having a backtrace might help pinpoint a bit better, trying varying 
toolchain component versions would be a random test if not.
Regards.
