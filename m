From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Apr 2014 07:13:35 -0300
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.1
In-Reply-To: <CAKAx1ch=rxf=EfCfntHxqfsV4jQEU1asj9JTQ4odMhrD2xZJEA@mail.gmail.com>
References: <1381509097-5424-1-git-send-email-jerzy.grzegorek@trzebnica.net>	<20140301232520.4ee4b22b@skate>	<CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>	<20140303084702.7790637d@skate>	<CAKAx1chY=kd3Y_N2-HRqmtELox8gSA9+hVUmaEAT4BNv_mXb9g@mail.gmail.com>	<20140303111124.1126480c@skate>	<CAAXf6LVOm34-2gHVMbiEp85otVQa7PVuzqsFbNCGOB0upKAAQA@mail.gmail.com>
 <CAKAx1ch=rxf=EfCfntHxqfsV4jQEU1asj9JTQ4odMhrD2xZJEA@mail.gmail.com>
Message-ID: <5343CBCF.8080103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2014 04:32 AM, Lionel Orry wrote:

> Quick news : mongrel v1.9.0 depends on polarssl now. But they decided
> to declare this dependency as a git submodule of their repo, and the
> release tarball being taken directly from github does not include the
> polarssl code. In short, they release tarball is unuseable. I'll talk
> about it upstream.
> 
> To make it clean, I'll try to get rid of the git submodule dep and
> make attempts with the polarssl buildroot package.
> 
> The bad (or not?) news is that mongrel2 depends on polarssl v1.3.0
> (v1.3.x if polarssl properly versions its library, I think it is the
> case) and we currently use polarssl v1.2.10, so a polarssl bump
> version is needed first.
> 
> Does anyone know what implications could a polarssl minor version bump
> have ? I already saw some of the polarssl patches don't apply properly
> so they need to be revisited. Gustavo, I think you were in charge of
> the last polarssl bump, do you think you could help with this one, or
> say whether it is a very bad idea to bump the package version ?
> 
> Thanks everyone,
> Lionel

Hi.
It breaks at least openvpn since the API isn't 100% compatible with the
1.2.x series and openvpn doesn't handle 1.3.x yet.
Hiawatha has a new version which bundles/works with 1.3.x.
I haven't tried with libcurl but my gut tells me it should work since
they update often.
Dunno about rtmpdump.
It may be possible to make them live side-by-side by making a polarssl13
package, though it may need to reside in a non-default prefix.
Another possible solution is to fetch openvpn patches from git to make
it compatible, but last time i checked (several months ago) there were
none - that may have changed though.
I'll take a look and get back a bit later.
Regards.
