From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 17:40:43 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <20160708095910.621ad48a@gmail.com>
References: <20160708095910.621ad48a@gmail.com>
Message-ID: <20160708174043.3e1b7d11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fran?ois, could you have a look at the below question, that is Perl and
cross-compilation related?

Thanks!

Thomas

On Fri, 8 Jul 2016 09:59:10 +0200, Arne Caspari wrote:
> Hi all, 
> 
> I try to build the libxml-parser-perl package for an ARM target.
> Unfortunately the compiled perl module fails to load with the following
> error message: 
> 
> loadable library and perl binaries are mismatched
> 
> After some digging I found that the module needs to be compiled with
> the same toolchain and compiler defines as the perl binary in order to
> be ABI compatible. Forcing the defines to be exactly the same as the
> ones used for the perl binary did not fix the issue so I believe it
> must be a problem with the toolchain.
> 
> I get it right, buildroot builds the host-perl package with the GCC
> installed on the build system. In my case this is GCC Version 6.1 while
> the toolchain in buildroot uses 4.9.3. If I get the build procedure
> right, the ABI for perl is then configured for the 6.1 toolchain while
> module builds will use the toolchain provided by buildroot which is ABI
> incompatible. 
> 
> Is there a way to make buildroot build an initial toolchain to build
> the host packages with? Did anybody ever successfully build perlXS
> modules?
> 
> Thanks, 
> 
> /Arne
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
