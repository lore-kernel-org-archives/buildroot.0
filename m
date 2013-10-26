From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Oct 2013 12:48:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-24
In-Reply-To: <526B9237.8030602@zacarias.com.ar> (Gustavo Zacarias's message of
 "Sat, 26 Oct 2013 06:58:15 -0300")
References: <20131025063005.51B7752C609@lolut.humanoidz.org>
 <526A26EB.7010804@mind.be> <20131025124746.0dbffd63@skate>
 <526A4D39.3040106@zacarias.com.ar> <20131026084741.5cab8678@skate>
 <526B9237.8030602@zacarias.com.ar>
Message-ID: <87iowk2tpv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > Interesting indeed.
 > Testing from an IPv6-capable host i'm seeing the same problem, but it's
 > not IPv6-related, the DNS resolves just fine, tries IPv6 and fails, then
 > tries IPv4 and fails too.
 > If wget is forced to IPv4 is still fails.
 > The interesting part is that said machine is in germany, looks like
 > europe is having issues with musicpd.org ?!?

Strangely enough it works here:

Belgium, IPv6 support:
wget http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
--2013-10-26 12:41:18--  http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
Resolving www.musicpd.org... 2a01:4f8:d13:3c80::2, 78.46.162.86
Connecting to www.musicpd.org|2a01:4f8:d13:3c80::2|:80... connected.
HTTP request sent, awaiting response... 200 OK

Netherlands, IPv6 support:
wget http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
--2013-10-26 10:45:05--  http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
Resolving www.musicpd.org (www.musicpd.org)... 2a01:4f8:d13:3c80::2, 78.46.162.86
Connecting to www.musicpd.org (www.musicpd.org)|2a01:4f8:d13:3c80::2|:80... connected.
HTTP request sent, awaiting response... 200 OK

Scotland, IPv4 only:
wget http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz   /tmp
--2013-10-26 12:30:58--  http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
Resolving www.musicpd.org (www.musicpd.org)... 78.46.162.86, 2a01:4f8:d13:3c80::2
Connecting to www.musicpd.org (www.musicpd.org)|78.46.162.86|:80... connected.
HTTP request sent, awaiting response... 200 OK



But from Germany, IPv4 only (Hetzner) fails:
wget http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
--2013-10-26 12:46:54--  http://www.musicpd.org/download/mpd/stable/mpd-0.17.6.tar.xz
Resolving www.musicpd.org (www.musicpd.org)... 78.46.162.86, 2a01:4f8:d13:3c80::2
Connecting to www.musicpd.org (www.musicpd.org)|78.46.162.86|:80... failed: Connection refused.

 > WTF? (and it's working just fine from .ar at exactly the same time).
 > I'll try contacting hetzner about it since i can ping it, but not http
 > to it.

Thanks.

-- 
Bye, Peter Korsgaard
