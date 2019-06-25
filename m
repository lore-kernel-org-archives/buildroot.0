From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2019 22:10:31 +0200
Subject: [Buildroot] [PATCH 18/19] autobuild-run: define output
 directory as part of Builder class
In-Reply-To: <20190621084730.16411-18-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-18-itsatharva@gmail.com>
Message-ID: <88e22964-b761-eb7b-7c6d-0f7e79c6dbbb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2019 10:47, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 86 ++++++++++++++++++++-----------------------
>  1 file changed, 39 insertions(+), 47 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index f9e2414..5f0fd0a 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -294,6 +294,11 @@ class Builder:
>          self.idir = "instance-%d" % self.instance
>          self.srcdir = os.path.join(self.idir, "buildroot")
>          self.dldir = os.path.join(self.idir, "dl")
> +        # We need the absolute path to use with O=, because the relative
> +        # path to the output directory here is not relative to the
> +        # Buildroot sources, but to the location of the autobuilder
> +        # script.
> +        self.outputdir = os.path.abspath(os.path.join(self.idir, "output"))

 Unlike the previous patches, this one does not simply make outputdir part of
the Builder class. Indeed, some instances of outputdir were made absolute and
some were not.

 So the commit message should explain this difference, why it is necessary, and
why it is OK for the cases where the abspath was absent.

 Regards,
 Arnout

[snip]
