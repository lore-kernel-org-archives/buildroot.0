From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 08:34:27 +0100
Subject: [Buildroot] Solving the mesa3d build issue
In-Reply-To: <50AD1EC3.4090401@mind.be>
References: <20121117150357.2aa86a1c@skate>
	<50AD1EC3.4090401@mind.be>
Message-ID: <20121122083427.0c93fa51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 21 Nov 2012 19:34:43 +0100, Arnout Vandecappelle wrote:

>   A fourth solution would be to create a new host-only package libxml2-python
> that builds libxml2 with python bindings.  It would just reuse the libxml2
> package with a slightly different CONF_OPT.
> 
>   The differences with the currently committed solution (1) are:
> 
> - No need for a HOST-config symbol.
> 
> - host-libxml2 will be built twice, once without and once with python bindings.
> 
>   There may even be a workaround for the second step, but at the moment I assume
> it will be built twice.
> 
>   What do you think?

This is indeed another solution. But just like the kconfig knob for a
host package creates a precedent, having two separate binary packages
for one single source package is also creating another precedent. I'm
not sure which is not is better, really.

Or maybe it's time for Buildroot to make the distinction between source
packages and binary packages? But this is going to be a very large
change.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
