From: Kevin Wilson <wkevils@gmail.com>
Date: Thu, 21 Jun 2012 19:38:28 +0300
Subject: [Buildroot] preparing rootfs with gcc in buildroot
In-Reply-To: <20120621142848.4caafde0@skate>
References: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
 <20120621142848.4caafde0@skate>
Message-ID: <CAGXs5wXPo4wtWY9H0Ec761e0zEUCa_3u3-YH04jzZcW_m=ju+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas
Thanks for your quick answer!

I do admit that I am a bit of (heavy) hacker and
I am intending to use buildroot  a bit beyond its usual usage.

I though of things like -
  1) Adding tests programs of my own
   2) Adding some code to packages (let's say, iptables, openswan)
Partly for hacking, partly for adding code for my own development needs.

It seems to mt that though it is possible to do it in buildroot cross
compiling,  in the end , for each and every change in
iptables/openswan, I will have to
install all the rootfs.tar; I don't think there is a way to prepare something
like a package.
(unless there is a way to tell
buildroot that my target rootfs is located in , lets say, /home/....)
And for each change in iptables/openswan I will
need to repeat this.
copying manually only the binaries (libs, executable, config file) can
be quite a task, especially when you work with bigger and bigger
packages, where these files can be scattered over many places.

 (It could be that there some other way, something
which uses DEST_DIR, I don't know and I will be happy to hear).

KV







On Thu, Jun 21, 2012 at 3:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 21 Jun 2012 15:16:14 +0300,
> Kevin Wilson <wkevils@gmail.com> a ?crit :
>
>> I run:
>> make menuconfig
>> ? Package selection for target
>> ? ? ?Development tools
>> ? ? ? ? "gcc needs development files in target filesystems"
>
> Yes, you have to enable BR2_HAVE_DEVFILES (in Build options).
>
> However, beware that the usage of the native toolchain on the target is
> rarely used and tested by Buildroot developers. Buildroot is here to
> cross-compile all your applications and libraries, so it generally
> doesn't make much sense to have a native toolchain on the target, so we
> don't pay too much attention to this.
>
> What would you like to build on your target? Why don't you
> cross-compile it?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
