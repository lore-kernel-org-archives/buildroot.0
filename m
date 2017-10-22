From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Oct 2017 12:02:42 +0200
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <1508620062609-0.post@n4.nabble.com>
References: <1508584234482-0.post@n4.nabble.com>
 <87bml0cvqq.fsf@dell.be.48ers.dk> <1508618665952-0.post@n4.nabble.com>
 <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
 <1508620062609-0.post@n4.nabble.com>
Message-ID: <bc9fed74-546a-a9f6-26b5-4698562b051e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-17 23:07, Kees van Unen wrote:
>> This line looks pretty suspicious: 
> 
>> BR2_EXTRA_GCC_CONFIG_OPTIONS="-I/home/pi/Downloads/buildroot-2017.08/output/host/bassie" 
> 
>> Maybe that causes a wrong stlib.h somewhere? 
> 
> Quoted line was leftover from test. Uploaded new defconfig with same issue.
> 
> Kees
> 
> mblen_error.mblen_error
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/mblen_error.mblen_error>  
> raspberrypi0_defconfig.raspberrypi0_defconfig
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/raspberrypi0_defconfig.raspberrypi0_defconfig>  

 Hm, I tried that defconfig and it works for me...

 Copy the the make command line from the xlib_libX11, append V=1 to it, and
you'll see the compilation commands. Copy the compilation command for the
failing file, replace the -c with -E and the -o with some filename, so you get
the preprocessed file. Then in that preprocessed file check which stdlib.h it
includes. stdlib.h should be included from include/X11/Xlibint.h.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
