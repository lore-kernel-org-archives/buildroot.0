From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:38:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/nginx: fix build failure
In-Reply-To: <1416763150-28951-2-git-send-email-s.martin49@gmail.com>
References: <1416763150-28951-1-git-send-email-s.martin49@gmail.com>
 <1416763150-28951-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20141123183808.5306c947@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 23 Nov 2014 18:19:10 +0100, Samuel Martin wrote:
> sysctl syscall may not be enabled in the kernel config, so do a build-test
> to enable/disable sysctl function call.

It's not a kernel configuration problem. sysctl() is a deprecated
system call, so all new architectures (such as ARC) don't implement it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
