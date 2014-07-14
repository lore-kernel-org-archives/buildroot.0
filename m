From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 18:15:10 +0200
Subject: [Buildroot] [PATCH] dependencies.sh message: fix Debian renamed
 packages
In-Reply-To: <CABbD_XDXsfHT0OJ1vkp0bpHmZ6cxO5pGwkOC-HJoySXfgpWfvA@mail.gmail.com>
References: <1404988617-10992-1-git-send-email-kaszak@gmail.com>	<53BF7888.2010803@mind.be>
 <CABbD_XDXsfHT0OJ1vkp0bpHmZ6cxO5pGwkOC-HJoySXfgpWfvA@mail.gmail.com>
Message-ID: <53C4020E.10205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Karoly,

 [Please don't top-post, but reply in-line.]

On 14/07/14 12:21, K?roly Kasza wrote:
> Hi,
> 
> Yes, I'm pretty sure. You can still use a multiarch apt after some setup, but
> normally it's easier to just install the 32bit things from the 64bit repos.

 OK, now I see. So I guess the multiarch version takes precedence when you have
both.

 We should probably mention both options the, i.e.:

[snip]
> >               echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
> >               echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
> >               echo "library."
> > -             echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
> > -             echo "libstdc++6:i386, and zlib1g:i386 packages."
> > +             echo "If you're running a Debian/Ubuntu distribution, install the libc6-i386,"
> > +             echo "lib32stdc++6, and lib32z1 packages."

echo "If you're running a Debian/Ubuntu distribution, install the libc6-386,"
echo "lib32stcd++6, and lib32z1 packages (or alternatively libc6:i386,"
echo "libstdc++6:i386, and zlib1g:i386)."


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
