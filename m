From: Dimitrios Siganos <dimitris@siganos.org>
Date: Sun, 17 Feb 2013 23:06:26 +0000
Subject: [Buildroot] bump libnl to 3.2.21 before release
In-Reply-To: <51214646.5080304@zacarias.com.ar>
References: <51212637.6020406@siganos.org> <512127BC.9050004@zacarias.com.ar>
 <5121441D.5040506@siganos.org> <51214646.5080304@zacarias.com.ar>
Message-ID: <51216272.6040201@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/13 21:06, Gustavo Zacarias wrote:
> On 02/17/2013 05:57 PM, Dimitrios Siganos wrote:
> 
>> There is no problem that I can't work around but it is an inconvenience
>> that can be avoided.
>>
>> How am I affected? We do binary releases of our software applications
>> and 3.2.18 doesn't work for us and we'd have to release a special
>> version for that or create a patch for buildroot.
> 
> Binary releases as in a sepparate/propietary app that's only shipped as
> a binary? (not built with buildroot and/or not able to share the source).
> I'm not asking because of any licensing crazyiness, it's perfectly
> valid, just want to understand the scenario.

Yes, we ship our app without sources and only in binary form. However,
we also sell linux hardware modules with a ready to go buildroot
environment so that customers can build their own apps too. Obviously,
we'd liek our customers to integrate our software into buildroot with as
little hassle as possible and API breakages make our more difficult.
This ABI in unnecessary, so that's why I asked you to consider bumping
the version.


>> The important thing to note here is that version 3.2.18 broke backwards
>> compatibility and version 3.2.20 restored it. For example, v3.2.16 is
>> compatible with 3.2.21 but 3.2.18 isn't compatible with either of them.
>>
>> If there is no specific reason to stay at 3.2.18 then why not go to
>> 3.2.21 and spare some buildroot users (the ones that operate in mixed
>> open/closed source) from that unnecessary libnl hassle?
> 
> Well the binary compatibility isn't an issue for typical buildroot
> scenarios, that's why i'm asking what i asked.
> The changelog entry is a typical linux distribution issue where you just
> upgrade individual components when necessary.
> That's usually not what buildroot is about, you're building a root
> filesystem (in simplified terms) so your upgrade path is usually a
> complete image upgrade, call it firmware, flash or disk image.
> Hence ABI compatibility doesn't matter.
> Understand i'm hesitant to bump libnl this close to the release unless
> there's a really pressing issue - libnl bumps usually break packages
> subtly and this requires testing.
> And it also breaks every other release with varying linux headers when
> new features are introduced (like CAN support).

OK, I just thought I'll ask. Obviously it seems to work for me but I
guess you are worried about the packages that I am not using and not
testing, which is understandable. I can work around this by applying a
patch to buildroot to avoid this ABI breakage. Thanks for listening.

Regards,
Dimitris
