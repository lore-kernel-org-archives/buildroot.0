From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 00:12:29 +0100
Subject: [Buildroot] BR2_GCC_SHARED_LIBGCC Deprecated? libstdc++
 libgcc_s libc
In-Reply-To: <1517949577363-0.post@n4.nabble.com>
References: <1517949577363-0.post@n4.nabble.com>
Message-ID: <5657dfa7-b9e1-71a2-aed0-bb51ca68e550@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 21:39, AAlex_ wrote:
> Hi,
> I need libstdc++ libgcc_s libc on the target. It?s a pc x86 target and
> I don?t want to copy these from my development machine. 

 Copying those from the development machine would be a very bad idea indeed...

> So How to? build root should build these libs for the target.

 They are part of the toolchain and they will always be present on the target,
with the following exceptions:

- libstdc++ is only present if C++ support is enabled in the toolchain;

- only the .so files are present in the target, since the .a files are useless;
and therefore

- if you build a static-only target (under the 'Build options' menu,
BR2_STATIC_LIBS option), the .so files are not copied to the target, since all
binaries are linked statically.

 Regards,
 Arnout

> BR2_GCC_SHARED_LIBGCC is deprecated. I?m using  buildroot 2017.rc2
> 
> Regards,
> Alex
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
