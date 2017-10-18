From: Anisse Astier <anisse@astier.eu>
Date: Wed, 18 Oct 2017 10:09:11 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171018095826.26c40072@windsurf.home>
References: <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
 <20171018085748.20a3a9f5@windsurf.home>
 <20171018074436.GB11912@bifrost>
 <20171018095826.26c40072@windsurf.home>
Message-ID: <20171018080911.GA12664@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Oct 18, 2017 at 09:58:26AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 18 Oct 2017 09:44:36 +0200, Anisse Astier wrote:
> 
> > > I'm not sure how to handle the MESSAGE macro. One suggestion you made
> > > was to output directly to the tty. But a big drawback of that is that
> > > if you redirect the build output (make 2>&1 | tee logfile) then the
> > > messages displayed by the MESSAGE macro will no longer be stored in the
> > > logfile, which is super annoying: I always use them to navigate in the
> > > logfile to the appropriate place. So I believe directly writing to the
> > > tty in the MESSAGE macro is not a good option.  
> > 
> > I think Arnout meant that the MESSAGE macro could write to both the tty
> > (if available) and stdout, hence getting the best of both worlds.
> 
> Well, in this case, you'd get the message twice on your terminal if you
> run "make 2>&1 | tee logfile". Only one of the two will be saved in the
> log file, but both of them will be visible on your tty.

It should be possible to detect if stdout is a tty or a pipe, and not
print on the tty when it's already one.

Also, I think that the tee to a logfile should be done by default, at
least in a parallel make environment, just to make sure the last build
log is kept, can be sent without copy/pasting issues in terminals, etc.
In this case, you don't need to do it manually when invoking buildroot
make.

Regards,

Anisse
