From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 12:00:23 +0200
Subject: [Buildroot] [PATCH v1] filemq: disable documentation generation
In-Reply-To: <1476739227-12396-1-git-send-email-ps.report@gmx.net>
References: <1476739227-12396-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161018120023.1dcb337e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 23:20:27 +0200, Peter Seiderer wrote:
> The parameter to disable asciidoc documentation generation changed from
> 'fmq_have_asciidoc' to 'filemq_have_asciidoc'.
> 
> Fixes [1], [2], [3]:
> 
>   File "/usr/bin/asciidoc", line 101
>     except KeyError, k: raise AttributeError, k
>                    ^
>   SyntaxError: invalid syntax
> 
> [1] http://autobuild.buildroot.net/results/5f0/5f0558235756419eff15b8e909b5d630712f5141
> [2] http://autobuild.buildroot.net/results/a23/a23d92b09dadc12b3753c951900e28fc19bd14cd
> [3] http://autobuild.buildroot.net/results/a45/a450ff5c6008ccf290a028e6eab7ff26369243e7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Remark: could not reproduce the original asciidoc error, but changing
> fmq_have_asciidoc to filemq_have_asciidoc prevents the call to
> asciidoc at all.
> ---
>  package/filemq/filemq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
