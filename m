From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 10:05:58 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <87mvn82d50.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 30 May 2016 09:55:39 +0200")
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk>
Message-ID: <87inxw2cnt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > It seems we need to use the base#number syntax, E.G. 8#`umask` to get
 > zsh to interprete it as octal, but bash doesn't seem to like it :/

 > But the real question is why this happens in the first place? We do set
 > SHELL=bash, so all of this should be running under bash where it works.

Sorry, I misremembered. This logic is above the line where we assign
bash to SHELL, so it runs with /bin/sh as shell. On my system, this is
dash and it behaves like bash in this regard. What shell do you use?

In any case, I think the proper fix is to simply move the SHELL= line
above here to ensure we get consistent results.

-- 
Bye, Peter Korsgaard
