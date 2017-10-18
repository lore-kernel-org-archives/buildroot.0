From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 09:58:26 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171018074436.GB11912@bifrost>
References: <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
 <20171018085748.20a3a9f5@windsurf.home>
 <20171018074436.GB11912@bifrost>
Message-ID: <20171018095826.26c40072@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 09:44:36 +0200, Anisse Astier wrote:

> > I'm not sure how to handle the MESSAGE macro. One suggestion you made
> > was to output directly to the tty. But a big drawback of that is that
> > if you redirect the build output (make 2>&1 | tee logfile) then the
> > messages displayed by the MESSAGE macro will no longer be stored in the
> > logfile, which is super annoying: I always use them to navigate in the
> > logfile to the appropriate place. So I believe directly writing to the
> > tty in the MESSAGE macro is not a good option.  
> 
> I think Arnout meant that the MESSAGE macro could write to both the tty
> (if available) and stdout, hence getting the best of both worlds.

Well, in this case, you'd get the message twice on your terminal if you
run "make 2>&1 | tee logfile". Only one of the two will be saved in the
log file, but both of them will be visible on your tty.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
