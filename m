From: Christian Stewart <christian@paral.in>
Date: Thu, 26 May 2016 23:10:04 +0000
Subject: [Buildroot] [PATCH v3 2/3] docker-containerd: new package
In-Reply-To: <20160526212958.36eeac5e@free-electrons.com>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-3-git-send-email-christian@paral.in>
 <20160526212958.36eeac5e@free-electrons.com>
Message-ID: <1464304204705-da41a52d-bea02d9c-e4cbd229@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Thu, May 26, 2016 12:29 PM, Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote: > Thread dependency or not?
Yes, added comment + dep as with runc.
> So runc is really a build-time dependency?
Only if I copy runc to docker-runc, but given it's a symbolic link, I removed
this in the next version.
If I use an absolute path to make the symbolic link, will this cause problems on
the target device?

> No need for the &&, make these independent commands.
If I do this, I will need to duplicate the env statement as well as the cd.
And no, it's not possible to specify an absolute path to build. This produces
this kind of error:

can't load package: package
/home/paralin/Documents/skiff/workspaces/default/output/build/docker-containerd-v0.2.1/ctr:
import
?/home/paralin/Documents/skiff/workspaces/default/output/build/docker-containerd-v0.2.1/ctr?:
cannot import absolute path
Other than that, will apply these changes and respin.
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160526/4d116b1b/attachment.html>
