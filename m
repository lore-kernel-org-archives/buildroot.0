From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Oct 2012 21:30:40 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <507CF328.5090505@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <20121014160547.09c493d7@skate>
 <201210141631.29399.yann.morin.1998@free.fr>
 <20121014193849.019347dd@skate> <507CF328.5090505@mind.be>
Message-ID: <20121017213040.01b61869@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 16 Oct 2012 07:39:52 +0200, Arnout Vandecappelle wrote:

>   Originally I was in favour of having the BR2_PACKAGE_PYTHON
> conditionals, but it _would_ probably make life simpler if we only
> had dependencies on toolchain options...
> 
>   Yann, what do you think, would it make suboption handling simpler
> if there was no 'depends on BR2_PACKAGE_PYTHON'?

The real problem with _AVAILABLE is not caused by Python/X.org packages
being under a big "if" condition. The big problem we hadn't really seen
is that we don't only need to add _AVAILABLE options for each package,
but also for each package sub-options that does a select on another
package. This means that the number of _AVAILABLE kconfig options to
add is a lot bigger than we expected, at a point that probably makes
the _AVAILABLE solution relatively impractical.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
