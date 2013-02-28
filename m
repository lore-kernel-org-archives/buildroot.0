From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 28 Feb 2013 18:04:31 +0200
Subject: [Buildroot] Help needed with cross-compiling libotr
In-Reply-To: <512F7E8D.5070200@petroprogram.com>
References: <512F71F7.20409@petroprogram.com> <20130228162157.37abbe84@skate>
 <512F7E8D.5070200@petroprogram.com>
Message-ID: <512F800F.9070704@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


28.2.2013 17:58, Stefan Fr?berg kirjoitti:
> 28.2.2013 17:21, Thomas Petazzoni kirjoitti:
>> Hello all,
>>
>> On Thu, 28 Feb 2013 17:04:23 +0200, Stefan Fr?berg wrote:
>>
>>> I have been trying to cross-compile libotr package that makes it possible,
>>> with the help of pidgin-otr plugin, to send encrypted messages with
>>> Pidgin IM software
>>> (which I already have successfully cross-compiled for buildroot and plan
>>> to submit soon).
>> I'd like to state my feeling on this: I believe that packaging
>> desktop-level software like Pidgin or the Network-Manager Applet in
>> Buildroot is useless. I don't think Buildroot is appropriate to build a
>> full-blown desktop distro, and even though Stefan is doing good work
>> with all those packages, I fear that once Stefan's work is over, those
>> packages will bit rot.
>>
>> Stefan, are you sure that Buildroot is appropriate for what you're
>> trying to achieve? Have you looked at something like Gentoo? It builds
>> from source like Buildroot, has a package management system, and
>> gazillions of desktop-level software already packaged. Since you're
>> targeting x86, you don't need cross-compilation, which would have been
>> the reason for using Buildroot in the first place.

Yes Im a gentoo guy and been that since 2005 and even now my servers are
running
hardened version of it.
Also done Linux from scratch for my own systems several years ago.

However both projects have two problems:

a ) Gentoo is great but to have ultimate flexibility I needed to go to
"bare metal" without hacking portage and ebuild files.
b ) Linux from scratch is bare to the metal but after a while it gets
tedious to *manually* grab source code, patch it, configure it
yadda-yadda....

I wanted something of the combination of the two and buildroot with it's
automatic build system filled that niche nicely for me.



>
>> And don't tell me you use Buildroot because of uClibc: when you're
>> doing a full-blown desktop environment, using glibc or uClibc doesn't
>> make *any* difference, be it from a size perspective or a performance
>> perspective.
>>
>> What do others think about this?
>>
>> Best regards,
>>
>> Thomas


Well, at least my home grown distro *feels* faster and takes less space
than anything I have tried before :-)

I have a fully working, uClibc system now that can also compile code
with native gcc, to rpm packages and use
those same rpm packages with also uClibc compiled yum and Fedora version
of rpm tool.

So buildroot is not *absolute* necessity to me anymore...

It just that so far, it has been the most time saving mechanism for me
(it's  tedious to extract RPM .spec files from Fedora src.rpm's, edit
them, compile them and
package them. or even worse, make completely new .spec file from scratch)

But if you guys don't need any of that desktop stuff (nm-applet,
gnome-keyring, pidgin etc...) then
please tell me so and I will again fully concentrate on building slowly
my own system repository
(it needs updating anyway):

http://binarytouch.com/Singularity/RPMS/i586/

Regards
Stefan



>
>
>
>
