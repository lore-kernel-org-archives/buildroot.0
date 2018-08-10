From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:51:23 +0200
Subject: [Buildroot] [PATCH 4/6] support/testing: runtest proxy support
In-Reply-To: <20180711143113.11927-5-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-5-matthew.weber@rockwellcollins.com>
Message-ID: <20180810225123.0f70cfcc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jul 2018 09:31:11 -0500, Matt Weber wrote:
> Allow builder.py to inherit the system proxy settings from
> the env if they are present.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I have applied to next, but I have one question below.

> ---
>  support/testing/infra/builder.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index faf1eb1494..30230fdb17 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -35,6 +35,12 @@ class Builder(object):
>  
>      def build(self):
>          env = {"PATH": os.environ["PATH"]}
> +        if "http_proxy" in os.environ:
> +            self.logfile.write("Using system proxy: " +
> +                               os.environ["http_proxy"] + "\n")
> +            self.logfile.flush()

Is this flush() really needed ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
