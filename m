From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 20:55:53 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain-external: remove older
 Microblaze toolchain
In-Reply-To: <20130407204958.54b890fa@jvarch>
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365357662-25960-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130407204958.54b890fa@jvarch>
Message-ID: <20130407205553.65f5e32c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

I'm really happy to see that there are some Microblaze developers using
Buildroot! Besides this toolchain problem, we would be really happy to
get your reports and feedback about how Buildroot performs for
Microblaze platforms.

On Sun, 7 Apr 2013 20:49:58 +0200, Jan Viktorin wrote:

> there is an issue with the newer toolchain I'm not able to solve. I
> tried to google for a solution but I failed.
> 
> hidden symbol `__udivsi3' in
> buildroot/output/host/opt/ext-toolchain/bin/../lib/
> gcc/microblazeel-unknown-linux-gnu/4.6.2/libgcc.a(udivsi3.o) is
> referenced by DSO

Argh. Do you have a way of reproducing this issue?


> Would it be possible to not delete the older toolchain? I think it is
> possible to do `git clone` and then just copy the archive to its
> place like this:
> 
> $ git clone https://github.com/Xilinx/microblaze_v2.0_le.git
> Initialized empty Git repository
> in /home/user/microblaze_v2.0_le/.git/ remote: Counting objects: 4,
> done. remote: Compressing objects: 100% (4/4), done.
> remote: Total 4 (delta 0), reused 4 (delta 0)
> Unpacking objects: 100% (4/4), done.
> $ cp microblaze_v2.0_le/microblazeel-unknown-linux-gnu.tgz SOMEWHERE
> $ rm -Rf microblaze_v2.0_le/

The problem is that the external toolchain logic is not able to
download a Git repo and then take a single file from it... It could be
extended to do that, but I'm not really a fan of doing that just for
the beauty of Microblaze toolchains.

Even the new Microblaze toolchain is problematic: it is available as a
directory inside a Git repo with lots of other stuff. I've contacted
Xilinx, but they don't seem to understand what the problem is. So the
only solution we have found so far for the new Microblaze toolchain is
to make ourselves a tarball of it, which we've stored in
sources.buildroot.net.

I can do the same for the older toolchain if you're interested.

That said, the older toolchain uses a *very* old glibc, and was causing
lots of problems in our autobuilders. I think it would be a lot better
to see how to fix the build problem with the newer toolchain. Have you
tried reporting it to the Xilinx people?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
