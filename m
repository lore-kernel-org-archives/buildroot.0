From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 May 2013 18:59:39 +0200
Subject: [Buildroot] [PATCH 3/5] am33x-cm3: add FW for suspend/resume
In-Reply-To: <CAE4k239iOG9ywuyHt+-eKzVZOnuDQ1y+E5h0PQh+YVC6jL2Rnw@mail.gmail.com>
References: <CAE4k239uzqJGVwGSsP7AtrQrbcKqNbe3f1P5ix33U8rpge96EA@mail.gmail.com>
 <518DE6DE.2070101@mind.be>
 <CAE4k239iOG9ywuyHt+-eKzVZOnuDQ1y+E5h0PQh+YVC6jL2Rnw@mail.gmail.com>
Message-ID: <518FCA7B.1000106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/13 14:25, Anders Darander wrote:
>
>
>
> On 11 May 2013 08:36, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
[snip]
>       I get a lot of
>
>     warning: switch -mcpu=cortex-m3 conflicts with -march=armv7-a switch
>     [enabled by default]
>
>     but I guess these are harmless.
>
>     (the -march=armv7-a is added by the toolchain wrapper).
>
>
> Using what toolchain?

  Sourcery external toolchain.

 > I'm not seeing these warning (and neither am I
> seeing any -march=armv7-a) in my test builds. I'm using the buildroot
> toolchain generated with this patch series applied to the 2013.05-rc1 tag.

  OK, that answers my question if you had tested it with an internal 
toolchain :-)


>
>       But I'm not 100% sure if a custom toolchain will actually build for
>     the correct architecture. Could you try if the result of something
>     built with the buildroot toolchain works correctly? If you want, I
>     can send you the .bin file so you don't have to wait an hour for the
>     whole toolchain to compile. Or, if you have actually tested it with a
>     buildroot toolchain, could you try if it also works with an external
>     Sourcery and/or Linaro toolchain?
>
>           >  init scripts are installed by a separate variable,
>           >AM33X_CM3_INSTALL_INIT_SYSV. And of course, the same remark
>         about the
>           >-D
>           >option applies.
>
>         Thanks, I'm fox that too.
>
>         Does that make it install when using busybox init also?
>
>
>       Yes it does.
>
>       Only when systemd is selected, it doesn't install anything. So
>     ideally you should also add a systemd unit file.
>
>
> As I'm not building systemd in any buildroot / beaglebone project, I
> think I'll wait with adding the systemd unit file until I can test it
> more. Or if someone beats me to it.

  Fair enough.

  Regards,
  Arnout

>
> Version 2 of the patch series on it's way...
>
> Cheers,
> Anders


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
