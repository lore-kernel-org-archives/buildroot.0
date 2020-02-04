From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 15:53:14 +0100
Subject: [Buildroot] [PATCH v2] package/grep: fix egrep/fgrep shebang
In-Reply-To: <87d0aujttx.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 04 Feb 2020 15:44:10 +0100")
References: <1580826287-1343-1-git-send-email-angelo@amarulasolutions.com>
 <87d0aujttx.fsf@dell.be.48ers.dk>
Message-ID: <878slijtet.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> +else
 >> +GREP_CONF_OPTS += SHELL=/bin/sh

 > It is a bit odd to not do this unconditionally. Such environment
 > variables normally go in _CONF_ENV, so I changed that, reworded the
 > commit message a bit and committed, thanks.

Except that it doesn't work, so in the end I changed it to just sed
s/bash/sh/ in a post-install hook. That way it will not break if the
configure script / Makefile ever start using bashisms.

-- 
Bye, Peter Korsgaard
