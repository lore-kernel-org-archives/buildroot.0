From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:26:27 +0200
Subject: [Buildroot] [PATCH] docs/manual: document both user-facing
 br2-external variables
In-Reply-To: <1476910565-11293-1-git-send-email-yann.morin.1998@free.fr>
References: <1476910565-11293-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161019232627.3e009bce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 22:56:05 +0200, Yann E. MORIN wrote:
> While BR2_EXTERNAL_<NAME>_PATH was already documented, it was not
> made obvious that it could be reused in post-biuld, post-image and
> in-fakeroot scripts.
> 
> The BR2_EXTERNAL_<NAME>_DESC variable was not documented at all.
> 
> Update the manual to fix this.
> 
> Note: a2x chokes on this:
> 
>     .Note:
>     Both +BR2_EXTERNAL_$(NAME)_PATH+ and +BR2_EXTERNAL_$(NAME)_DESC+ are
>       available [...]
> 
> and spits out a totally useless error message:
> 
>     a2x: ERROR: "xsltproc" --stringparam toc.section.depth 1 --stringparam
>     callout.graphics 0 --stringparam navig.graphics 0 --stringparam
>     admon.textlabel 1 --stringparam admon.graphic 0 --stringparam
>     chunk.section.depth 0 --output "/home/ymorin/dev/buildroot/O/docs/manual/manual.html"
>     "/etc/asciidoc/docbook-xsl/xhtml.xsl"
>     "/home/ymorin/dev/buildroot/O/docs/manual/manual.xml" returned
>     non-zero exit status 6
> 
> So, we had to resort to using different quoting styles for each
> variables. They are not semantically equivalent, but the rendering
> is the same with the default CSS (which we are using). That's gonna
> be good-enough for now...
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  docs/manual/customize-outside-br.txt | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
