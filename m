From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 28 Jul 2015 12:19:49 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-27
In-Reply-To: <20150728105715.22962d48@free-electrons.com>
References: <20150728063018.ECCE8101BC0@stock.ovh.net>
 <20150728105715.22962d48@free-electrons.com>
Message-ID: <55B77365.5090505@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All

Le 28/07/2015 10:57, Thomas Petazzoni a ?crit :
> Hello,
>
> Brendan, Guillaume, J?rg, Waldemar, Samuel, Johan, Maxime, Alexey, Max,
> Gustavo, Julien, Vicente, Clayton, see below. Thanks!
>
> On Tue, 28 Jul 2015 08:30:18 +0200 (CEST), Thomas Petazzoni wrote:
>> Build statistics for 2015-07-27
>> ===============================
>>
>>          success : 124
>>         failures : 68
>
> This is getting a bit better, so let's have a look at the build
> failures. Here are some quick stats I gathered on the failure reasons:
>
> 	misc issues:			19
> 	ARC toolchain problems:		12
> 	musl:				 8
> 	too old gcc:			 8
> 	sourceforge download problem:	 6
> 	static linking issues:		 4
> 	atomic issues:			 3
> 	issues already fixed:		 3
> 	host-erlang-rebar timeout:	 2
> 	xtensa toolchain problems:	 2
> 	gcc 5.x problems:		 2
>
>

[snip]

>
>>           arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/30acea45fb497942129ca57c143bab6174e14609/
>
> painting/qbrush.cpp
> painting/qbrush.cpp:38:29: fatal error: qplatformpixmap.h: No such file or directory
> compilation terminated.
>
> Julien, do you know what's going on ? It might be fixed by one of the
> patch you submitted, can you point to it if that's the case ?

Bug as been submitted to Qt here : 
https://bugreports.qt.io/browse/QTBUG-47400
I made a patch for buildroot here : 
https://patchwork.ozlabs.org/patch/500018/ and we said we tag it as 
"Changes Requested" until Qt mainline patch will be accepted (see 
https://codereview.qt-project.org/#/c/122145/)
Since Qt Continuous integration system does not seems to fail on this 
issue, I think we can include this one to qt5base package "as is".
Should I submit the patch yet or wait for the mainline patch to be accepted?

>
>>      mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f91de4a596817997b2f35c24b07aec43916c9e1b/
>
> /home/peko/autobuild/instance-0/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/gnu/lib-names.h:34:37: fatal error: gnu/lib-names-n64_soft.h: No such file or directory
>   # include <gnu/lib-names-n64_soft.h>
>
> Vicente ?
>
>>        mipsel |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f0891474fe2cd3e47b1489f147e31f698dbd013f/
>
> painting/qbrush.cpp:38:29: fatal error: qplatformpixmap.h: No such file or directory
>   #include "qplatformpixmap.h"
>

[snip]

>
> Thomas
>

Julien
