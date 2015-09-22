From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Sep 2015 09:49:07 +0200
Subject: [Buildroot] Default configuration for Ka-Ro TX25 module
In-Reply-To: <20150922065523.GD2242@tarshish>
References: <6bee8e0798ac4666bc051d88f2064b30@IHM-PORT-E13M01.prdhosting.local>
 <20150922065523.GD2242@tarshish>
Message-ID: <560107F3.80500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-09-15 08:55, Baruch Siach wrote:
> Hi Matthew,
> 
> On Mon, Sep 21, 2015 at 11:08:22PM +0000, Matthew Kerr wrote:
[snip]
>> 3)      Can I do anything with the Ka-Ro supplied rootfs or should I just 
>> let Buildroot generate this for me?
> 
> Buildroot supports helper mechanisms to ease local customization of generated 
> rootfs, like rootfs overlay, and post build script. See 
> http://nightly.buildroot.org/manual.html#customize for more details.

 Note that the binaries in the Ka-Ro supplied rootfs will most likely not work,
unless you also reuse their toolchain.

 Reusing their toolchain is BTW pretty easy as well: copy the toolchain out of
the VM and install it in the same location on your host, and in buildroot select
'External toolchain', 'custom toolchain', 'pre-installed toolchain', and point
'toolchain path' to where the toolchain resided (excluding the bin/ part). Then
you'll have to specify the toolchain properties: which standard C library is
used (most likely glibc), the gcc version, and the kernel headers version. If
you make a mistake there, buildroot will tell you what is wrong.

 One possible issue you may run into is that they also have custom versions for
some of the user-space programs, e.g. for bluetooth or wifi support. If that is
the case, it is probably easiest (to start with) to use the vendor-supplied
toolchain as I described above and just copy those binaries from the
vendor-supplied rootfs.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
