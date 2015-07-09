From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jul 2015 00:56:31 +0200
Subject: [Buildroot] Failed to build gdb on host side
In-Reply-To: <559B9F73.6010101@syscom-instruments.com>
References: <5596640E.8080604@syscom-instruments.com>
 <5596C015.9070201@mind.be> <559B9F73.6010101@syscom-instruments.com>
Message-ID: <559EFC1F.3070505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/15 11:44, Viallard Anthony wrote:
> On 07/03/2015 07:02 PM, Arnout Vandecappelle wrote:
>> On 07/03/15 12:29, Viallard Anthony wrote:
[snip]
> The file libiberty.a seems to come from the gcc-final package 

 Right, seems that gcc 4.7.4 installs it but later versions don't do that anymore.

 Simplest workaround is to remove libiberty.a from HOST_DIR after the build. I'm
not sure if it's still worth it to do this in buildroot itself.

 Regards,
 Arnout

> but it doesn't
> have the same md5 hash. I think gcc doesn't make a simple copy but modify the
> installed ar archive ?
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
