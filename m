From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 24 Nov 2010 19:29:13 +0100
Subject: [Buildroot] Crosstool-NG depends on awk/gawk
In-Reply-To: <20101124171143.7e1c497a@surf>
References: <20101124171143.7e1c497a@surf>
Message-ID: <201011241929.13686.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 24 November 2010 17:11:43 Thomas Petazzoni wrote:
> I've finally tried the Crosstool-NG backend and it doesn't work because
> it needs awk/gawk on the host, which isn't installed on my limited
> Debian environment:

Could you please send me your dpkg --get-selections (and other info,
lenny/squeeze, arch...) so I can try it as well?

> Checking for 'gawk'... no
> GNU awk was not found
> So probably we should build host-gawk before running Crosstool-NG
> build, or make it a mandatory Buildroot dependency.

For now, I'd say we should build host-gawk first, as crosstool-NG is
not (yet) the default backend.

The issue I see is: what is the minimum environment Buildroot expects
to run in? Do we have such a description somewhere? What happens once
host-gawk is build: what other program is required?

I can test with your minimalist environment, in a chroot here.

> Other comment: Yann, it'd be really great if Crosstool-NG was hosted
> behind a better connection than a DSL connection. Downloading at 50
> KB/s is really frustrating :)

It's not as if the package was tens of megabytes! ;-)

Hosting crosstool-NG on my own was also a mean for me to learn how to
administer a server. That way, I learned:
- how to set up a server: http, Hg, etc...
- how to set up proper backup/restore procedures (and they were usefull once)
- etc...

And also, I already had a DynDNS, so I used that. When I move to a dedicated
server, I will first have to buy/rent a domain name, and learn how to manage
a DNS zone (yes I could off-load that to the registrar, and I may start that
way, but I want to be as autonomous as possible).

And, yes, I'm considering switching to a dedicated server. For examnple:
- OVH, RPS-I : http://www.ovh.com/fr/produits/rps1.xml
- OVH, KS-250: http://www.kimsufi.com/ks/

While the former is cheaper, the disk space is sparse (but should be enough
for CT-NG) and on a rather slow SAN (_1_MiBps). OTOH, the second is not
that expensive, and it has a real big physical HDD.

Anyway, having a dedicated server will also mean I will have to find a way
to properly backup the stuff.

Yes, yes, I could also put all of it into an existing forge (sourceforge,
bitbucket, google-code...) but again, I want to learn and manage the stuff,
and be as independent as possible from any third party.

I was also thinking of refurbishing an old Dell blade and host my own machine
in a datacenter, but that is really expensive (and much, much less reliable).

All in all, I believe I'll be switching early in 2011.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
