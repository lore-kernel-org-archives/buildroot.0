From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 16:04:04 +0200
Subject: [Buildroot] [PATCH] .gitignore: ignore output*
In-Reply-To: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
References: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171021160404.579c29af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 10:01:08 -0400, Ga?l PORTAY wrote:
> During development, it is often practical to have many output
> directories.  The output directory is easily specified with O=<output>
> though is it useful to have a convention of 'output...' e.g.
> "output-rpi", "output-rpi2", and "output-rpi3-64".
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  .gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f572..ec5768d053 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,4 +1,4 @@
> -/output
> +/output*

Not sure this is a good idea, it kind of makes an assumption on how
people would name their output directories.

If you're annoyed by your output directories, use make O=../output-rpi2
instead of make O=output-rpi2, and that's it :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
