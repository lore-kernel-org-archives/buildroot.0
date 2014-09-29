From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 29 Sep 2014 11:32:52 +0200
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <20140929111853.6881f323@free-electrons.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
 <20140929111853.6881f323@free-electrons.com>
Message-ID: <CAAXf6LXTaWD=4KrL3oF3Sy4dP+cFbX5fBK3LD7WACtRvuhxmqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 29, 2014 at 11:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Kantanu Kumar Mohapatra,
>
> On Mon, 29 Sep 2014 13:08:38 +0530, Kantanu Kumar Mohapatra wrote:
>
>> I am using customized uboot-tools 2010.03 and want to retain that. In 2014,
>> the tools selection is new, but I want to use the source code for
>> uboot-tools used in 2010.03, as this is having some changes. I want to get
>> the "fw_printenv" compiled with a "-D" flag.
>>
>> Can anyone please help me in this regard?
>
> Well, just add a patch in package/uboot-tools/ to make whatever change
> you want to the U-Boot source code used for your U-Boot tools.

As this change will not be upstreamable to buildroot, I would rather
recommend to use BR2_GLOBAL_PATCH_DIR, to not pollute the upstream
buildroot sources. See http://nightly.buildroot.org/#customize-patches

Best regards,
Thomas
