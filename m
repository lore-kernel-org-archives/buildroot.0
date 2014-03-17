From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 23:01:21 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a
	dependency
In-Reply-To: <20140317213619.GB3393@free.fr> (Yann E. MORIN's message of "Mon, 
 17 Mar 2014 22:36:19 +0100")
References: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
 <87k3bs5xc3.fsf@dell.be.48ers.dk> <20140317213619.GB3393@free.fr>
Message-ID: <877g7s5vta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,

 >> Is that really still an issue? I just checked a few of the machines I
 >> often do buildroot builds on and they all have /bin/sh == dash.

 > Some configure-y scripts will run with /bin/sh, but have bashisms in them.

 > It was reported on IRC by Andrew that switching the system shell from
 > dash to bash fixed an issue (Andrew, was that with libxml2?).

I don't think it is libxml2 as the stuff I'm currently doing at $WORK
uses libxml2 and I haven't seen any issues with /bin/sh = dash.


 >> > -# Check bash
 >> > -if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 >> > +# Check bash is the system shell
 >> > +if ! /bin/sh --version 2>&1 | grep -q '^GNU bash'; then
 >> 
 >> FYI, dash doesn't even understand a --version argument:

 > Yes, but it surely does not return something matching "^GNU bash" which
 > is all we care about.

True.

-- 
Bye, Peter Korsgaard
