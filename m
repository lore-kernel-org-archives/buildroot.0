From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 12 Sep 2013 10:08:12 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: detect missing patches
In-Reply-To: <20130911120630.GA14745@harvey.netwinder.org>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
Message-ID: <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ralph,

On Wed, Sep 11, 2013 at 2:06 PM, Ralph Siemsen <ralphs@netwinder.org> wrote:
> Hi Thomas,
>
> Sorry for delayed response.
>
> On Thu, Sep 05, 2013 at 09:20:36PM +0200, Thomas De Schampheleire wrote:
>>
>> Would you mind sending a second patch that changes the 'unknown patch
>> format' case so that an error is thrown?
>
> I've added it. Note that it is possible to fool this check, by using
> for example a name like mydiff.patch.zzz. This matches "*.patch*" and
> therefore is allowed, even though we don't know how to deal with ".zzz".

True, I think this is something we cannot fix.
Some patches in the tree are named .patch.avr32, or
.patch.conditional, but they are in the regular patch format so should
be accepted by apply_patches.sh.

>
>> Additionally, in your current patch, I would suggest changing the 'if
>> test ...' into 'if [ ... ], for the sake of lining up with the style
>> in the rest of the script.
>
> Also done. Revised patch follows.

If you send a patch, the general format is:

commit message
--- (three dashes)
any other comments _not_ in the commit message

actual patch (diff --git ...)


The mail you sent is in the format:
other comments
commit message
actual patch

and this cannot be applied as such. Also, it makes the patch less
visible than in a separate mail.
So, please send it again, and put 'PATCH v2' in the subject line, so
it's easy to keep track of the different versions.

Thanks a lot,
Thomas
