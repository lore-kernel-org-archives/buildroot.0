From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Mar 2012 16:09:04 +0100
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host
 tool
In-Reply-To: <CAAXf6LX40Or5xSKtDD5M8kb3duhcJ_w4Z7GX8pQo=Vdye9S70A@mail.gmail.com>
References: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
 <20120323155103.54f93fa3@skate>
 <CAAXf6LX40Or5xSKtDD5M8kb3duhcJ_w4Z7GX8pQo=Vdye9S70A@mail.gmail.com>
Message-ID: <20120323160904.417ade69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Mar 2012 16:01:16 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I hadn't though about this case.
> One could question whether it is a valid case that someone selects dtc
> in buildroot but not in the kernel.
> 
> Probably the nicest way is to not use dtc from the linux kernel
> sources but download the dtc sources explicitly. I thought this was a
> bit overkill, and I'm not sure if there can be inconsistencies between
> these sources and the kernel ones.

I have no strong opinion here. You can just keep what you've done and:

 * Add an explanation in the help text about this fact

 * Add something like the following to your installation code:

if ! grep -q ^CONFIG_DTC=y $(LINUX_DIR)/.config ; then
	echo "Cannot install the Device Tree Compiler since you have
	not enabled CONFIG_DTC=y in your kernel configuration.
	Aborting".
	exit 1
fi

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
