From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Oct 2013 12:47:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-10-24
In-Reply-To: <526A26EB.7010804@mind.be>
References: <20131025063005.51B7752C609@lolut.humanoidz.org>
 <526A26EB.7010804@mind.be>
Message-ID: <20131025124746.0dbffd63@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 25 Oct 2013 10:08:11 +0200, Arnout Vandecappelle wrote:
> On 25/10/13 08:30, Thomas Petazzoni wrote:
> >                      mpd-0.17.6 | 11
> 
>   This is a download failure of the package source. The weird thing is 
> that I could get it from here yesterday evening, so I expected this error 
> to go away...

Something weird going on: I get a connection refused when I access the
musicpd.org web server from my build server, but not from other
locations:

# From machine 1 (Linux Foundation network)

$ telnet 78.46.162.86 80
Trying 78.46.162.86...
Connected to 78.46.162.86.
Escape character is '^]'.
GET /
[...]

# From machine 2 (somewhere on the Net)

$ telnet 78.46.162.86 80
Trying 78.46.162.86...
Connected to 78.46.162.86.
Escape character is '^]'.
GET /
[...]

# From build server

$ telnet 78.46.162.86 80
Trying 78.46.162.86...
telnet: Unable to connect to remote host: Connection refused

Not sure what's going on... They blacklisted the build server IP address
because I'm downloading things too many times?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
