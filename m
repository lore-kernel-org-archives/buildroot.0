From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 2 May 2011 07:11:35 +0200
Subject: [Buildroot] Making --localstatedir=/var global?
In-Reply-To: <201104291903.13821.vapier@gentoo.org>
References: <BANLkTi==ps=OpY80aRQBrEL7KcyowjPgOw@mail.gmail.com>
	<201104291903.13821.vapier@gentoo.org>
Message-ID: <BANLkTin+2XCnoB=6STY05TG8nBYoR0HV2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Den 30 april 2011 01:03 skrev Mike Frysinger <vapier@gentoo.org>:
> On Friday, April 29, 2011 07:38:17 Daniel Nystr?m wrote:
>> I see many packages defines localstatedir to point at /var - what do
>> you think about making it a global default by putting it in
>> Makefile.autotools.in?
>>
>> There are a few exceptions though:
>> dhcp/dhcp.mk: defines localstatedir to /var/lib/dhcp
>> links/links.mk: defines localstatedir to /tmp
>> proftpd/proftpd.mk: defines localstatedir to /var/run
>>
>> All of these are (AFAIK) errornous use of the localstatedir variable,
>> and could be corrected using patches instead.
>
> i dont think many of those are correct. ?it should default to /var/lib
> (because that's where local state data lives). ?if a package (like dhcp) wants
> something more specific, then a subdir under /var/run is OK.

I'm not sure that's really true when it comes to GNU Autoconf:
http://www.spinics.net/lists/ac/msg04439.html

But I have to admit that these parameters are not very well
documented, and therefore set for misunderstandings.
