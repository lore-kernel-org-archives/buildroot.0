From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 23:07:06 +0100
Subject: [Buildroot] [PATCH 3/3] package/frr: new package
In-Reply-To: <20200224213654.GA41047@archlinux>
References: <20200224172652.30932-1-vadim4j@gmail.com>
 <20200224172652.30932-4-vadim4j@gmail.com>
 <20200224210601.4e3d9a3c@windsurf>
 <20200224211427.GC34982@archlinux>
 <20200224223246.32aacd46@windsurf>
 <20200224213654.GA41047@archlinux>
Message-ID: <20200224230706.254c00d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Feb 2020 23:36:54 +0200
vadim4j at gmail.com wrote:

> > Huh? That's not what I'm asking here. I'm just asking that you look at
> > the definition of each of those options, and if any of them has some
> > "depends on" dependency, you need to replicate them into the frr
> > package Config.in file.  
> Hmmm, you mean to add here "depends on" from selected packages ?

Yes, like we do in all other Buildroot packages.

See also section "17.2.3. Choosing depends on or select" in
https://buildroot.org/downloads/manual/manual.html.

> > > > So it's the frrinit.sh script that requires bash ?    
> > > Yes, this is runtime dependency.  
> > 
> > And using this script is important?  
> Well, it runs daemons on system init to handle routing
> protocols.

OK, but is it complicated? Can it be replaced by some simpler
Buildroot-compliant init script?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
