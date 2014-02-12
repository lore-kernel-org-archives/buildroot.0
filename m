From: Mike Zick <minimod@morethan.org>
Date: Wed, 12 Feb 2014 16:15:18 -0600
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FBEE79.9070901@mind.be>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr>
 <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com> <52FBEE79.9070901@mind.be>
Message-ID: <20140212161518.75ac8839@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Feb 2014 22:58:17 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > It appears that the directory is created by the bit of
> > structure using IMX_LIB_EXTRACT_CMDS, and the warning
> > message is from a 'mkdir' embedded within the self-extracting
> > package.
> > 
> > I could 'rm' the directory inside IMX_LIB_EXTRACT_CMDS,
> > but it's not clear that this is the right thing to do.  
> 
>  The directory exists already because the buildroot infrastructure
> creates some stamp files in it - e.g. .stamp-downloaded. So if you'd
> remove the directory, the download will be retried...
> 
>  Therefore, I think we should just live with the warning.
>

Perhaps alias "mkdir" to "mkdir -p" for the duration of the commands?

Mike
