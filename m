From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Aug 2016 14:25:01 -0700
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <20160805231747.768e6c08@free-electrons.com>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160805185348.4c0ff1fd@free-electrons.com>
 <2039F480-7B29-4B59-8F02-62125387E3F6@gmail.com>
 <20160805231747.768e6c08@free-electrons.com>
Message-ID: <20160805212501.GB3009@haswell>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-08-05 23:17:47, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 5 Aug 2016 13:58:12 -0700, Khem Raj wrote:
> 
> > > Regardless of this detail, this means we will have to encode this
> > > dependency somehow. Indeed, we still have people using kernels older
> > > than 3.2 I believe on various platforms.  
> > 
> > thats right. perhaps --enable-kernel=3.2.0 conditional on version being
> > 2.24 in glibc mk file would put in a runtime check where apps would fail
> > to run on older kernels. If you want to detect it at build time then you
> > need to insert a mechanism to parse the kernel version of the build and
> > then compare that against kernel version used with --enable-kernel,
> 
> I'm not really talking of build time detection, but rather referring to
> the fact that we have Config.in options in Buildroot that tell us the
> version of the kernel headers. So maybe glibc 2.24 should depend on
> kernel headers >= 3.2.0. For now, we'll keep glibc 2.23, but then some
> time later in the future, when 2.24 becomes the oldest supported glibc
> version, glibc as a whole will be usable only for >= 3.2.0. Hopefully
> by that time, all the people will have moved to newer kernels :)

Its just not kernel headers, infact its the kernel proper version as well
which should be >= 3.2.0

you should also use --enable-kernel switch to detect the case where
someone might be using older kernel with glibc 2.24 and running into
issues at runtime.

IMO BR should deprecate older versions more agressively, and keep them
only on need basis. May be its against the objectives of the project
but you will be spread thin supporting so many combinations and
how to test them all.
