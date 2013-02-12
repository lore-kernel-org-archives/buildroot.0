From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 12 Feb 2013 13:55:57 +0200
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <511A19A8.4020307@relinux.de>
References: <20130209004253.207e0741@skate> <511A19A8.4020307@relinux.de>
Message-ID: <511A2DCD.4050004@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> What to do with systemd/udev/eudev: we try to use the udev from
>> systemd without systemd. Exactly how we don't know yet... There's a
>> risk that udev becomes unusable without systemd, but Leonard
>> Poettering promised this would not happen. After a quick look, it
>> turns out that you always end up building systemd, which requires
>> dbus, even if you need only udev. So it makes the systemd source
>> tarball a bit unpractical to build a system that uses udev only, and
>> doesn't need systemd. Probably an indication that we should have a
>> look at eudev? How would this interact with the systemd selection?
>> What about incompatibilities between udev and eudev? 
> What about using a different udev version with or without systemd? This
> would allow using a recent systemd version while systems without it
> could use the old udev or eudev, even as an option.

Here's what Linux from Scratch project does

http://www.linuxfromscratch.org/lfs/view/development/chapter06/udev.html

They just rip the udev off from the latest systemd tarball
(systemd-197.tar.xz) and use that.


>> Switching to ct-ng as the default toolchain backend has been in the
>> plans for several years. But since it's not the default backend it
>> isn't getting a lot of attention (example: for several months it was
>> broken, libraries were not copied to the target, and it took a lot of
>> time for somebody to notice). 
> Regarding the toolchain I want to say that I really like buildroot's
> ability to build a toolchain.

Ditto. I like it too that buildroot has all in the box and that I don't
need to have any
separate cross-compiler toolchain installed.
And also the fact that I don't have to muck with any possible config
problems
of external cross-compiler.

Regards
Stefan
