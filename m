From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 4 Feb 2016 15:32:21 +0100
Subject: [Buildroot] [Bug 8651] libMonoPosixHelper.so wrong link
 reference in buildroot image
In-Reply-To: <bug-8651-163-GcQ1HgjCTH@https.bugs.busybox.net/>
References: <bug-8651-163@https.bugs.busybox.net/>
 <bug-8651-163-GcQ1HgjCTH@https.bugs.busybox.net/>
Message-ID: <CA+TH9VmoyAYz+GG+6e+cMj3CzOgJQU9V0aYrUxKrRFz=kkPhNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markus Egle,

Could you try to have a look at file /etc/mono/config in your generated image?

2016-02-04 15:24 GMT+01:00  <bugzilla@busybox.net>:
> https://bugs.busybox.net/show_bug.cgi?id=8651
>
> --- Comment #2 from Markus Egle <Markus.Egle@Qiagen.com> ---
> Till now I'm not really familiar with the config/make procedure.
> So I don't know if I have to change the Makefile.in or the config.in or both.
>
> Found four possible locations to make the testing changes.
>
>
> ...> find /home/eglem/buildroot -name "*.in"|grep mono|awk '{print "grep -Hn
> libMonoPosixHelper " $1}'|sh|grep target
>
> /home/eglem/buildroot/output/build/host-mono-4.0.2.5/runtime/Makefile.in:629:
> sed
> 's,target="$(prefix)/$(reloc_libdir)/libMonoPosixHelper$(libsuffix)",target="'$$d'/libMonoPosixHelper.la",'
> ../data/config > $@t
> /home/eglem/buildroot/output/build/host-mono-4.0.2.5/data/config.in:13: <dllmap
> dll="MonoPosixHelper"
> target="@prefix@/@reloc_libdir@/libMonoPosixHelper at libsuffix@" os="!windows" />
> /home/eglem/buildroot/output/build/mono-4.0.2.5/runtime/Makefile.in:629:
> sed
> 's,target="$(prefix)/$(reloc_libdir)/libMonoPosixHelper$(libsuffix)",target="'$$d'/libMonoPosixHelper.la",'
> ../data/config > $@t
> /home/eglem/buildroot/output/build/mono-4.0.2.5/data/config.in:13:      <dllmap
> dll="MonoPosixHelper"
> target="@prefix@/@reloc_libdir@/libMonoPosixHelper at libsuffix@" os="!windows" />
>
>
>
> Then I just remove the prefix?
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
