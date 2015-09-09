From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 16:29:00 +0200
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <CA+BsyQ4j5udg-jsL-A7Spm6jiDtxfaN4sTF1_MYdbFD7XB8rYQ@mail.gmail.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150909154913.72954fbc@free-electrons.com>
 <CA+BsyQ4j5udg-jsL-A7Spm6jiDtxfaN4sTF1_MYdbFD7XB8rYQ@mail.gmail.com>
Message-ID: <20150909162900.48b3421e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Wed, 9 Sep 2015 14:58:22 +0100, Brendan Heading wrote:
> > Maybe we could do a similar thing for the binutils package (which is
> > the only other user of the host-texinfo package), and then remove the
> > host-texinfo package altogether. That's obviously a completely separate
> > set of changes.
> 
> Why not keep host-texinfo around, even if it is not used by any
> package which is included with buildroot ?

Because we don't like to have host packages that are not used by any
other target packages, as this means this host package is never tested.

This is something that is discussed quite often, recently for the
python-colorama package. I sometimes change my mind a bit on this, it's
hard to be completely clear-cut. For python-colorama, the submitter
came with a potentially interesting use case.

For host-texinfo, if there's nothing that depends on it in Buildroot,
we should simply drop it I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
