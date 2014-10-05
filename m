From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 5 Oct 2014 09:25:45 -0500
Subject: [Buildroot] How to deploy Buildroot's crosscompile toolchain???
In-Reply-To: <1412512533.81855.YahooMailNeo@web122104.mail.ne1.yahoo.com>
References: <1412490777.5471.YahooMailNeo@web122103.mail.ne1.yahoo.com>
 <trinity-d0fde3a4-5265-425d-a8e3-bc6594774602-1412502612155@3capp-gmx-bs54>
 <1412512533.81855.YahooMailNeo@web122104.mail.ne1.yahoo.com>
Message-ID: <CANQCQpZLHyfQBwK+APtShFmNU6oNrM6jvdxdWYbOZ_iaOOtdXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal,
On Oct 5, 2014 7:35 AM, "Tal Lubko" <tallubko@yahoo.com> wrote:
>
> Hi
>
> For some reason with external toolchain it's different...
> I've found out that the right way to do it is to set "Build options -->
Host dir" to the desired path (/opt/<bla_bla>)

There is an open todo to make the buildroot toolchain relocatable.  I think
this might have been discussed at a previous developers meeting (see
meeting notes from last year, i think...).

Beyond the compiler, there are also possible issues with absolute paths in
python scripts, .pc files for pkgconfig, or other scripts installed in the
host folder structure used as host tools. Personally we wrote a script to
handle installing of a sdk(host, legal info and images folders) release
which does the required fixups but still has a limitation of needing a
relocatable toolchain(so we test to make sure it is).

>
> Thanks for the help
> Tal
>
> ________________________________
> From: Peter Kuemmel <syntheticpp@gmx.net>
> To:
> Cc: "buildroot at busybox.net" <buildroot@busybox.net>
> Sent: Sunday, October 5, 2014 12:50 PM
> Subject: Re: [Buildroot] How to deploy Buildroot's crosscompile
toolchain???
>
> Hi Tal,
>
> when you change the "host dir" to a sharable path (something like
/opt/buildroot/compiler")
> then I assume you could copy this directory to another machine, at least
when the Linux is the same.
>
> I've not tested it, but the compiler in the "host dir" is usable even
when I remove the output/ dir.
> I use such a compiler as external toolchain for multiple buildroot
configuration without having to
> rebuild the compiler each time after a complete clean of the buildroot
directory.
>
> Only disadvantage is that you must make the subdirectory in /opt
user-writable.
>
> Peter
>
> Gesendet: Sonntag, 05. Oktober 2014 um 08:32 Uhr
> Von: "Tal Lubko" <tallubko@yahoo.com>
> An: "buildroot at busybox.net" <buildroot@busybox.net>
> Betreff: [Buildroot] How to deploy Buildroot's crosscompile toolchain???
>
>
> Hi
>
> I've wanted to ask what is the right way to build and deploy Buildroot's
toolchain to other machines?
> These machines don't have Buildroot to build the toolchain.
>
> Currently (being ignorant about the right way to do it), after building
the toolcahin, I'm just making a tar of output/host and copy it to
other machine. There I'm untarring it to some directory and starting to
cross compile...
>
> Things seemed to be working when I've worked with an External toolchain
(Sourcery CodeBench). However when I've switched to Buildroot's toolchain,
I got a message about missing libmpc.so.3. Then I've started to wonder what
is the right way to build and deploy the toolchain.
>
> When I run "gcc -v"
> I get a lot parameters like prefix, sysroot and more that show the
directory it was build in:
> /home/tal/buildroot/2014.08/...
>
> Which leads me again to think that I'm doing something wrong...
> Any help will be appreciated.
>
> Thanks,
> Tal
> _______________________________________________ buildroot mailing list
buildroot at busybox.net http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141005/466191ff/attachment.html>
