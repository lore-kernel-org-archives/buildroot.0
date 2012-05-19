From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 May 2012 21:31:00 +0200
Subject: [Buildroot] Problem with host packages
In-Reply-To: <4F98374C.7010701@carallon.com> (Will Wagner's message of "Wed,
 25 Apr 2012 18:41:32 +0100")
References: <4F98374C.7010701@carallon.com>
Message-ID: <8762bsm0i3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hello,
 Will> I have been working on updating the xorg components and as part of
 Will> that I need to update mesa3d. Newer version of this require that you
 Will> have python libxml2 support.

 Will> Currently for host-libxml2 python support is disabled. I can change
 Will> that so that it builds python support but that then means you have to
 Will> build host-python any time you want host-libxml2. When building for
 Will> the target we are able to see what is selected for the target and
 Will> conditionally change what options are used. Is there an equivalent
 Will> mechanism for doing this with host packages?

Not really as those don't get added to TARGETS, but only in the various
*_DEPENDENCIES variables. Perhaps we should add them to TARGETS.

-- 
Bye, Peter Korsgaard
