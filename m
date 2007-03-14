From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 14 Mar 2007 11:35:55 +0100
Subject: [Buildroot] hardware detection
In-Reply-To: <1173867907.5844.15.camel@stefan-nb.feilmeier>
References: <1173841499.5844.11.camel@stefan-nb.feilmeier>
	<20070314100809.GD12028@aon.at>
	<1173867907.5844.15.camel@stefan-nb.feilmeier>
Message-ID: <20070314103555.GA13587@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 14, 2007 at 03:55:07PM +0530, Stefan Feilmeier wrote:
>On Mi, 2007-03-14 at 11:08 +0100, Bernhard Fischer wrote:
>> On Wed, Mar 14, 2007 at 08:34:59AM +0530, Stefan Feilmeier wrote:
>> >Hello.
>> >
>> >First of all buildroot is a really useful tool and we use it to build
>> >the initial system for our install cd. The only problem is that I am
>> >stuck on hardware detection. I am trying to store my kernel modules on
>> >the cd and mount it during boot process to keep my initrd small. Modules
>> >for the cdrom drive are compiled into the kernel. This is what I do
>> >currently: 
>> >
>> >1. Boot initrd
>> >2. /etc/init.d/S10udev starts udev and populates /dev
>> >3. Mount cdrom(s) on /mnt/cdrom/
>> >4. Mount --bind /lib/modules
>> >
>> >Till here everything works just fine and the modules are accessible
>> >in /lib/modules. Now I try to run `udevtrigger` but it doesn't detect my
>> >network card. Loading the module manually with `modprobe pcnet32` works
>> >fine. I am trying this in a VMware virtual machine.
>> >
>> >Does anybody have a hint for me?
>> 
>> 1) delete udev and use busybox's mdev instead
>> 2) echo alias eth0 pcnet32 >> /etc/modprobe.conf; ifup eth0
>>  or something to that effect.
>
>Thanks for your answer. The problem is that I need real hardware
>detection as the cd will run on many different platforms and not only on
>VMware virtual machines. Any idea?

I'm confident that there are numerous tools with varying dependencies to
accomplish that task.
discover (i use the one from debian) should do the trick, perhaps?
