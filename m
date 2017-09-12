From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 12 Sep 2017 08:14:40 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-09-11
In-Reply-To: <20170912063044.68261208F0@mail.free-electrons.com>
References: <20170912063044.68261208F0@mail.free-electrons.com>
Message-ID: <CANQCQpZ0hVdb2SQzJ3K36A67J+S+5q7ZQKmxhpdj4HH5V9V6rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autobuilders,

On Tue, Sep 12, 2017 at 1:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> Build statistics for 2017-09-11
> ================================
>

<snip>

>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/063e878e66a348efd81806a591971ece2981d8a0 |
>        sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/3b90bd8cbeaef86dc08e4d86eadd231eb7c119a2 |
>

I'm got an autobuilder which will only produce a unknown when it
fails.  It is a Ubuntu 16.04.2 LTS machine (make 4.1 and dash
0.5.8-2.1ubuntu2 ) .  I forget how long it's been since I last
discussed package name detection logic(adjusting the regex and number
of lines looked at in the end log) with Thomas for a similar situation
with a Ubuntu ~16.x machine.  I ended up decommissioning that machine
and never resolved the issue.

To help debunk this, I have manually started the builder today from a
user's shell on that same server and want to verify if there is a
difference between running via cron w/dash and manual w/bash.

One question I do have for everyone is, what version of OS/make/shell
combinations are we already running on other builders?  Anything >=
the versions I mention above?


+++++++++++ Failing and reporting correctly +++++++++++

make[4]: *** [src/lib/openjp2/CMakeFiles/openjp2_static.dir/thread.c.o] Error 1
make[3]: *** [src/lib/openjp2/CMakeFiles/openjp2_static.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....
[  7%] Building C object src/lib/openjp2/CMakeFiles/openjp2.dir/dwt.c.o
make[4]: *** [src/lib/openjp2/CMakeFiles/openjp2.dir/thread.c.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [src/lib/openjp2/CMakeFiles/openjp2.dir/all] Error 2
make[2]: *** [all] Error 2
make[1]: *** [/home/buildroot/autobuild/run/instance-1/output/build/openjpeg-2.2.0/.stamp_built]
Error 2
make: *** [_all] Error 2
make: Leaving directory `/home/buildroot/autobuild/run/instance-1/buildroot'


+++++++++++ Failing and reporting unknown +++++++++++

make[4]: *** [src/lib/openjp2/CMakeFiles/openjp2.dir/thread.c.o] Error 1
make[4]: *** Waiting for unfinished jobs....
[ 13%] Building C object src/lib/openjp2/CMakeFiles/openjp2_static.dir/bio.c.o
[ 14%] Building C object src/lib/openjp2/CMakeFiles/openjp2_static.dir/cio.c.o
src/lib/openjp2/CMakeFiles/openjp2_static.dir/build.make:62: recipe
for target 'src/lib/openjp2/CMakeFiles/openjp2_static.dir/thread.c.o'
failed
make[4]: *** [src/lib/openjp2/CMakeFiles/openjp2_static.dir/thread.c.o] Error 1
make[4]: *** Waiting for unfinished jobs....
CMakeFiles/Makefile2:142: recipe for target
'src/lib/openjp2/CMakeFiles/openjp2_static.dir/all' failed
make[3]: *** [src/lib/openjp2/CMakeFiles/openjp2_static.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....
CMakeFiles/Makefile2:105: recipe for target
'src/lib/openjp2/CMakeFiles/openjp2.dir/all' failed
make[3]: *** [src/lib/openjp2/CMakeFiles/openjp2.dir/all] Error 2
Makefile:151: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:234: recipe for target
'/home/gitlab-runner/brauto/instance-0/output/build/openjpeg-2.2.0/.stamp_built'
failed
make[1]: *** [/home/gitlab-runner/brauto/instance-0/output/build/openjpeg-2.2.0/.stamp_built]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
make: Leaving directory '/home/gitlab-runner/brauto/instance-0/buildroot'

 --Matt
