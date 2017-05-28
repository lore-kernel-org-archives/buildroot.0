From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 22:17:05 +0200
Subject: [Buildroot] [PATCH for-next 2/3] package/google-breakpad:
 switch to	the new git repository
In-Reply-To: <clgrvdxfme.ln2@ID-313208.user.individual.net>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
 <1480263400-29605-2-git-send-email-romain.naour@gmail.com>
 <clgrvdxfme.ln2@ID-313208.user.individual.net>
Message-ID: <20170528221705.6e946c2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 20:14:36 +0200, Bernd Kuhls wrote:

> I do not know whether I found a bug or not while currently testing an 
> allyesconfig with "make legal-info" only.
> 
> In this case the package linux-syscall-support was not installed to 
> staging, therefore linux_syscall_support.h cannot be installed by 
> _POST_EXTRACT_HOOKS breaking the google-breakpad-legal-info target:
> 
> /usr/bin/install: cannot stat '/home/bernd/buildroot/buildroot/output/
> host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/
> linux_syscall_support.h': No such file or directory
> 
> Is the legal-info target meant to be used that way, this means without 
> building the package first, or do the packages have to be built before?
> In this case the problem would not exist.

I confirm that we should be able to run "make legal-info" without doing
a build first. So, something like:

 $ make foo_defconfig
 $ make legal-info

is supposed to work.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
