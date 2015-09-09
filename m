From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 17:14:26 +0200
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <55F046E3.9040401@imgtec.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150909154913.72954fbc@free-electrons.com>
 <55F044FC.6040608@imgtec.com>
 <20150909164526.4467be61@free-electrons.com>
 <55F046E3.9040401@imgtec.com>
Message-ID: <20150909171426.19f79d78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 9 Sep 2015 15:49:07 +0100, Vicente Olivert Riera wrote:

> > But in any case, if host-texinfo is no longer needed to build the ARC
> > binutils, then indeed we can drop the host-texinfo dependency, and drop
> > the host-texinfo package as well.
> 
> Maybe this is the reason why host-texinfo is no longer needed:
> 
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=bba33ab1e0f7d2ebd8f8435f92ed12e2a3c558a4

Very possible indeed. But that would only fix the problem for release
tarballs, as the commit log suggests. In binutils, we were depending on
host-texinfo only for ARC, because for ARC, we are pulling the binutils
sources from git, not from a release tarball.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
