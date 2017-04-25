From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 25 Apr 2017 12:07:55 -0500
Subject: [Buildroot] uboot-tools autobuild failures
In-Reply-To: <CAOMZO5D8cXv4+TF=kXMwE5_YE_mCKMhgjS+PCAbSkKHkewzSjA@mail.gmail.com>
References: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
 <CAOMZO5D8cXv4+TF=kXMwE5_YE_mCKMhgjS+PCAbSkKHkewzSjA@mail.gmail.com>
Message-ID: <CANQCQpb5_1uO+TR6X6Mk6XFW0HBV1f5b6zVvd0BF=yOOOjTT3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio

On Sun, Apr 23, 2017 at 6:44 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Matthew,
>
> On Wed, Apr 19, 2017 at 10:55 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> It looks like all of these recent failures are because the python swig
>> build does a "$(if $(shell which swig 2> /dev/null),_libfdt.so)" to
>> determine if the host system has swig and if so, try to build the
>> python bindings.  Obviously not taking into account any prefix we'd
>> provide to the host/ in out build.
>>
>> http://autobuild.buildroot.org/?reason=uboot-tools-2017.03
>>
>> I don't directly have a need for those bindings, would a patch that
>> disables this swig detect be reasonable at this point?  Other option
>> would be to rewrite how they're doing it to search a prefix path vs
>> using the shell's which.  Then work upstreaming of that change.
>
> U-Boot mainline has a fix for this already:
> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=9963890b8be1d208035945abc5ba9f77637b6542
>
> My host PC does not have Python 3, so I cannot reproduce this error myself.
>
> Could you please try the attached Buildroot patch?

No luck, same error.  I did notice this seems to be impacted by -j level.

Matt
