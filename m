From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jun 2010 18:58:24 +0200
Subject: [Buildroot] Kernel build process
In-Reply-To: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
References: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
Message-ID: <20100630185824.095c6ad0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jun 2010 21:03:22 +1000
"Paul Jones" <paul@pauljones.id.au> wrote:

> Just some comments about the new kernel cleanup code. If a kernel
> config is not supplied, the default action is to stop with a rather
> cryptic error.

Hum true.

> This doesn't seem like a good idea to me, especially when the
> previous behaviour was to just create a default .config and continue.
> I can see a lot of beginners getting caught out with that one.
> 
> What I would like to suggest is this:
> 
> 1)      Change the default Kernel Configuration to "Using a custom
> config file" (is currently set to use a defconfig)

Ok, why not.

> 2)      Leave "Configuration file path" blank as default

Yes.

> 
> 3)      Add code to ignore copying config file if "Configuration file
> path" is still blank and just continue compiling the kernel with the
> default options.
> 
> That way it should be obvious to any beginners what the options do,
> and if they are not set (ie left as default) the build will still be
> able to continue.

I'm not sure about this last part, though. What kind of "default
options" will the kernel select ? Just a random set of options for the
architecture selected ? Yes for x86 this will do something more or less
sensible, but for other embedded architectures such as ARM, there's no
such thing as a "default set of options that makes sense".

So I'd prefer to detect the fact that the configuration file path
option has been left empty, and abort the build by showing an explicit
and clear error message about this.

Same could be done for the defconfig option.

What do you think ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
