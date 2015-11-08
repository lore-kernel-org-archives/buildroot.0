From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 8 Nov 2015 17:08:43 +0100
Subject: [Buildroot] [PATCH 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <1924419.qtieCN8KUx@sagittea>
References: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
 <2787793.hk6j5KppJf@sagittea>
 <CAAMH-yt31Y9Ez8Stjv8G_j63GvwC6Csc3NX8SK=1OSPaZLSGpA@mail.gmail.com>
 <1924419.qtieCN8KUx@sagittea>
Message-ID: <CAAMH-yvbFV0i_RfRu91apJRbz4TQ3DYCr8bB4ERKQ4afPtZ5zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Fri, Oct 30, 2015 at 11:43 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> On Friday 30 October 2015 11:36:21 Gary Bisson wrote:
>> Hi Jerome,
>>
>> On Fri, Oct 30, 2015 at 11:27 AM, J?r?me Pouiller <jezz@sysmic.org>
> wrote:
> [...]
>> > A POST_INSTALL_STAGING_HOOKS is not necessary for libfslparser?
>>
>> No, libfslparser is only needed by gst-fsl-plugins which looks for the
>> libs at the right location at build time (usr/lib/imx-mm).
>>
>> The staging hook is needed for libfslcodec since it is used by both
>> gst-fsl-plugins and gst1-imx (not looking at the imx-mm path at build
>> time).
>>
>> Although it might have been more consistent to have the staging hook
>> in both, I chose to reduce the patch as much as possible. Plus I'm not
>> sure people will like my symlink approach in the staging directory.
> IMHO, target/ should be a subset of staging/ (even if today, this is far
> from  the case). So, I would prefer to also create symlinks in staging/.

So I'm ok with adding the symlinks to the fslparser staging as well.
But if we'd really like to have target as a subset of staging,
shouldn't we use symlinks for the target too?

Regards,
Gary
