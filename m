From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 23:14:06 +0200
Subject: [Buildroot] [PATCH] pppd: Provide error() implementation in
 pppoe-discovery
In-Reply-To: <CAFOMc=SKjm5J-hn=+qexzeRqqNWJEXKWUUQnckX3ei8c6BMTkA@mail.gmail.com>
References: <1476555914-22201-1-git-send-email-Stefan.Nickl@gmail.com>
 <20161015223315.47f04e55@free-electrons.com>
 <CAFOMc=SKjm5J-hn=+qexzeRqqNWJEXKWUUQnckX3ei8c6BMTkA@mail.gmail.com>
Message-ID: <7e6742e0-fcd9-8ee3-e77d-358e345bd595@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-10-16 22:57, Stefan Nickl wrote:
> On Sat, Oct 15, 2016 at 10:33 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
> 
>     Thanks for this patch. Could you submit this as a Buildroot patch? I.e
>     a patch that adds a patch to package/pppd/ ?
> 
> 
> That was my original intention hadn't I messed up :)
> 
> However yesterday's autobuild showed that the issue I had in mind did not
> actually break uclibc (which really does provide the error() facility) but just
> caused a warning right before things went south.
> 
> The real breakage seems due to 4.8 kernel headers, see
> also https://github.com/paulusmack/ppp/pull/69.
> 
> I think things aren't as simple at the patch proposed there suggests, will
> investigate...

 Are the patches[1] that you submitted to fix musl builds still valid?


 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/664683/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
