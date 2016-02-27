From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 21:46:25 +0100
Subject: [Buildroot] Loading modules with device tree after rootfs is
	mounted
In-Reply-To: <87h9gurq7t.fsf@dell.be.48ers.dk>
References: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
 <56AE904B.2030906@mind.be> <87wppqsbfo.fsf@dell.be.48ers.dk>
 <56D191E9.3050604@mind.be> <87h9gurq7t.fsf@dell.be.48ers.dk>
Message-ID: <56D20B21.70306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/16 18:57, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> - Add a line to the init script for cold plugging modules
>  >> (E.G. modules for which the devices were already present before mdev
>  >> was added as the hotplug handler). mdev -s should arguable handle
>  >> this, but it doesn't.
> 
>  > Well, mdev was not originally meant to do the module probing, it's
>  > more of a hack on top of it. mdev was meant for changing names and
>  > permissions of device nodes. So in the coldplug (mdev -s) it will
>  > just handle the device nodes it finds in /sys/class.
> 
>  >> find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq
> 
>  >  I wouldn't have thought of the sorting, but looks good to me.
> 
> This was cut'n'paste from:
> 
> http://lists.busybox.net/pipermail/busybox/2014-September/081780.html
> 
> Replacing the 'sort -u' with cat would also work. I'm not sure exactly
> what the pros/cons of using sort -u is.

 It removes duplicates from the list.

> 
> As that message states, we also need to make sure that we have a
> modprobe understanding the aliases (so not the MODPROBE_SMALL busybox
> variant).

 I think in our system scripts we are allowed to rely on the things that
are enabled in our default busybox config. So that should be OK.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
