From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:25:04 +0200
Subject: [Buildroot] Multi-File Kernel Module Build Fails
In-Reply-To: <CAN34foyVVDZTtB06iWVW_g=OrcPy+8g2wiiTPqDwWNqT1cXTAg@mail.gmail.com>
References: <CAN34fowqUhJX9LZ-7qkzr=20-dKFFX9r8suAuXpVnn-brbacQw@mail.gmail.com>
 <20160426214928.5d518086@free-electrons.com>
 <CAN34foyVVDZTtB06iWVW_g=OrcPy+8g2wiiTPqDwWNqT1cXTAg@mail.gmail.com>
Message-ID: <20160426222504.66c17f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Resending with the Buildroot mailing list in Cc. Please always keep
the list in Cc. Thanks!)

On Tue, 26 Apr 2016 16:20:17 -0400, Stephen Beckwith wrote:

> KMOD_MEM_MODULE_MAKE_OPTS = NETAPP_DIR=$(BR2_EXTERNAL)/netapp

Get rid of this.

> #inform the kernel that a module needs to be build
> obj-m := hwdd_memory.o
> hwdd_memory-objs := hwdd_mem.o hwdd_memalgo.o hwdd_cache_algos.o
> 
> # Global Includes here
> GBL_INCLUDES = $(NETAPP_DIR)/include
> KNL_INCLUDES = $(NETAPP_DIR)/include/kernel

And those two variable definitions.

> #Add here the CFLAGS to pass in to get the Defined Symbol
> CFLAGS_hwdd_memory.o := -DCONFIG_NETAPP_HWDD -I$(GBL_INCLUDES)
> -I$(KNL_INCLUDES)

And replace this by:

ccflags-y := -DCONFIG_NETAPP_HWDD -I$(src)/include -I$(src)/include/kernel

Again, I've spent time creating an example that I've tested. Since I
can't reproduce your test case, please try my example, which you can
test as I'm providing the entire source code :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
