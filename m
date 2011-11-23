From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2011 09:25:47 +0100
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111123092547.2898f799@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Nov 2011 16:35:20 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> Ok, this is where it becomes new for me.  Is this the "only way" or
> the "most convenient" way, or the "simplest way" for someone not that
> familiar with BuildRoot?

Basically you have the choice of :

 * Generating your system with Buildroot, then manually build EtherCAT
   outside of Buildroot using the Buildroot cross-compiler and the
   kernel built by Buildroot. Advantages: I don't see any, except maybe
   the fact that you don't need to learn out to create packages in
   Buildroot. Drawbacks: it might actually be *harder* to achieve than
   to create a package in Buildroot, and your build process is no
   longer nicely integrated.

 * Add a package in Buildroot. Requires learning a bit about how to
   create packages (but our documentation on this is quite good I
   think, and the Buildroot source tree is full of examples). In the
   end, it might be simpler to package your software component than
   building it manually, and you have the benefit of having it nicely
   integrated.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
