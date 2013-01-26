From: John Stile <john@stilen.com>
Date: Fri, 25 Jan 2013 16:01:47 -0800
Subject: [Buildroot] can I build two copies of uboot in buildroot?
In-Reply-To: <1359148418.7974.65.camel@genx>
References: <1359148418.7974.65.camel@genx>
Message-ID: <1359158507.7974.86.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2013-01-25 at 13:13 -0800, John Stile wrote:
> I have hacked at91bootstrap to select and boot one of two copies of
> uboot+env on a NAND flash, but I had to compile the second uboot my
> self, since the environment address is set at compile time, and
> buildroot only builds one copy of uboot.  
> 
> How might I hack uboot to build two different copies of uboot?  I'm just
> changing the address location of the uboot environment, and saving the
> image as a different name.
> 
> I wasn't able to figure out how to make the uboot environment address a
> parameter to uboot, so I also haven't tried to have at91bootstrap call
> uboot with this parameter, but that might be easier.
> 

As this seems to be difficult to do, maybe it is the wrong approach.

From at91bootstrap, it is easy to also load uboots env area into another
RAM address.

Is it possible to have uboot read it's environment from a RAM address,
rather than NAND?
OR
Can uboot's scripting support load variables from a RAM address?

Maybe I could build one uboot, and one env, write it to two places,
have at91bootstrap copy the proper uboot to RAM, copy the proper
environment to RAM, and have uboot (via hack or script) acquire the
proper parameters from RAM.  This would allow for 2 NAND areas, and a
one fall back NOR image.
