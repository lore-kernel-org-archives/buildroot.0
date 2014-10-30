From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Oct 2014 09:09:35 +0100
Subject: [Buildroot] [PATCH v2 1/2] libffi: make thread support optional
In-Reply-To: <20141029222418.17f91967@free-electrons.com>
References: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
 <20141029222418.17f91967@free-electrons.com>
Message-ID: <5451F23F.3060703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/10/14 22:24, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Mon, 15 Sep 2014 14:26:41 +0200, J?r?me Pouiller wrote:
>> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> 
> To be honest, I am wondering if we really should bother merging a patch
> to make libffi usable on configurations that have thread support
> disabled. Nowadays, not having thread support is also impossible due to
> the large number of libraries/applications that rely on threads. libffi
> is generally used in "big" things like Python or glib, so not having
> thread support in systems using such big things is a bit unlikely.
> 
> In addition, I'm not sure the patch could be upstreamed as is, which
> means we would have to carry it in Buildroot forever.
> 
> Peter, Arnout, Gustavo, what is your point of view on this?

 I agree. Removing toolchain requirements from a package is really a feature
patch, so we shouldn't do it unless it's upstreamable or when it's more of a
build issue than a code issue. There may be an exception when a package that has
a lot of dependants suddenly grows a toolchain dependency, but that's not the
case here.

 On the other hand, why shouldn't this patch be upstreamable?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
