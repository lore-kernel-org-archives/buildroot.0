From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:14:44 +0200
Subject: [Buildroot] [PATCH v2] pdbg: bump version to latest
In-Reply-To: <20171003121425.28490-1-joel@jms.id.au>
References: <20171003121425.28490-1-joel@jms.id.au>
Message-ID: <20171007231444.326c0a25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Oct 2017 22:44:25 +1030, Joel Stanley wrote:
> I got this error when attempting to build:
> 
>  aclocal: error: couldn't open directory 'm4': No such file or directory
> 
> So we now have the post patch hook to ensure the m4 directory is
> present.
> 
> In addition, the package now sets a variable with the Git SHA1 so that
> the binary contains the expected output for --version.
> 
> Specific configurations of uClibc cause a build failure in pdbg. This commit
> adds a patch to remove the definition of the offending macro (it is unused in
> the source).
> 
>  In file included from usr/include/stdio.h:71:0,
>                   from libpdbg/fake.c:17:
>  include/bits/uClibc_stdio.h:149:16: error: expected identifier or ?(? before ?;? token
>    void *__unused;    /* Placeholder for codeset binding. */
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Use $() and not ${} when referencing make variables
>  - Fix building with uClibc. I've also sent the patch upstream

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
