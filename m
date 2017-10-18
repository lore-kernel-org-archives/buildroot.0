From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 11:10:41 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171018090510.GA13015@bifrost>
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
Message-ID: <20171018111041.649509e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 11:05:10 +0200, Anisse Astier wrote:

> But as I said, there should be a top logfile by default, removing the
> need for tee.

I'm not sure how this solves the problem. Indeed, even if we have a
logfile by default, it will be done using "| tee" so that stdout has
all the messages, and the logfile as well.

But I am not sure we want to log everything by default. I find it
somewhat neat that Buildroot doesn't enforce a logging strategy. Some
users prefer to redirect everything, some users prefer a "| tee" thing.
Some users prefer the log to be appended after the existing log, some
users prefer to truncate and replace the existing log.

So, if we're going the -Orecurse route, I'd prefer to not change our
logging strategy, i.e not log anything by default, and leave it up to
the user.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
