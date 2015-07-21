From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Jul 2015 10:05:14 -0300
Subject: [Buildroot] [PATCH 1/2] openssl: use git formatted patches
In-Reply-To: <20150720160710.4707d820@free-electrons.com>
References: <1431803078-27629-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150720160710.4707d820@free-electrons.com>
Message-ID: <55AE438A.1030908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/07/15 11:07, Thomas Petazzoni wrote:

Hi Thomas.

> Since you are the de-facto maintainer of the OpenSSL package, could you
> give your opinion about the two patches in this series. I believe PATCH
> 1/2 is OK, but what do you think about PATCH 2/2 ?

It looks fine, however it needs a small refresh (c_rehash was fixed 
upstream, hence gone).

> Back in November 2014, Bernd also submitted some patches to enable
> parallel build of OpenSSL, see
> http://lists.busybox.net/pipermail/buildroot/2014-November/112183.html.
> Peter and I rejected them because they were a bit big. My proposal
> relies on downloading Gentoo patches instead, but I don't now if it's
> really any better, since those patches may cause some problems in the
> future to bump OpenSSL.
>
> What do you think? Should we simply wait for OpenSSL upstream to see
> the light and support parallel build?

I don't expect build patches to change much among what are usually 
security bumps, and also gentoo has a history of being fast updating 
openssl.
I wouldn't hold my breath expecting openssl upstream to fix anything 
soon, example patch we have:
http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
And my personal history with sending patches to them (c_rehash being one 
of the cases BTW) vouches for that. If you send it to the RT it may get 
"lost" for whatever reason, if you send the patch to the openssl-dev 
mailing list it gets ignored.

So +1 from me, openssl is one of those builds you see building and yawn 
about.
If it becomes an obstacle to a security bump we can just roll back to 
$(MAKE1) until a new patchset arrives.

Regards.
