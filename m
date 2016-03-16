From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 23:36:11 +0100
Subject: [Buildroot] [PATCH 4/4] lxc: remove dependency on headers >= 3.0
In-Reply-To: <87twk66onk.fsf@dell.be.48ers.dk>
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87twk66onk.fsf@dell.be.48ers.dk>
Message-ID: <20160316233611.6c664973@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 23:31:11 +0100, Peter Korsgaard wrote:

> But can missing setns() really just be ignored and still have a working
> lxc? From the code snippets failures look critical.

Yes, runtime it definitely won't work. But since the LXC code was
already planning on being able to build on systems not providing those
syscalls, I was staying in line with this decision.

> From the man page:
> 
> VERSIONS
> 
>         The setns() system call first appeared in Linux in kernel 3.0;
>         library support was added to glibc in version 2.14.
> 
> So I think it is safer to just keep the >= 3.0 headers dependency.

But I agree with you, it's probably better to keep the >= 3.0 headers
dependency. However, the comment that the dependency comes from libcap
should be changed.

Should I change a patch to fix this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
