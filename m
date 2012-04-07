From: Shawn Ferris <shawn.ferris@gmail.com>
Date: Sat, 7 Apr 2012 10:38:37 -0600
Subject: [Buildroot] Problems when compiling gnutls and gst-plugins-base on
	arm (panda)
Message-ID: <CAC2kKA9r0gZuP56HwuF_U0ZGyJP9hBBytcY8v5ruhp1jQsqL+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Guys

I've checked out '2012.02-268-g5ee4614' of buildroot and I'm having
two issues. I've included NetworkManager which requires gnutls. gnutls
fails to find libgcrypt, but I see that it's built when looking in
output/build. I suspect that it's not finding the pkg-config stuff,
which I can probably hack around, but I excluded it for now to move
on. (just thought I'd mention it.. I'll do more investigation and
report back unless someone already knows the answer)

My bigger issue is that I can't get gst-plugins-base to compile. I get
the errors:


  CC     libgstpbutils_0.10_la-pbutils-enumtypes.lo
{standard input}: Assembler messages:
{standard input}:1386: Error: immediate value out of range -- `movt ip,-32640'
{standard input}:1513: Error: immediate value out of range -- `movt ip,-32640'
make[6]: *** [libgstvideo_0.10_la-tmp-orc.lo] Error 1


I've tried different toolchains and the linaro-2012.03 works fine, but
I have other issues when using that one to. (libgcc_s.so doesn't seem
to be copied to the build and systemd fails on boot) I've also tried
compiling with big endian and that works, but wont boot. (fails to
find init, even though it exists)

Any help?

Appreciate it as always!
Shawn

Headers: 3.2
uClibc: 9.33
Bin Utils: 2.21.1
Gcc: 4.5
