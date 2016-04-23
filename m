From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 23 Apr 2016 08:24:36 -0500
Subject: [Buildroot] [PATCH v2 1/1] overlay: Add archive-based (tar)
	rootfs overlays
In-Reply-To: <20160423055334.GA29136@xdna.net>
References: <1460693286-6245-1-git-send-email-camh@xdna.net>
 <CAFt09wMVqWepo-Ott0Y0nL45RnqoFy6tTunBP-OndgzEJoj_hw@mail.gmail.com>
 <20160423055334.GA29136@xdna.net>
Message-ID: <CAFt09wM_9KcZbU9pTCYb8mSC_yUK47=6+Ysks1D7+sa2_PMygg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam,

On Sat, Apr 23, 2016 at 12:53 AM, Cam Hutchison <camh@xdna.net> wrote:
> Matthew,
>
> Matthew Weber wrote:
>> Cam,
>>
>> On Thu, Apr 14, 2016 at 11:08 PM, Cam Hutchison <camh@xdna.net> wrote:
>> > Add a feature to extract tar archives into the target rootfs when
>> > building filesystem images. The archives are extracted inside the
>> > fakeroot used to build the filesystem images so that the ownership and
>> > permissions of files in the archive are preserved.
>> >
>> > This is useful when an external build process produces rootfs archives
>> > or software is supplied as an archive that need to be incorporated the
>> > generated rootfs.
>> >
>> > Configuration options are added to configure a list of paths to archives
>> > to be extracted, and to configure how many path components to strip from
>> > paths in those archives. It is not possible to configure a different
>> > number of components for different archives.
>>
>> Instead of this strip components option, would it be easier to
>> document the expected pathing for the tar?  If you could apply
>> specific strip values for each file, I think it would make sense to
>> have this option.  What is your scenario where this would be required?
>>  As all files would have to be the same to match whichever value is
>> used.
>
> I've added the strip components option to v2 of the patches as it was
> brought up in v1:
>   http://lists.busybox.net/pipermail/buildroot/2016-March/155397.html
>
> I personally don't have a use case for strip components as the overlay
> archives I am using come from a previous buildroot build, but I can see
> the possibility of needing to strip one component from archives if the
> rootfs overlay is contained within a named directory at the top level.
>

Thanks, missed that.  I'd agree with Peter about the post image
script.  For most of my use cases, we use the skeleton overlay and
permissions approach but I can see cases where a person needs to embed
another rootfs within a new rootfs build  (say containers).  However
even in that case, it would usually be locating rootfs images in
specific folders, not a whole filesystem archive which would be a use
case for the post image scripts.  Is your use case taking a rootfs and
overlaying it or a different set of application(s) maybe built out of
tree against the cross compiler?

-- 
Thanks,
Matt
