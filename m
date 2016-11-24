From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 21:48:15 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <20161120231843.GA2896@tungsten.ozlabs.ibm.com>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
 <20161120231843.GA2896@tungsten.ozlabs.ibm.com>
Message-ID: <4ed19823-030d-7f1d-0be9-549651d21a3b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 00:18, Sam Bobroff wrote:
> Really, the right approach would probably be to change the compiler
> flags so that it's not combining altivec with -std=c99 (e.g. change
> -std=c99 to -std=gnu99, which also fixes the issue for me) but I'm
> concerned that doing it that way might have unintended side effects
> since I don't know exactly what those flags change or why the package is
> setting c99 in the first place.

 Packages usually set --std=cNN to give some kind of portability guarantee.
There normally shouldn't be a difference when compiling with --std=gnu. There
are no guarantees, of course, but it should be pretty safe.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
