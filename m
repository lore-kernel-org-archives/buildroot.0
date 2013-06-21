From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jun 2013 08:38:06 +0200
Subject: [Buildroot] Recurrent Blackfin build failure on icu
In-Reply-To: <201306201921.49209.vapier@gentoo.org>
References: <20130529213510.43fc1372@skate> <20130603113857.0c7ff74a@skate>
 <CAJxxZ0NqXVjrO9_d6mYALXP6ktvLMxXFyc--RS9y9GVm5UkE7Q@mail.gmail.com>
 <201306201921.49209.vapier@gentoo.org>
Message-ID: <20130621083806.26cf75f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Frysinger,

On Thu, 20 Jun 2013 19:21:48 -0400, Mike Frysinger wrote:

> > Maybe you can check the symbol name after compiling a C file into an
> > assembly file?
> 
> gcc provides __USER_LABEL_PREFIX__ specifically for this.  but you'd have to 
> create a .S file and run it through the preprocessor to do that ...

So you mean that __USER_LABEL_PREFIX__ is "_" on Blackfin and empty on
other architectures, so that assembly code should look like:

	__USER_LABEL_PREFIX__ ## symbol_foobar

and run through the preprocessor, to work properly across arches?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
