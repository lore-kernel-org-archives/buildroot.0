From: Shlomi Vaknin <shlomi.39sd@gmail.com>
Date: Sat, 10 Oct 2020 21:08:42 +0300
Subject: [Buildroot] [PATCH v3 4/4] configs/stm32mp157c-dk2: add support
 for wifi
In-Reply-To: <181128db-472e-a47c-74ac-9a01d18665da@grinn-global.com>
References: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
 <20201007144945.1697081-4-shlomi.39sd@gmail.com>
 <15798cdd-e335-a291-53d4-1ac03d1bbd6c@grinn-global.com>
 <e9f06c52-191f-887b-2d8e-4d76acb277d0@grinn-global.com>
 <CALxJ29RjdYFrkX9B+dQ8xi7LhGaCCVXRVWz-b6+hQw_oy1Qidg@mail.gmail.com>
 <21173a82-a49b-f89f-8530-2f86656bc285@grinn-global.com>
 <CALxJ29SkXuxpJmNyCO61aF_ur+fL_4tQ-NFiZuDEg8aZSOA9og@mail.gmail.com>
 <efe16945-0124-b38a-0546-c135755d3cce@grinn-global.com>
 <CALxJ29QfbGjQwELFeaKdBhdPbFRjyB=31S3oU8uU1KzCnsYFvw@mail.gmail.com>
 <181128db-472e-a47c-74ac-9a01d18665da@grinn-global.com>
Message-ID: <CALxJ29QzYHOVoc812jGmzUmn2qSGKzxMkLFT_UOU+wCYghy1cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I still don't know why it works only for me, but I discovered the
following: st doesn't use the firmware from the official linux-firmware
repo. They are using the firmware from Murata github. In addition, the
nvram file that I supplied was copied from st, which means that it matches
the murata firmware they use. So I suggest the following:

1. Take the nvram file from the official linux-firmware repository (worked
for me as well). Btw, should it be installed by default by the
linux-firmware package?
2. Use more recent firmware from murata.

I would be happy if you can test these. Do you have another idea or
something that I can try by myself?

Thanks,
Shlomi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201010/102035f2/attachment.html>
