From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:02:33 +0100
Subject: [Buildroot] [scanrock 4/5] lua*: regeneration of Config.in
In-Reply-To: <20181021163259.28335-5-francois.perrad@gadz.org>
References: <20181021163259.28335-1-francois.perrad@gadz.org>
 <20181021163259.28335-5-francois.perrad@gadz.org>
Message-ID: <4adc1ea5-da35-1339-71b9-28a5f15d0803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/21/18 5:32 PM, Francois Perrad wrote:

 As usual, commit message is missing. Please describe at length what you did
manually.

 It looks like a whole lot is indeed done manually, so it's probably better to
do one patch per package in case there are manual fixups (and do the three
things in that one patch), and then a final patch that handles the rest in batch.

[snip]
> diff --git a/package/argparse/Config.in b/package/argparse/Config.in
> index d207b0482..f8e71a0cd 100644
> --- a/package/argparse/Config.in
> +++ b/package/argparse/Config.in
> @@ -1,10 +1,6 @@
>  config BR2_PACKAGE_ARGPARSE
>  	bool "argparse"
>  	help
> -	  Argparse is a feature-rich command line parser for Lua
> -	  inspired by argparse for Python. Argparse supports
> -	  positional arguments, options, flags, optional arguments,
> -	  subcommands and more. Argparse automatically generates
> -	  usage, help and error messages.
> +	  A feature-rich command-line argument parser

 No, this is not good. You can't replace a nice, well-formatted, extensive help
text with a one-line string. Indeed it's all we get from the rockspec, but it
should really be an entire paragraph like it was.

 So if you want to use the scanrock script to assist in upgrading, you'll have
to find a way to preserve what is there already.

 Also, please add scanrock to add a . at the end of the sentence if it is missing.

[snip]

 Regards,
 Arnout
