From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 21 Nov 2013 11:31:53 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-20
In-Reply-To: <CAFbHwiTA228YrD+zfo8omQbn_74+kFg+8oS2PO-syx8N7dXFrw@mail.gmail.com>
References: <20131121073002.85918101270@stock.ovh.net>
 <CAFbHwiTA228YrD+zfo8omQbn_74+kFg+8oS2PO-syx8N7dXFrw@mail.gmail.com>
Message-ID: <CAAXf6LVPxHc1yzbe_sUUzkqVqrCYriRtEFiq8Ba6-p4s17w_Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Nov 21, 2013 at 10:00 AM, Will Newton <will.newton@gmail.com> wrote:
[..]

>>        arm |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/7c6cc07e360aa998957a48e834b8cc086282d716/
>
> Missing thread support?
>
> checking for pthread_kill in -lthr... no
> checking for pthread_kill in -lpthread... no
> checking for pthread_kill in -lpthreads... no
> checking for pthread_kill in -lc... no
> checking for pthread_kill in -lc_r... no
> checking for pthread_kill in -lroot... no
> configure: WARNING: "Don't know how to find pthread library on your
> system -- thread support disabled"
> checking for sched_yield... yes
> checking for pthread_attr_setinheritsched... no
> checking for pthread_getattr_np... no
> checking for pthread_attr_get_np... no
> checking for pthread_attr_getstack... no
> checking for pthread_get_stackaddr_np... no
> checking for pthread_get_stacksize_np... no
> checking for thr_stksegment... no
> checking for pthread_stackseg_np... no
> checking for pthread_getthrds_np... no
> checking for pthread_condattr_setclock... no
> checking for pthread_sigmask... no
> checking for backtrace... no
> checking valgrind/memcheck.h usability... no
> checking valgrind/memcheck.h presence... no
> checking for valgrind/memcheck.h... no
> checking whether ELF binaries are produced... yes
> checking whether OS depend dynamic link works... yes
> checking for arm-buildroot-linux-uclibcgnueabi-strip...
> /home/test/test/2/output/host/usr/bin/arm-linux-strip
> checking for prefix of external symbols... NONE
> configure: error: thread model is missing

A patch for ruby has been accepted yesterday, I think this problem
will be fixed now.

[..]
>>        arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/
>
> Missing include?
>
> Kid.cc: In member function 'void Kid::start(pid_t)':
> Kid.cc:43:20: error: 'time' was not declared in this scope
> Kid.cc: In member function 'void Kid::stop(Kid::status_type)':
> Kid.cc:55:20: error: 'time' was not declared in this scope
> make[4]: *** [Kid.lo] Error 1

Seems like it, I'm taking this one...

Thanks for the analysis...

Best regards,
Thomas
