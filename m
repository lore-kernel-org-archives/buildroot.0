From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 16:29:24 +0100
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <20150909171426.19f79d78@free-electrons.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>	<20150909154913.72954fbc@free-electrons.com>	<55F044FC.6040608@imgtec.com>	<20150909164526.4467be61@free-electrons.com>	<55F046E3.9040401@imgtec.com>
 <20150909171426.19f79d78@free-electrons.com>
Message-ID: <55F05054.5080907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/09/2015 04:14 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 9 Sep 2015 15:49:07 +0100, Vicente Olivert Riera wrote:
> 
>>> But in any case, if host-texinfo is no longer needed to build the ARC
>>> binutils, then indeed we can drop the host-texinfo dependency, and drop
>>> the host-texinfo package as well.
>>
>> Maybe this is the reason why host-texinfo is no longer needed:
>>
>> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=bba33ab1e0f7d2ebd8f8435f92ed12e2a3c558a4
> 
> Very possible indeed. But that would only fix the problem for release
> tarballs, as the commit log suggests. In binutils, we were depending on
> host-texinfo only for ARC, because for ARC, we are pulling the binutils
> sources from git, not from a release tarball.

well, for ARC we are also downloading a tarball:

https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/archive/arc-2015.06.tar.gz

But yeah, that tarball doesn't include the fixes introduced by that
commit. However, it includes an interesting comment in
bfs/doc/Makefile.{am,in} (the two files that commit patches):

# We do not depend on chew directly so that we can distribute the info
# files, and permit people to rebuild them, without requiring the makeinfo
# program.  If somebody tries to rebuild info, but none of the .texi files
# have changed, then nothing will be rebuilt.

Regards,

Vincent.

> 
> Best regards,
> 
> Thomas
> 
