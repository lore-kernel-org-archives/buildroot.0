From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Thu, 23 Nov 2017 08:33:40 -0800
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171123092152.0f0fac4a@windsurf.lan>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
 <20171122213336.52a3e196@windsurf.lan>
 <CAAkeqgXEXtnppmJVrfRgf_uC3CeX4TunJS-CQ+=sRG+ZBR+-Ag@mail.gmail.com>
 <20171122224412.1543e00d@windsurf.lan>
 <CAAkeqgVVYW4BZ6tUH20Guxdgz3qay6D4nj+Jz9F5eT6Kn-Ygjg@mail.gmail.com>
 <20171123092152.0f0fac4a@windsurf.lan>
Message-ID: <CAAkeqgUcbovvL_UdE998gZw2OtpTVywB4BerE=qOUXswc6+1mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 23, 2017 at 12:21 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 22 Nov 2017 18:11:12 -0800, Andrey Yurovsky wrote:
>
>> > Isn't that specific to your RAUC use case? I assume other people can
>> > use RAUC without using signed squashfs images.
>> >
>> > So perhaps we shouldn't make host-mksquashfs a mandatory dependency
>> > like your patch does?
>>
>> No, that's just how rauc works, there's no other use case. That is, it
>> always make a signed squashfs image (there's no option to make
>> unsigned images or any other format). If mksquashfs isn't present, the
>> host tool is effectively useless since it can't make bundles, that's
>> why I feel that it's a run-time dependency and needs to be selected.
>
> OK, thanks for the explanation! Is this dependency new in 0.2, or it
> was already needed for the current 0.1.1 version of RAUC ?

It was there in 0.1.1 as well, unfortunately I missed it when I sent
the original patch because my systems had mksquashfs available and I
didn't catch this until later so I was hoping to correct it now. The
0.2 changes are described here:
https://github.com/rauc/rauc/blob/master/CHANGES and are mainly bug
fixes and minor (though certainly worthwhile) improvements.
