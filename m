From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Sep 2011 12:37:06 +0200
Subject: [Buildroot] external buildroot toolchain: LD_LIBRARY_PATH needed
In-Reply-To: <20110906172425.0fc541eb@skate>
References: <CAAXf6LV8wL4wAp1eETK7mtwqCFCgoJWFBScnhGzhERZMs2R+Ww@mail.gmail.com>
 <j331vf$6s0$1@dough.gmane.org>
 <CAAXf6LUndmNrEU108f1_7h7fC3bsrAAu1Uvf5aOjH+=BJsZCZg@mail.gmail.com>
 <20110906172425.0fc541eb@skate>
Message-ID: <CAAXf6LUSOmgQfC3aRgQ17922D=mDBNRKF7t0UrnqGoCy8yThtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 6, 2011 at 5:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Thu, 25 Aug 2011 11:07:31 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> However, the missing library does not seem part of sysroot. It is
>> located at output/host/opt/ext-toolchain/lib
>> where libgmp, libmpfr, libexpat etc. reside.
>
> Those libraries are libraries for the host, and they are used by gcc
> and binutils.
>
>> Maybe this wrapper should be adapted as to include the proper
>> LD_LIBRARY_PATH?
>
> No, I don't think it's the right solution. I think there are two
> solutions:
>
> ?* Link the toolchain binaries statically against those libraries so
> ? that the toolchain binaries only rely on the C libraries but not on
> ? gmp, mpfr, etc.
>
> ?* Link the toolchain binaries with a proper rpath.

When using the rpath solution, we should of course make sure that
these paths are relative to the executable (as it may move). According
to the following link, $ORIGIN can be used for that purpose:
http://groups.google.com/group/gnu.gcc.help/browse_thread/thread/1b713af28905247b?pli=1

I couldn't say which one is better.

How will we handle this? I'm willing to test any possible solution,
but to be honest I have little experience with creating toolchains so
I doubt that I can provide patches for this.

>
>> How does crosstool-ng handle this fixed-path problem?
>
> From what I can see, using static linking against those libraries.
>

Thanks,
Thomas
