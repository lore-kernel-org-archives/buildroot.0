From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 12:28:25 +0100
Subject: [Buildroot] [PATCH 1/2] ngrep: bump to version 1.47
In-Reply-To: <CAPi7W83CQfQGjuhZBUvZoPBsJJLSE2sgRj_P9UHt7Lvb9bpqpA@mail.gmail.com>
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
 <20181103224222.229c064a@windsurf>
 <CAPi7W8388ghbe_PtDyJ_Hi1=2PLo4sAoZbzwORjH4qLGQ-ue5w@mail.gmail.com>
 <20181104111953.08d765e0@windsurf>
 <CAPi7W83CQfQGjuhZBUvZoPBsJJLSE2sgRj_P9UHt7Lvb9bpqpA@mail.gmail.com>
Message-ID: <20181104122825.57fb0e8d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Nov 2018 12:04:19 +0100, Fabrice Fontaine wrote:

> > Indeed, it could be a third patch.  
> OK, when I tried to enable GNU regex (on 1.47), I got the following error:
> /usr/bin/make w -j --jobserver-fds=3,4 -C regex-0.12 regex.o
> make[2]: Entering directory
> '/home/fabrice/buildroot/output/build/ngrep-1_47/regex-0.12'
> make[2]: *** No rule to make target 'w'.  Stop.
> 
> This error is raised by this command:
> $(MAKE) $(MAKEFLAGS) -C $(REGEX_DIR) $(notdir $(REGEX_OBJS))
> 
> which means that MAKEFLAGS is set to "w -j --jobserver-fds=3,4".
> I don't understand where this "w" and not "-w" is coming from. Do you
> have any advice or clue?
> I can make a patch to remove MAKEFLAGS but this won't be upstreamable.
> Thanks for your help.

I don't immediately have an idea, but I did a build of ngrep 1.47
without pcre enabled, and it build fine here. I did this yesterday,
before replying to you that pcre was an optional dependency.

Anyway, we can keep pcre as a mandatory dependency for now, so I'll
apply your original patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
