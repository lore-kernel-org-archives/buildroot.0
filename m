From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 09:20:49 +0100
Subject: [Buildroot] [PATCH v4 04/22] toolchain-external: introduce
 toolchain-external-package
In-Reply-To: <96c92e87-dc71-3030-d620-5ed285259ebb@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-5-arnout@mind.be>
 <a6555b0b-413d-0248-8b6f-75319c385440@gmail.com>
 <96c92e87-dc71-3030-d620-5ed285259ebb@mind.be>
Message-ID: <20161108092049.45aa1609@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Nov 2016 02:00:46 +0100, Arnout Vandecappelle wrote:

> > The tarballs contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
> > which themselves contain the toolchain, so we still need to add the toolchain
> > prefix...  
> 
>  Yes, the ADI blackfin toolchains are a kind of multilib toolchain, but instead
> of multilib it's actually two toolchains installed side by side.
> 
>  I'm thinking to either:
> - drop support for ADI blackfin toolchains, since our internal toolchain works
> fine now and we have lots of autobuilder exceptions for this toolchain; and/or

Let's do this. They are ancient (gcc 4.3, very old uClibc, etc.). They
were kind of useful in that they forced us to test a very old gcc, very
old uClibc, very old binutils, but I agree they have a lot of quirks,
and I'm not sure they are really actively used by our users.

Should we instead try to have some ancient ARM toolchain, in order to
keep testing old gcc, old binutils, etc. ? But even the ct-ng
toolchains that are quite old are causing a number of problems, and
have autobuilder exceptions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
