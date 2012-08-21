From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Tue, 21 Aug 2012 16:51:07 +0100
Subject: [Buildroot] BR2_SOURCEFORGE_MIRROR issue in package .mk files
Message-ID: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was rebuilding my Buildroot when I noticed that the
kent.dl.sourceforge.net mirror is down and my build fails.

I encountered this same problem the other day with crosstool-ng, and
soon afterwards a patch was posted:
http://sourceware.org/ml/crossgcc/2012-08/msg00066.html

I looked at changing BR2_SOURCEFORGE_MIRROR but unfortunately
Buildroot only allows BR2_SOURCEFORGE_MIRROR to replace *part* of the
Sourceforge URL

e.g. in buildroot/package/boost/boost.mk:
BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost

Should it be changed to:
http://$(BR2_SOURCEFORGE_MIRROR).sourceforge.net/sourceforge/boost

Comments?

regards,

Aras Vaichas
