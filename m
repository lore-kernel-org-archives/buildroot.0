From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 23:17:47 +0200
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <2039F480-7B29-4B59-8F02-62125387E3F6@gmail.com>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160805185348.4c0ff1fd@free-electrons.com>
 <2039F480-7B29-4B59-8F02-62125387E3F6@gmail.com>
Message-ID: <20160805231747.768e6c08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 13:58:12 -0700, Khem Raj wrote:

> > Regardless of this detail, this means we will have to encode this
> > dependency somehow. Indeed, we still have people using kernels older
> > than 3.2 I believe on various platforms.  
> 
> thats right. perhaps --enable-kernel=3.2.0 conditional on version being
> 2.24 in glibc mk file would put in a runtime check where apps would fail
> to run on older kernels. If you want to detect it at build time then you
> need to insert a mechanism to parse the kernel version of the build and
> then compare that against kernel version used with --enable-kernel,

I'm not really talking of build time detection, but rather referring to
the fact that we have Config.in options in Buildroot that tell us the
version of the kernel headers. So maybe glibc 2.24 should depend on
kernel headers >= 3.2.0. For now, we'll keep glibc 2.23, but then some
time later in the future, when 2.24 becomes the oldest supported glibc
version, glibc as a whole will be usable only for >= 3.2.0. Hopefully
by that time, all the people will have moved to newer kernels :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
