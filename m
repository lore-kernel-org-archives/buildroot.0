From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 16 Jul 2014 10:29:50 +0200
Subject: [Buildroot] [PATCH] Add target-clean makefile target
In-Reply-To: <20140716100919.3f8101c3@free-electrons.com>
References: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
 <20140715225415.08f5a5a6@free-electrons.com>
 <CA+TH9Vmp+-+Dgqh-BVR6-aUB3w5w_ccy0=3Mw_KMKciyRyD1rA@mail.gmail.com>
 <20140715233320.46a95f1a@free-electrons.com>
 <CA+TH9V=f4o7--R1T+o3o7aGJiJJ=6M2tSpsk1KGC=5Y=B5AHNQ@mail.gmail.com>
 <20140716100919.3f8101c3@free-electrons.com>
Message-ID: <CA+TH9VnL390p2Pd61H087An6tSGJL_wQsZ=dsJXS5Q+vgLxKfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2014-07-16 10:09 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Wed, 16 Jul 2014 09:47:01 +0200, Angelo Compagnucci wrote:
>
>> > (7) is due to the fact that Git was not rebuilt, so it still believes
>> > that OpenSSL support is available. The scenario above is fairly simple,
>> > but there are many, many more similar but more subtle scenarios to
>> > screw things up.
>>
>> Good catch, but this could be documented somewhere.
>
> Right, but then a patch adding "make target-clean" should also be
> responsible for adding the appropriate documentation :-)

If there is hope to have target-clean accepted, then I'll be working
on the documentation as soon as possible!

>> I think that is better to explain buildroot's users that they have to
>> rebuild a package when they mess it's dependencies instead of all the
>> whole rootfs! Compilation of a rootfs can take hours ...
>> Yes, I know, probably removing Openssl screws up a hundred of packages
>> and it's not practical to rebuild one by one, but I think this is a
>> corner case more than the rule.
>
> Not that much: any optional dependency in Buildroot will exhibit
> exactly the same behavior, and there are hundreds if not thousands of
> places were we rely on optional dependencies.

Yes, I can understand the implications. Honestly, using buildroot
naively, I never encountered such behaviors, but I was not going
deeply into dependencies, only selecting and deselecting packages here
and there.
Buildroot served me well!

> By I tend to agree that we could provide the tool, provided that there
> is sufficient documentation to explain how to use it correctly.

Yes, it's exactly what I'm looking for.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
