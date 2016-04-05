From: Aleksandar Simeonov <aleksandar@barix.com>
Date: Tue, 5 Apr 2016 09:24:50 +0200
Subject: [Buildroot] [PATCH 4/4 v2] core/pkg-infra: download git
 submodules if the package wants them
In-Reply-To: <20160404210441.GA3500@free.fr>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
 <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
 <CAFt09wNKtUSyEcQzL1o+p+f5m_bPwctndV8OKrQOXBqQBmsCpQ@mail.gmail.com>
 <5702440F.5030707@barix.com> <20160404210441.GA3500@free.fr>
Message-ID: <57036842.7060408@barix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 4/4/16 11:04 PM, Yann E. MORIN wrote:
> Aleksandar, All,
>
> On 2016-04-04 12:38 +0200, Aleksandar Simeonov spake thusly:
>> Have you checked that this patch does not affect the download of packages
>> not using GIT? For me it breaks the download of anything using WGET, for
>> example dosfstools:
> Yes, I just retried right now, and I can at least download packages
> using:
>    - wget (gcc, binutils... and dosfstools)
>    - mercurial (eigen)
>    - git with no submodules (opkg)
>    -git with sub-modules (a local package to test submodules)
>
> and they all downloaded fine, especially dosfstools:
>
>   

It was failing on all packages-not only on dosfstools. But it was my 
fault, I was applying your v2 fixes not in the correct way, so it was 
failing on whatever package comes next to download. I have re-downloaded 
them from the link you have posted, and applied them on top of 
2cd5abf7f9edd3c0a609e9626f12f71e2a6e4e7c as Mathew has explained, and 
now all works fine.

>
>>>>> dosfstools 3.0.28 Downloading
>> BACKEND=wget
> We have nothing in Buildroot that outputs this "BACKEND" string.

This was a debug message I have added
> However, what you report is probably due to somthing else. Have you 
> applied on top of local changes? Can you reproduce the error without 
> this patchset? Regards, Yann E. MORIN. 

No, without the patchset works perfectly, With it-as well :) Sorry about 
the noise, I was not a member of the maillist, so my reply did go only 
to Mathew Weber. Now should be fine.

Great work, thank you all!

Cheers,

Alex
