From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jan 2017 23:35:58 +0100
Subject: [Buildroot] Relocatable staging dir and reference to build dir
In-Reply-To: <CAFKqv7y-ARxUBgiubYHK_fUwtHz1L=zgXBHpMnSBAD2FDBXfOw@mail.gmail.com>
References: <CAFKqv7y-ARxUBgiubYHK_fUwtHz1L=zgXBHpMnSBAD2FDBXfOw@mail.gmail.com>
Message-ID: <25780650-1438-c875-d5cf-48ea44069c9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-01-17 16:32, J?r?me BARDON wrote:
> Hello all,
> 
> Our need is to relocate the staging dir for developers (and automatic
> bulld by Jenkins).

 Sorry for the late reply, and it isn't even positive.

 No, at the moment, the staging tree is not relocatable. See [1] ("Make the HOST
directory a relocatable SDK") for details of what needs to be done. Several
patches have been posted on the mailing list to progress in that direction, but
it wasn't finished yet.

> We found that there are absolute paths in the staging tree config
> files for libs and also references to the bulld dir.
> Is there a way to have relative paths in .la and pkgconfig files? Or
> another mean to change absolute paths?

 For .la and .pc files it should be relatively straightforward to postprocess
them to convert to relative paths (using -L=/... and -I=/... to make them
relative to the sysroot). Actually, the .pc files should already be "clean",
except for a few buggy Xorg files IIRC.


 Regards,
 Arnout


[1] http://elinux.org/Buildroot#Core_Buildroot_infrastructure
> 
> 
> J?r?me Bardon
> Aviwest
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
