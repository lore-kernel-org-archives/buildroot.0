From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Tue, 1 Nov 2016 11:39:35 -0700
Subject: [Buildroot] auto-detecting toolchain metadata?
Message-ID: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm running into a problem where I'm distributing a Buildroot-based tree 
(config + scripts) to some users. They really only use Linux, 
bootloader, and busybox, and since they've been building those pieces 
for a while, they already have toolchains laying around.

I'd like to let them use whatever toolchain they've been using, and 
ideally that would be as simple as "change BR2_TOOLCHAIN_EXTERNAL_PATH 
in defconfig". Of course, it's not that simple; Buildroot wants more 
information: gcc version, kernel headers, target tuple, etc. I suspect 
the reason Buildroot needs that extra metadata is to build userland 
packages that are more complex than busybox.

Providing another toolchain to them, with known settings for the 
defconfig, is one option. However, it's hard to justify throwing away 
the toolchain they've been using without problem, especially since they 
don't really care about userland. (Some of them may want to get really 
fancy and add an SSH server, but I've only seen that once.)

Another option I'm considering is a script to try to detect the 
necessary metadata from a given toolchain path. As far as I can see, 
every piece of it can be detected from external observation. It could be 
invoked outside Buildroot (modifying defconfig), but of course it could 
be invoked from within Buildroot's toolchain recipes too. Is there a 
reason this is a bad idea or hasn't already been done?

Thanks!

-- 
Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division
