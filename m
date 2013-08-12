From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 23:01:32 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
References: <20130731191415.545f7dff@skate>
 <CAHXCMMJ63sJ=m5V1c5+TqOn8TfdBop20gzDHjL85Ks1rYYU+-g@mail.gmail.com>
 <20130801182311.6bb6e57e@skate>
 <CAHXCMMJacpBKoSpKH8NRtDyto92ZZ6AA2bh2jFyOZx4L00cxFw@mail.gmail.com>
 <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
Message-ID: <52094D2C.7080001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/08/13 10:33, Thomas De Schampheleire wrote:
> On Thu, Aug 1, 2013 at 11:30 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Thomas, all,
>>
>> 2013/8/1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>>> Dear Samuel Martin,
>>>
>>> On Thu, 1 Aug 2013 00:13:35 +0200, Samuel Martin wrote:
>>>
>>>> 2013/7/31 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>>>>
>>>>> http://patchwork.ozlabs.org/patch/243426 Fix bug with dependencies of *-rebuild and *-reconfigure
>>>>> http://patchwork.ozlabs.org/patch/172278 pkg-infra: limit -reconfigure and -rebuild actions
>>>> Both treat the same thing!
>>>> A "political decision" has to be made on this since it slightly
>>>> changes the way some BR commands work.
>>>
>>> Can we have a decision on those ones?
>>>
>>> On my side, I kind of like the fact that 'make blabla-rebuild' both
>>> rebuilds the blabla package and regenerates the root filesystem. It
>>> avoids the need for 'make blabla-rebuild && make'. However, it's true
>>> that it's inconsistent with 'make blabla-dirclean', which just removes
>>> the build directory, and therefore requires a 'make blabla-dirclean &&
>>> make' if you want to completely rebuild a package from scratch.
>>
>> IIRC, we talked about this during some BR dev days or patchwork-day
>> session, and in the end we kept statu quo.
>>
>> I'd rather be in favor of these patches, although I barely use the
>> *-re{configure,build} targets;

  I also don't use them because they're not convenient :-) I typically use

make foo-clean-for-rebuild foo

so for me the patch would be really convenient (except that I typically 
use several buildroot versions in parallel so I'll forget if I can use 
the -rebuild target or not).


>> anyway it's just one opinion among others.
>>
>
> I am currently used to -reconfigure and -rebuild to rebuild also the
> rootfs, but I also agree it's inconsistent with the other targets. If
> we want to be strict, then foo-reconfigure can only configure, not
> build. And foo-rebuild can only build.
> Hence, to get the original behavior of:
> foo-reconfigure --> foo-reconfigure all
> foo-rebuild     --> foo-rebuild all
>
> Is that understanding correct?
> As long as we can document this properly, also in the ChangeLog, then
> I'm fine with this semantic change. Adding 'all' isn't the end of the
> world.

  BTW the report of the last developer meeting [1] says that we were 
going to accept these patches.


  Regards,
  Arnout


[1] http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013#Action_point_list

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
