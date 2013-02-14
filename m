From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 14 Feb 2013 09:11:30 +0100
Subject: [Buildroot] disable downloaded source cache
In-Reply-To: <511C16E2.4010105@mind.be>
References: <CAKAx1cjcxkBq67w_DV7sFK_Z+7X9+WkMuEkVWiswWgsq-Eskig@mail.gmail.com>
 <511C16E2.4010105@mind.be>
Message-ID: <CAKAx1cjXjZscmy-D8Fa0WDqt-GotQoavBMr_SCSOJZdnyEwcqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout and others,

On Wed, Feb 13, 2013 at 11:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13/02/13 17:14, Lionel Orry wrote:
>>
>> I am experimenting with the BR2_ROOTFS_OVERLAY feature which works
>> great for me to add my overlay before image creation.
>>
>> My overlay is versioned with git, and I would like however to allow
>> automatic synchronisation (pull or even clone, the repository is very
>> small) with my remote each time I simply do 'make'. The overlay
>> feature only copies a folder content, but does not allow updating the
>> source folder content from a site (I perfectly understand it is not
>> its purpose and the feature must be kept simple).
>
>
>  Like so often, my answer to this kind of thing is: wrap the call to
> buildroot in a script. I.e., write a script that updates the overlay (and
> any other custom package), regenerates the config from a defconfig, does
> whatever other required magic, then calls make, and maybe does some
> post-processing on the resulting images as well.
>
>  This makes it much easier to understand what happens than a totally hacked
> together xxx-overlay package.

Well I have a cleaner way actually that I used previously, which is to
use a ROOTFS_POST_BUILD build script that clones the repository and
'rsync' it on the target rootfs, I was mainly wondering if I could
achieve the same using the ROOTFS_OVERLAY feature. It seems it's not
enough for my needs, so I will actually stick to my previous
ROOTFS_POST_BUILD script and forget about ROOTFS_OVERLAY.

Thanks for your hints anyway, and keep up the good work everybody.

>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Best regards,
Lionel
