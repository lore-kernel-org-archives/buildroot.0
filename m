From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:14:27 +0100
Subject: [Buildroot] "The owner of buildroot.uclibc.org has configured
	their website improperly."
In-Reply-To: <56CCC524.8020709@mind.be> (Arnout Vandecappelle's message of
 "Tue, 23 Feb 2016 21:46:28 +0100")
References: <CAF_dkJCBdH-p5Oa6TcKobVBR-ovT84jB64dE4mhy8ZaHV9UATQ@mail.gmail.com>
 <87k2lv6u8z.fsf@dell.be.48ers.dk> <56CCC524.8020709@mind.be>
Message-ID: <87bn776sek.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Secondly, the reason why you get this error is that the uClibc
 >> developers have recently added HSTS for *.uclibc.org (which forces
 >> https:// access), and the certificate we use for Buildroot doesn't list
 >> the legacy buildroot.uclibc.org address.

 >  The fix could be that the webserver is configured to redirect
 > buildroot.uclibc.org to buildroot.org, instead of serving it directly.

It does send a redirect when you use http, but because of the HSTS with
subdomains on uclibc.org the browser ends up requesting
https://buildroot.uclibc.org which currently is an alias for
https://buildroot.org, so it serves the page with a non matching
certificate.

Even if change it so https://buildroot.uclibc.org serves a redirect we
still need to respond with a valid certificate, so I'll try to fix that
with letsencrypt.

-- 
Venlig hilsen,
Peter Korsgaard 
