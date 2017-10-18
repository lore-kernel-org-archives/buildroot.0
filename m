From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 13:36:09 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <8b07f0fe-4f00-c47b-c81d-accb418cef21@mind.be>
References: <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
 <20171018085748.20a3a9f5@windsurf.home>
 <20171018074436.GB11912@bifrost>
 <20171018095826.26c40072@windsurf.home>
 <20171018080911.GA12664@bifrost>
 <20171018101106.1364b003@windsurf.home>
 <20171018090510.GA13015@bifrost>
 <20171018111041.649509e3@windsurf.home>
 <8b07f0fe-4f00-c47b-c81d-accb418cef21@mind.be>
Message-ID: <20171018133609.334b64da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 12:54:44 +0200, Arnout Vandecappelle wrote:

>  I agree here. Leave as much as possible to the user. It is for this very reason
> that I'd prefer the -Orecurse to be specified by the user and not enforced in
> our Makefile. Users who always want this behaviour can make an alias, or export
> MAKEFLAGS="-Orecurse -j5", or use brmake.

I don't entirely agree here. While -j5 is well known, -Orecurse
certainly isn't, and I'd like to have something that has a reasonable
behavior out of the box.

>  Regardless, I consider the logging one of the least priority things in the
> whole top-level parallel build thing.

Same here: if you don't solve the logging problem, top-level parallel
build is horrible. You can't debug anything, it's a total mess.

Yes, it's just one small aspect of the problem, but it's one aspect
that needs to be solved.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
