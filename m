From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 3 Sep 2014 16:20:46 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: Improve lib
 subdirectory matching
In-Reply-To: <20140903154119.5f501095@free-electrons.com>
References: <1409750954-3636-1-git-send-email-byj.tea@gmail.com>
 <20140903154119.5f501095@free-electrons.com>
Message-ID: <CAAXf6LXR35yNWS15y1MYT66M3h_1WC6dipO+wy_C9XV1Vh9CFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 3, 2014 at 3:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bai Yingjie,
>
> On Wed,  3 Sep 2014 21:29:14 +0800, Bai Yingjie wrote:
>> Some external toolchain provides lib32-fp which supports FPU instructions
>> as well as lib32 in sys-root/usr, but lib32-fp can't be matched and
>> in consequence causes a compile error.
>>
>> The toolchain in this case is OCTEON mips64 toolchain, and the CFLAGS
>> cause the issue is -march=octeon3.
>>
>> This patch improves the matching by accepting lib(32|64)?([^/]*)? as lib
>> name.
>>
>> Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
>
> Thanks for this contribution! Is this toolchain available publicly? The
> problem I have is that if the toolchain is not available, then we have
> no way to test if future changes to the external toolchain logic will
> not break the support for this toolchain.

The mentioned toolchain comes from Cavium Networks. You can find a
public version of this toolchain here:
http://www.cnusers.org/index.php?option=com_remository&Itemid=32&func=select&id=62

I don't think that this public toolchain is 100% identical to the one
given to their (paying) customers, but I assume that the lib32-fp
issue is the same.

Best regards,
Thomas
