From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2016 09:19:21 +0100
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <1456471224.28645.10.camel@synopsys.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
 <20160225135436.18a8385c@free-electrons.com>
 <1456405085.2312.2.camel@synopsys.com>
 <20160225142622.47b2841a@free-electrons.com>
 <1456414403.4586.63.camel@synopsys.com> <56CF7CA0.7080801@mind.be>
 <1456471224.28645.10.camel@synopsys.com>
Message-ID: <20160226091921.6e367255@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Feb 2016 07:20:24 +0000, Alexey Brodkin wrote:

> > ?I think you can basically say your host toolchain is broken: it fails to
> > compile valid programs, because glibc doesn't satisfy the -std=gnu99 option.
> 
> That's very true. But it looks like on RedHat/CentOS 5.x (which are still
> in use here and there) discussed problem exists.
> 
> Given default gcc in RHEL 5 is 4.1 (though 3.4 and 4.4 are available via
> compat-gcc-34 and gcc44 correspondingly) ad it fails to compile host tar and m4
> in current Buildroot I would still look for a permanent solution in vanilla
> Buildroot instead of work-around on per machine basis.

With the default gcc 4.1 used in RHEL5, I would assume that glibc 2.5
works fine and that you can use Buildroot with no problem. Have you
tried building Buildroot with the default gcc 4.1 ?

What Arnout calls a broken toolchain is your combination of gcc 4.9 and
glibc 2.5.

If you want Buildroot to work on platform where there is no working
native toolchain, the only solution is to bundle Buildroot with a
chroot environment, and ask users to build inside the chroot. Probably
not something we want to do.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
