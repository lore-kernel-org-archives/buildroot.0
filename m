From: Anisse Astier <anisse@astier.eu>
Date: Wed, 18 Oct 2017 11:05:10 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171018101106.1364b003@windsurf.home>
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
Message-ID: <20171018090510.GA13015@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 18, 2017 at 10:11:06AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 18 Oct 2017 10:09:11 +0200, Anisse Astier wrote:
> 
> > > Well, in this case, you'd get the message twice on your terminal if you
> > > run "make 2>&1 | tee logfile". Only one of the two will be saved in the
> > > log file, but both of them will be visible on your tty.  
> > 
> > It should be possible to detect if stdout is a tty or a pipe, and not
> > print on the tty when it's already one.
> 
> And when it's both, with "tee" ? :-)

Then we could consider the pipe case to be the same as a tty :-)

But as I said, there should be a top logfile by default, removing the
need for tee.

Regards,

Anisse
