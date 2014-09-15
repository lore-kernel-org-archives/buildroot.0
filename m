From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 20:06:19 +0200
Subject: [Buildroot] [PATCH 1/1] omniorb: limit to glibc toolchains
In-Reply-To: <1410790650-61308-1-git-send-email-Matthew.Weber@rockwellcollins.com>
References: <1410790650-61308-1-git-send-email-Matthew.Weber@rockwellcollins.com>
Message-ID: <20140915200619.198ff41f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 15 Sep 2014 09:17:30 -0500, Matt Weber wrote:
> Resolves autobuilder failure where the omniorb package doesn't
> correctly detect the OS because the configure script doesn't have
> an option for uclinux support.  This results in a pthread create
> assertion when it attempts to figure-out the correct C library
> posix calls.
> 
> http://autobuild.buildroot.net/results/fbe6c722b92fe4ddf7ac36a8fe1be3a3891c11fd/
> 
> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>

Wait, wait, wait, no.

uclinux != uclibc.

uclinux is the part of the host tuple used only on noMMU platforms that
don't support shared libraries.

If you use uClibc on ARM, it's not a uClinux system.

So, clearly, disabling entirely the package for uClibc doesn't make
sense here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
