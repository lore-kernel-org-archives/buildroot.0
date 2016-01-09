From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 9 Jan 2016 01:18:07 +0100
Subject: [Buildroot] ifupdown-0.8.2 / dhcp-4.1-ESV-R12 incompatibility
In-Reply-To: <568ECC28.50704@zacarias.com.ar>
References: <20160106142628.GA3891@dkarchlinux64.currentcomm.com>
 <568EB85E.3090501@zacarias.com.ar>
 <CA+sos7-4puPse5UehUFe3LO7DvfTattF+qUAu4n==LAdOBwYzw@mail.gmail.com>
 <568ECC28.50704@zacarias.com.ar>
Message-ID: <569051BF.70209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-01-16 21:35, Gustavo Zacarias wrote:
> On 07/01/16 17:30, Beno?t Th?baudeau wrote:
> 
>> I had started to look into this a few months ago, and setting
>> --with-libbind=PATH to use the bind provided by Buildroot seemed to be
>> a better option (in order to avoid possibly installing two instances
>> of bind on the target, either standalone or inside the dhcp binaries
>> if statically linked, and both bind versions were compatible at that
>> time), though I have not yet tested it.
> 
> Hi Beno?t.
> Let me save you some time, it doesn't work as expected.
> I've tried pointing that into the bind build directory (because it needs some
> specific *.a files that i think aren't installed, besides another problem) but
> no luck, since it stills expects that to live in it's own build directory, try
> in dhcp's source dir:
> 
> find . -name Makefile.am -exec grep --with-filename ../bind/lib {} \;
> 
> ...and you'll see the drastic results.
> 
> Even so with that fixed the bind package will need to get tweaked as well, since
> if you build shared-only you won't get those intermediate libraries built, and
> hence dhcp will fail as well.
> 
> All in all, it seems pretty broken.

 Given this brokenness, and that there are better alternatives, perhaps we
should kill the dhcp package? Or is it useful as a server? In the latter case,
we should add a warning to the ifupdown help text.

 BTW, I guess busybox ifupdown does work?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
