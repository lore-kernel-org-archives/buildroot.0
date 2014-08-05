From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 16:22:56 +0200
Subject: [Buildroot] Error u-boot 2014.07
In-Reply-To: <53E0E024.9070705@mac.com>
References: <53E0E024.9070705@mac.com>
Message-ID: <20140805162256.7223e234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gmv,

On Tue, 05 Aug 2014 14:46:12 +0100, gmv wrote:

> I'm tring for first time to use buildroot.
> The target is Microblaze (little indian), my board is Spartan 3E1600 
> microblaze dev kit.
> 
> in
> Bootloaders i made the choice 'U-Boot' 'U-Boot board name --> generic',
> binary format u-boot.elf
> 
> the process stop with message:
> make *** no rule to make target 'generic-config'. Stop.

Really "generic-config" ? Are you sure it wasn't "generic_config" ?

But well basically, it just means that there is no U-Boot configuration
named "generic" for this architecture. Probably you were looking for
the "microblaze-generic" board instead:

In U-Boot:

$ grep generic boards.cfg | grep microblaze
Active  microblaze  -              -           xilinx          microblaze-generic  microblaze-generic

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
