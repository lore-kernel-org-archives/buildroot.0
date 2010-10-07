From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Oct 2010 16:57:44 +0200
Subject: [Buildroot] Tentative conclusion on the libtool work
In-Reply-To: <20100928223652.6dc72083@surf>
References: <20100928223652.6dc72083@surf>
Message-ID: <20101007165744.490fca33@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Sep 2010 22:36:52 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> In my opinion, we should settle on a solution before mid-october, in
> order to merge it before the end of october and give us enough time
> for testing before the release at the end of november. Considering
> how much time Martin and Lionel have dedicated to this issue, I think
> that their respective work deserve some attention.

From the various comments on this list and discussions on IRC, it seems
that the consensus is that :

 *) We should merge Martin Banky's work, as it keeps the existing
    known-working approach and just extends it to support packages that
    have used libtool 2.2 to generate their libtool script.

    Peter, if you're ok, I can give some build tests to Martin's work
    and send you a pull request for it.

 *) We should upgrade our own libtool package to libtool 2.2, so that
    packages such as libgtk2 that needs to be autoreconf'ed *and* need
    libtool >= 2.2 can actually be autoreconf'ed.

    Lionel, would you mind preparing such a patch set ?

Do we agree on this solution ?

Ideally, it'd be nice to merge it within the next few weeks, at least
before the end of October, so that we can bump libgtk2 and have all
this in 2010.11.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
