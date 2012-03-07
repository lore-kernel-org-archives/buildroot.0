From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Mar 2012 16:50:35 +0100
Subject: [Buildroot] [PATCH] Fix microperl
In-Reply-To: <d35484b93145763e6c0dcb6274f4954e@zacarias.com.ar>
References: <1330895345-16705-1-git-send-email-arnout@mind.be>
 <871up5o277.fsf@macbook.be.48ers.dk>
 <20120307090613.3b8e4a9a@skate>
 <d35484b93145763e6c0dcb6274f4954e@zacarias.com.ar>
Message-ID: <20120307165035.6f9d0f84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 07 Mar 2012 12:29:21 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> It has a limitation on modules at the moment, they must be of the pm 
> (interpreted) type rather than the more complex xs ones (C usually).
> That's because full perl is required for xs which in turn requires a 
> full-blown configuration.

Ok.

> For the most part it checks for libc functions and presence of other 
> libs, and platform details (sizeof... and so on).
> At the moment this would be "important" (not for me though) to get 
> target autoconf/automake going since there are new required modules 
> which are XS when the auto* packages were versioned bumped.

Could you expand on this, because I'm not sure I got what you said.

> The proper solution would probably be define the lowest denominator
> for libc, say uclibc-0.9.31, generate a cache on a qemu/working
> target and get that back into the package.

A bit like what we do for ./configure scripts already, at the end of
package/Makefile.in, correct?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
