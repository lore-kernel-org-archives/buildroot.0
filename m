From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 14 Oct 2012 12:12:23 -0400
Subject: [Buildroot] [PATCH 12/13] target/generic: add filesystem
	overlay option
In-Reply-To: <507AB5AD.6030307@mind.be>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231448.17317.37653.stgit@localhost>
 <CANxTyt6dH8173xfa1nfN2CaXspSMiZcwMgVna4c4FL9-0ziNkg@mail.gmail.com>
 <507AB5AD.6030307@mind.be>
Message-ID: <CANxTyt4bQo-nAJ5rNvufapT00QJgkP9Xnc5-6CZJB-rtrmq=5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 14, 2012 at 8:53 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 14/10/12 02:39, Danomi Manchego wrote:
>
>> However, we still make use of the custom target skeleton feature.
>>  Basically, we wanted to keep our initial skeleton in
>> our project directory with our overlays, rather than hack up the default
>> skeleton that comes with buildroot.  Also, we
>> wanted to avoid having to maintain a list of files installed by the
>> default skeleton that then need to be deleted in a
>> post-build script.
>>
>> (The truth is that we use our custom skeleton both as the initial custom
>> skeleton that gets copied during the beginning
>> of the process, and as an overlay that gets copied at the end of the
>> process, so that no package-installed scripts
>> take precedence over our customized target skeleton files.)
>>
>> So I still see use, at least for us, for a custom skeleton.  No?
>>
>
>  If you need to remove files from the default skeleton, then there's
> something
> wrong with the default skeleton.  Now I take a second look, indeed there's
> a lot
> in there that is unneeded, e.g. .bash_profile if no bash is installed...
>

Maybe saying that the files "need to be deleted" was too strong.  I didn't
really distinguish between "need to be deleted" versus "files that are
unneeded and potentially confusing to others by their presence".  Anyway,
thanks for agreeing to un-deprecate.

Danomi -



>
>  So I'll un-deprecate the custom skeleton in the next round.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121014/141257eb/attachment.html>
