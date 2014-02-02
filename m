From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 02 Feb 2014 18:55:54 +0100
Subject: [Buildroot] Wrong installation path?
In-Reply-To: <20140131111153.036fcfd5@skate>
References: <52EB629D.2030707@gmail.com> <20140131111153.036fcfd5@skate>
Message-ID: <52EE86AA.2040609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/01/14 11:11, Thomas Petazzoni wrote:
> Dear Marco Trapanese,
>
> On Fri, 31 Jan 2014 09:45:17 +0100, Marco Trapanese wrote:
[snip]
>
>> For example, the lirc documentation says I should find a /dev/lirc
>> device if I'm using udev.
>> But on my target (which has udev!) there is no such a device.
>
> Probably because your kernel configuration lacks the support for the
> proper kernel subsystem or kernel drivers.
>
>> Where should I look at? How to know if I missed something in the
>> buildroot/kernel configuration or just in the package (lirc)
>> configuration files?

  Or because lirc should install a udev rule but the buildroot wrapper 
doesn't install it correctly (seems like since it looks like it also 
didn't get the init script right).

  Regards,
  Arnout

>
> The package (lirc) is independent from the presence of absence
> of /dev/lirc<X>. As long as /dev/lirc<X> is not visible, then your
> problem is a kernel configuration problem. Of course, make sure your
> kernel has CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT enabled, these are
> mandatory if you use Buildroot udev support. See
> http://buildroot.org/downloads/manual/manual.html#_dev_management for
> details.
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
