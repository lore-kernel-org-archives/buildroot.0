From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 21:34:36 +0100
Subject: [Buildroot] "The owner of buildroot.uclibc.org has configured
	their website improperly."
In-Reply-To: <CAF_dkJCBdH-p5Oa6TcKobVBR-ovT84jB64dE4mhy8ZaHV9UATQ@mail.gmail.com>
 (Patrick Doyle's message of "Tue, 23 Feb 2016 11:59:20 -0500")
References: <CAF_dkJCBdH-p5Oa6TcKobVBR-ovT84jB64dE4mhy8ZaHV9UATQ@mail.gmail.com>
Message-ID: <87k2lv6u8z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Doyle <wpdster@gmail.com> writes:

 > I apologise if this has already been asked.
 > When I try to connect to buildroot.uclibc.org with my ubuntu 14.04
 > Firefox 44.0.2, I get the following message:

 > Your connection is not secure
 > The owner of buildroot.uclibc.org has configured their website
 > improperly. To protect your information from being stolen, Firefox has
 > not connected to this website.

 > This site uses HTTP Strict Transport Security (HSTS) to specify that
 > Firefox only connect to it securely. As a result, it is not possible
 > to add an exception for this certificate.

 > I thought I should mention this, even though I'm sure I can't be the
 > first to have noticed it.

First of all, buildroot.uclibc.org is the legacy name - Nowadays we have
buildroot.{org,net}, so please use http://buildroot.org instead.

Secondly, the reason why you get this error is that the uClibc
developers have recently added HSTS for *.uclibc.org (which forces
https:// access), and the certificate we use for Buildroot doesn't list
the legacy buildroot.uclibc.org address.

I'll try to get that fixed, but please move to the official address
instead, which we've had for ~5 years or so by now.

-- 
Bye, Peter Korsgaard
