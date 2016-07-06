From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 20:20:05 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
Message-ID: <20160706202005.6e2ac6c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jul 2016 17:54:01 +0000, ANDY KENNEDY wrote:

> >  - When cryptodev-linux is enabled, OpenSSL will depend on it to use
> >    crypto accelerators supported in the kernel via cryptodev-linux.  
> 
> If I understand you correctly, this builds TWO things, right?
> 
> If this is the case, make it separate packages to build the
> kernel module then the userspace package.

It builds a kernel module, so it has to depend on "linux", and it
installs cryptodev.h, which OpenSSL needs. I am not sure splitting this
package into two is really a good idea, though it would indeed solve
the problem: all what OpenSSL needs at build time is the cryptodev.h
header file. The kernel module can be built separately, and is only at
runtime.

So, yes, one possibility is to break cryptodev-linux into two packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
