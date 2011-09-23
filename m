From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 23 Sep 2011 08:27:24 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
 tarball, git and patch dir
In-Reply-To: <87d3es1he8.fsf@macbook.be.48ers.dk>
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
 <201109221920.37170.arnout@mind.be>
 <87d3es1he8.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LU7pHVFm8vexDJrw_2kWT0KAS-J-saG07qRs-xn8iwrgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 22, 2011 at 9:55 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> ?Arnout> On Saturday 17 September 2011 22:23:08, Jean-Christophe PLAGNIOL-VILLARD
> ?Arnout> wrote:
> ?>> +config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
> ?>> + ? ? ? string "custom patch dir"
> ?>> + ? ? ? help
> ?>> + ? ? ? ? If your board requires custom patches, add the path to the
> ?>> + ? ? ? ? directory containing the patches here. The patches must be
> ?>> + ? ? ? ? named barebox-<version>-<something>.patch.
> ?>> +
> ?>> + ? ? ? ? Most users may leave this empty
>
> ?Arnout> ?Do people often use buildroot this way? ?I always make a
> ?Arnout> project-specific branch of the buildroot tree and drop any
> ?Arnout> patches directly in there.
>
> I need to support a bunch of projects at work, so I keep them all in a
> seperate repo (which gets synced with mainline buildroot ever so
> often. Bootloader and kernel are likewise in (shared) local repos.
>

Of the approaches described above, I prefer Thomas' one: use the
board/<company>/<project>/ directory for such patches. But are these
patches automatically detected and applied by buildroot?

The advantage of this approach is that if you have multiple related
projects, you do not need two separate buildroot repos or branches.
For example, in my case, we could have two different boards with
different CPU architectures, both using a same buildroot platform (of
course with different configurations). Some of the patches may be the
same, but some will be different, and then the board/ directory would
be a logical place.

-Thomas
