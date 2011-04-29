From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 29 Apr 2011 19:03:13 -0400
Subject: [Buildroot] Making --localstatedir=/var global?
In-Reply-To: <BANLkTi==ps=OpY80aRQBrEL7KcyowjPgOw@mail.gmail.com>
References: <BANLkTi==ps=OpY80aRQBrEL7KcyowjPgOw@mail.gmail.com>
Message-ID: <201104291903.13821.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, April 29, 2011 07:38:17 Daniel Nystr?m wrote:
> I see many packages defines localstatedir to point at /var - what do
> you think about making it a global default by putting it in
> Makefile.autotools.in?
> 
> There are a few exceptions though:
> dhcp/dhcp.mk: defines localstatedir to /var/lib/dhcp
> links/links.mk: defines localstatedir to /tmp
> proftpd/proftpd.mk: defines localstatedir to /var/run
> 
> All of these are (AFAIK) errornous use of the localstatedir variable,
> and could be corrected using patches instead.

i dont think many of those are correct.  it should default to /var/lib 
(because that's where local state data lives).  if a package (like dhcp) wants 
something more specific, then a subdir under /var/run is OK.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110429/4d5f4f22/attachment-0001.asc>
