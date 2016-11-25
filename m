From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 25 Nov 2016 11:51:28 +1100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <4ed19823-030d-7f1d-0be9-549651d21a3b@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
 <20161120231843.GA2896@tungsten.ozlabs.ibm.com>
 <4ed19823-030d-7f1d-0be9-549651d21a3b@mind.be>
Message-ID: <20161125005128.GA9317@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 24, 2016 at 09:48:15PM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 21-11-16 00:18, Sam Bobroff wrote:
> > Really, the right approach would probably be to change the compiler
> > flags so that it's not combining altivec with -std=c99 (e.g. change
> > -std=c99 to -std=gnu99, which also fixes the issue for me) but I'm
> > concerned that doing it that way might have unintended side effects
> > since I don't know exactly what those flags change or why the package is
> > setting c99 in the first place.
> 
>  Packages usually set --std=cNN to give some kind of portability guarantee.
> There normally shouldn't be a difference when compiling with --std=gnu. There
> are no guarantees, of course, but it should be pretty safe.

OK sounds good, I'll send a patch doing this.

Cheers,
Sam.
