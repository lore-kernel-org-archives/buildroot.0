From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 19 May 2015 10:12:13 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150519100045.44f1b3a4@free-electrons.com>
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
 <20150519100045.44f1b3a4@free-electrons.com>
Message-ID: <555AF05D.7040905@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 19/05/2015 10:00, Thomas Petazzoni a ?crit :
> Hello all,
> 
> This is *really* looking better and better. There are still around 10
> days left before the final release, I'm sure we can reach even lower
> build failure numbers.
> 
> Let's have a look at the build issues from yesterday. Yann, Alexey,
> Bartosz, there are some questions/things for you, see below.
> 

[snip]

> 
>>      powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/90d8a0cad1ec56f251970b591e9cdf35e57b35ef/
> 
> -- checking for module 'libsigrokcxx>=0.3.0'
> --   package 'libsigrokcxx>=0.3.0' not found
> CMake Error at /ssd1/thomas/autobuild/instance-0/output/host/usr/share/cmake-3.1/Modules/FindPkgConfig.cmake:340 (message):
> 
> Bartosz, since you are the author of the pulseview package, can you
> have a look? Thanks!

libsigrokcxx needs C++11
see http://patchwork.ozlabs.org/patch/473213/

Best regards,
Romain

[snip]

> 
> So let's do the overall math, on 11 build failures, we have:
> 
>  * 2 build failures already handled by a new exception in the
>    autobuilder script.
> 
>  * 2 build failures already fixed by committed patches
> 
>  * 1 build failure fixed by a proposed patch
> 
>  * 2 build failures that look quite easy to solve (conntrack-tools,
>    sysstat)
> 
>  * 4 that look a bit more complicated (qt, sqlite, pulseview)
> 
> Best regards,
> 
> Thomas
> 
