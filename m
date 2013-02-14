From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Feb 2013 19:04:30 -0600
Subject: [Buildroot] [PATCH] add pre-build script
In-Reply-To: <511C1281.5040502@mind.be>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
Message-ID: <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Feb 13, 2013 4:28 PM, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>
> On 13/02/13 14:54, Joe Halpin wrote:
>>
>> This is a patch to add a pre-build script, which runs before the build
>> starts. This lets us setup symlinks and such before the build starts,
>> which makes things easier and cleaner for us. Maybe it will for other
>> people too. This was made from the 20.12.11 release.
>
>
>  Could you clarify a bit more what the use case is? Then we can consider
if there are maybe better ways to achieve it.
>
>
>  Also, a properly formatted patch has a commit message which is formatted
as follows: a single summary line of max. 80 characters, an empty line, one
or more paragraphs explaining why the patch is necessary, your
Signed-off-by line, a line containing three dashes, the patch changelog (if
you resubmit it). Look at other patches on the list for examples. And you
should send the patch with git send-email or similar, so that whitespace is
retained and we can comment in-line.
>
>
>  Regarding the patch itself: why do you pass $(TARGET_DIR) as an
argument? Since the 'dirs' step comes after the 'prepare' step,
$(TARGET_DIR) doesn't exist yet...
>
>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I have a use case for this.  In Microblaze builds, it would be nice to
generate optimal cflags from the dts/mhs for use in all software.  This
could be accomplished by a pre script.

Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130213/a2cd0333/attachment-0001.html>
