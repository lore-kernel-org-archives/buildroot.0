From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 09:39:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-05-13
In-Reply-To: <87vc6mrpv4.fsf@dell.be.48ers.dk>
References: <20130514063004.8012052C105@lolut.humanoidz.org>
 <87vc6mrpv4.fsf@dell.be.48ers.dk>
Message-ID: <20130514093947.747a41d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 14 May 2013 09:18:39 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Build statistics for 2013-05-13
>  Thomas> ===============================
> 
>  Thomas>         success : 89 
>  Thomas>        failures : 35 
>  Thomas>        timeouts : 35 
>  Thomas>           TOTAL : 124
> 
> What are the timeouts?

On my autobuilder, I run the Buildroot build within a "timeout" command
that errors out when the build takes more than 2 hours.

Originally, I introduced this because once particular PowerPC external
toolchain had a 'ld' bug that got triggered on some packages, and was
causing 'ld' to enter an infinite loop, which was basically halting the
autobuilder. So this timeout thing was introduced, and I've kept it
until now.

I'm rather surprised by the number of timeouts for yesterday, I'll need
to investigate. They also don't seem to show up on the web interface. I
suspect something might be wrong in just the e-mail generation script,
I'll have a look into that.

>  Thomas> Classification of failures by reason
>  Thomas> ====================================
> 
>  Thomas>                   ne10-88c18f0 | 3 
>  Thomas>                  cairo-1.12.10 | 3 
>  Thomas>           host-protobuf-c-0.15 | 2 
>  Thomas>                  binutils-2.21 | 2 
>  Thomas>                  rt-tests-0.83 | 2 
>  Thomas>                  pixman-0.28.2 | 2 
>  Thomas>                czmq-cb9839cf90 | 1 
>  Thomas>                 libtirpc-0.2.2 | 1 
>  Thomas>                     systemd-44 | 1 
>  Thomas>                libglib2-2.30.3 | 1 
>  Thomas>    host-lttng-babeltrace-1.0.2 | 1 
>  Thomas>                 directfb-1.6.3 | 1 
>  Thomas>                 mongrel2-1.8.0 | 1 
>  Thomas>                aircrack-ng-1.1 | 1 
>  Thomas>                     acl-2.2.51 | 1 
>  Thomas>              util-linux-2.22.2 | 1 
>  Thomas>               matchbox-lib-1.9 | 1 
>  Thomas>                       qt-4.8.4 | 1 
>  Thomas>                 lmbench-3.0-a9 | 1 
>  Thomas>                linux-pam-1.1.4 | 1 
>  Thomas>                wvstreams-4.6.1 | 1 
>  Thomas>                madplay-0.15.2b | 1 
>  Thomas>                  libiconv-1.14 | 1 
>  Thomas>                   libv4l-0.8.9 | 1 
>  Thomas> media-ctl-ac40b79f002a2315f... | 1 
>  Thomas>          host-gutenprint-5.2.9 | 1 
>  Thomas>                 libsigsegv-2.6 | 1 
> 
> Nice overview!

Yeah, it allows to clearly see which packages are the most problematic
ones. Maybe I should also have a summary over the last week or so,
because for example, the media-ctl build failure has been here for a
very long time.

I will reply later on your analysis of the failures, I have a few
comments.

However, please beware that the Git commit id from the build results
coming from my autobuilders are wrong since about a day or so. I was
using the same Git clone for the two builds, each doing a git pull on
its own at the start of a build. And I think I finally hit the case
where the two git pull were done in parallel: the Git repository
contained some spurious merge commits over the history of the last day.
I've halted my autobuilders, and I'll be fixing the script to have one
Git clone for each instance of the build.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
