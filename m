From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:16:57 +0200
Subject: [Buildroot] [PATCH] package/dosfstools: introduce sanitation
 step during install
In-Reply-To: <CAGt4E5uynqGo1Th2PB8Wq3-JKSYbcR+Drc3AuarUPKPivmeYJw@mail.gmail.com>
 (Markus Mayer's message of "Wed, 29 May 2019 19:49:59 -0700")
References: <20190529182716.12080-1-mmayer@broadcom.com>
 <931fdea6-0e1b-0074-1b14-df0c6a29f899@mind.be>
 <CAGt4E5uynqGo1Th2PB8Wq3-JKSYbcR+Drc3AuarUPKPivmeYJw@mail.gmail.com>
Message-ID: <87tvdb1tba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

Hi,

 >> However, I'm wondering... dosfstools only installs things in /sbin,
 >> /usr/share/man and /usr/share/doc. The latter two get deleted in
 >> target-finalize. Wouldn't it be a lot easier then to manually install the
 >> programs we need to sbin, instead of installing everything and removing what is
 >> not needed?

 > I had that first, actually. But then I was thinking that would
 > duplicate the install logic (or at least a part of it) in the package
 > makefile. It is unlikely, but it could lead to some unexpected
 > dependencies between upstream tar-ball and Buildroot makefile after an
 > update of dosfstools. But maybe that isn't a big problem or there
 > wouldn't be any more of a dependency than with the approach above.

 > I'm open to either approach. Does anybody have any thoughts one way or another?

Manually installing the specific binaries we want seems like the
simplest / clearest option to me.

Care to send a patch doing that? Thanks!

-- 
Bye, Peter Korsgaard
