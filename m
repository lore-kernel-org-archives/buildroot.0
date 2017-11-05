From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 23:09:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/freerdp: always uses pkg-config
In-Reply-To: <20171105212220.GD10472@scaer>
References: <cover.1509907598.git.yann.morin.1998@free.fr>
 <f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c.1509907598.git.yann.morin.1998@free.fr>
 <CAHXCMMJuTNZJhqOBdjAP3zfAQ2heOXoq+qscLXwKFy8GE8oYmw@mail.gmail.com>
 <20171105212220.GD10472@scaer>
Message-ID: <ad0e2a73-0cde-17be-70fd-f9a9ec600f5b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 22:22, Yann E. MORIN wrote:
> On 2017-11-05 22:17 +0100, Samuel Martin spake thusly:
>> On Sun, Nov 5, 2017 at 7:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> Currently, we only deopend on host-pkgconf for gstreamer-0.x
>>>
>>> However, we also need it at least for gstreamer-1.x and waylabnd, too.
>>>
>>> Make it a mandatory dependency, no matter what.
>>
>> Since freerdp uses the cmake infrastructure, it already has
>> host-pkgconf among its dependencies (c.f. [1])
> 
> OK, god to know, indeed...
> 
> Then, that does not explain the errors we're seeing... Damned... :-(

 I took a look at
http://autobuild.buildroot.org/results/bdf/bdfe233ade36a56d0f65ef3c3d1698fca548beed/build-end.log

 It errors on
.../output/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/wayland-scanner: No
such file or directory
i.e. it's trying to execute the staging wayland-scanner.

 Regards,
 Arnout

> 
> I'll update the patch to just drop the depenency altogether, then.
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
