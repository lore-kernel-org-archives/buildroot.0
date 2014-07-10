From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 21:33:47 +0200
Subject: [Buildroot] [PATCH 10/10] busybox: support only one version
In-Reply-To: <20140710155650.GA28300@free.fr> (Yann E. MORIN's message of
 "Thu, 10 Jul 2014 17:56:50 +0200")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87oawxntvt.fsf@dell.be.48ers.dk>
 <20140710171848.75381ecb@free-electrons.com>
 <20140710155650.GA28300@free.fr>
Message-ID: <87y4w1m2jo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > I wonder if time also hasn't come to get rid of
 >> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?
 >> 
 >> I don't know. We've been discussing multiple times the SHOW_OTHERS
 >> thing, and I believe each time our conclusion was that it's nice for
 >> beginners to have Buildroot hide the applications for which Busybox
 >> already provides a good alternative. I'm sure if we remove
 >> SHOW_OTHERS, we'll have gazillions of newcomers enabling bash,
 >> util-linux and millions of other things that aren't needed when you
 >> have Busybox. So I still believe that SHOW_OTHERS is a good thing to
 >> have.

 > Agreed.

Ok.


 >> I however wonder why the SHOW_OTHERS dependency is not pushed to the
 >> individual Config.in of each package instead of cluttering
 >> package/Config.in.

 > Agreed.

 >> I'm sure there was a reason behind this choice, but I can't remember.

 > Neither do I.

 > If that is accepted, I'll work on this.

Fine by me. I think we should also be more careful about when we
consider the Busybox variant equivalent - E.G. we used to hide all web
servers (but not anymore), and we still hide the ISC dhcp package even
though busybox's udhcpd/c are very different in configuration that it.

-- 
Bye, Peter Korsgaard
