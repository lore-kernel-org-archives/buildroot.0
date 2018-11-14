From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 14 Nov 2018 10:29:07 +0100
Subject: [Buildroot] [PATCH] imx-uuc: bump revision to 79e9798e
In-Reply-To: <20181113220810.3f4c3cba@windsurf>
References: <20181112094402.1815-1-gary.bisson@boundarydevices.com>
 <20181113220810.3f4c3cba@windsurf>
Message-ID: <CAAMH-yvtQmrzSu4NYeM6O7T2y+9QB3AWXENt6GFsiHp5nJk7cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Nov 13, 2018 at 10:08 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Gary,
>
> On Mon, 12 Nov 2018 10:44:02 +0100, Gary Bisson wrote:
> > Main changes:
> > - fix build error by gcc 8.2
>
> I know it is what the upstream commit says, but the makedev() issue has
> nothing to do with gcc 8.2, but with glibc 2.28. I fixed up the commit
> log on that aspect.

Thanks, I actually didn't even dig deeper once I saw that this commit
was fixing the exact same error.

> To be honest, I hesitated a bit because we normally don't take version
> bumps in master at this point. However, this is a fairly small
> and not that widely used package, the number of upstream changes is not
> enormous, so I applied it to master. But I really hesitated with asking
> for just a backport of the glibc 2.28 fix instead.

I understand, but note that there are a couple of other patches in
that bump that also fix some other possible build issues (although the
titles aren't very useful):
e05cc55 fix build error when gcc over 7.0
7c7562b fix build error

So really a version bump seemed like the easy route instead of
backporting all those patches.
But I understand it isn't ideal at this stage of the 2018.11 release.

Regards,
Gary
