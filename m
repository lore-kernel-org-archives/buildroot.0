From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 16:18:10 +0200
Subject: [Buildroot] Can we still opt to shallow clone in git?
In-Reply-To: <CABKM0pBVG=JptKYBv-dRfhwAkmKCQm09sqLaG44jUyZhE2gPaw@mail.gmail.com>
References: <CABKM0pCD6pJ3-o9OyhGfpkRyk4cVsKhc+AwqojkzzRvnJvvUSQ@mail.gmail.com>
 <20180607084112.347c5203@windsurf>
 <CABKM0pBVG=JptKYBv-dRfhwAkmKCQm09sqLaG44jUyZhE2gPaw@mail.gmail.com>
Message-ID: <20180607161810.365544bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot mailing list in Cc. Thanks!

On Thu, 7 Jun 2018 22:03:13 +0800, qlb1234 wrote:

> In my use case, using whatever is in a branch is still useful. I don't know
> if you or someone else removed it on purpose or unintentionally. Say if I
> provide a patch that brings back this feature, will you consider accepting
> it?

Using branch names as versions for Git-fetched packages was never
supported. Because:

 (1) It breaks the principle of reproducibility: the state of the
     source code you will build depends on when you do the build.

 (2) It doesn't do what you expect, because Buildroot will cache in
     DL_DIR a tarball named <package>-master.tar.gz, and will never
     re-fetch from the Git repository. To force it to refetch, you have
     to manually remove this cached tarball.

See also the thread at
http://lists.busybox.net/pipermail/buildroot/2018-June/222961.html,
where we have been discussing exactly this topic a few days ago.

I still think there are some useful use cases for this, and that we
should support it somehow, but it's not clear how it should be done yet.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
