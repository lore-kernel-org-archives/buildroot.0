From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 11:06:15 -0300
Subject: [Buildroot] [PATCH 2/4] pciutils: add hash file
In-Reply-To: <878ukhotem.fsf@dell.be.48ers.dk>
References: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>	<1413329080-25292-2-git-send-email-gustavo@zacarias.com.ar>
 <878ukhotem.fsf@dell.be.48ers.dk>
Message-ID: <543FD0D7.2010307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/2014 07:33 PM, Peter Korsgaard wrote:

> While this checksum matches the .asc file, it is different than what
> was on the old server (and on sources.buildroot.org, autobuilders and
> whatnot) - And as pciutils hasn't been bumped since Nov 2013 people are
> quite likely to already have it in their dl/.
> 
> As pciutils isn't really such a security sensitive package, I think we
> should wait with this until the version is bumped next time.

That shouldn't be a decisive factor, you're looking for consistency
besides security and it shouldn't reduce the effort in doing so.
I can argue that the security factor is indeed important, if you run
things as root (lspci, setpci) - which is common in embedded targets -
and the tarball installs a nifty backdoor then you probably wouldn't be
too happy about it.
I know it would be odd to use those tools outside development.
So compromise solution: switch to a new tarball format, that one isn't
cached anywhere.
Regards.
