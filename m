From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jul 2014 09:30:04 +0200
Subject: [Buildroot] [PATCH 10/10] busybox: support only one version
In-Reply-To: <87y4w1m2jo.fsf@dell.be.48ers.dk>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87oawxntvt.fsf@dell.be.48ers.dk>
 <20140710171848.75381ecb@free-electrons.com>
 <20140710155650.GA28300@free.fr> <87y4w1m2jo.fsf@dell.be.48ers.dk>
Message-ID: <20140711093004.2c1f891c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 10 Jul 2014 21:33:47 +0200, Peter Korsgaard wrote:

>  > If that is accepted, I'll work on this.
> 
> Fine by me. I think we should also be more careful about when we
> consider the Busybox variant equivalent - E.G. we used to hide all web
> servers (but not anymore), and we still hide the ISC dhcp package even
> though busybox's udhcpd/c are very different in configuration that it.

That being said, the "full-blown" versions are never equivalent to the
Busybox ones. Take "bash" for example. One can hardly say that Busybox
ash is equivalent to bash. Though for most practical purposes, having
the Busybox ash is sufficient in embedded systems.

On one hand, hiding packages is good for newcomers so they are
encouraged to use Busybox by default for most things (which also
happens to be the configuration that most of us are using/testing I
guess). On the other hand, hiding packages may make those newcomers not
notice the entire scope of packages we have in Buildroot.

We could also switch to use some Config.in comment to say that "bash
could be available if Busybox show others was enabled" or something
like that. But that would add a lot of comment and clutter menuconfig
quite a bit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
