From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:42:44 +0200
Subject: [Buildroot] [PATCH 1/1] perl: only run finalize hook when
 necessary
In-Reply-To: <1437443964-1988-1-git-send-email-danomimanchego123@gmail.com>
References: <1437443964-1988-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20150721234244.6b861e3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon, 20 Jul 2015 21:59:24 -0400, Danomi Manchego wrote:
> The PERL_FINALIZE_TARGET always runs, even if perl is not installed.
> This results in errors from the find command when it fails to find
> anything, even when doing "make -s":
> 
> >>>   Finalizing target directory
> find: `...../output/target/usr/lib/perl5/': No such file or directory
> find: `...../output/target/usr/lib/perl5/': No such file or directory
> find: `...../output/target/usr/lib/perl5/': No such file or directory
> 
> This is not helpful for projects that do not select Perl.  Silence this
> by making the hook conditional on package selection.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/perl/perl.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
