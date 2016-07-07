From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jul 2016 19:00:24 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160706202005.6e2ac6c3@free-electrons.com>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
 <20160706202005.6e2ac6c3@free-electrons.com>
Message-ID: <20160707170024.GB3827@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Andy, All,

On 2016-07-06 20:20 +0200, Thomas Petazzoni spake thusly:
> On Wed, 6 Jul 2016 17:54:01 +0000, ANDY KENNEDY wrote:
> > >  - When cryptodev-linux is enabled, OpenSSL will depend on it to use
> > >    crypto accelerators supported in the kernel via cryptodev-linux.  
> > 
> > If I understand you correctly, this builds TWO things, right?
> > 
> > If this is the case, make it separate packages to build the
> > kernel module then the userspace package.
> 
> It builds a kernel module, so it has to depend on "linux", and it
> installs cryptodev.h, which OpenSSL needs. I am not sure splitting this
> package into two is really a good idea, though it would indeed solve
> the problem: all what OpenSSL needs at build time is the cryptodev.h
> header file. The kernel module can be built separately, and is only at
> runtime.
> 
> So, yes, one possibility is to break cryptodev-linux into two packages.

But then we would probably have to do it for other packages that build
both a kernel module and userland stuff, no?

I'm not sure I like that... :-/

I think the best option would be to break at the linux-tools.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
