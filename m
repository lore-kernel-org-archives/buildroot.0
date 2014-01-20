From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 21:37:30 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
	January 19)
In-Reply-To: <20140105171702.GC16066@free.fr>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
 <20140105162014.GA16066@free.fr> <20140105171702.GC16066@free.fr>
Message-ID: <CAAXf6LVP6OkzizTdx1GV8wc1vOUBr6Q9eRVQY7dYvK=14qj7=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jan 5, 2014 at 6:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, Floris, All,
>
> On 2014-01-05 17:20 +0100, Yann E. MORIN spake thusly:
>> On 2014-01-05 17:01 +0100, Thomas De Schampheleire spake thusly:
>> > Here is the session 5 of the patchwork cleanup.
> [--SNIP--]
>> > [1/2] makebootfat: new package
>> > Floris Bos <bos@je-eigen-domein.nl>
>> > http://patchwork.ozlabs.org/patch/213112
>>
>> I'm not sure we need that one. We already have:
>>   - host-dosfstools to generate (empty) fat filesystems in a image file;
>>   - host-mtools to add files to a fat filesystem, and it works with
>>     image files.
>
> It seems I've spoken a bit fast on that one. There's one thing this
> package provides that is not provided by dosfstools or mtools: an MBR
> bootcode.
>
> However, we already have syslinux, which does provide an MBR bootcode.
> It's currently not installed; it's just a matter of adding one more
> option to syslinux, to install its MBR bootcode.
>
> So, my previous position still stands: we already have the required
> packages; no need to duplicate what we already have.

For me this conclusion is fine.
There is a second patch in that same series:
http://patchwork.ozlabs.org/patch/213113/
[2/2] Basic filesystem image with partition table support

which sounds a lot like your 'fs/custom' patch series. If you agree, I
propose to also reject that second patch since fs/custom is a more
generic solution to the same problem.

Thanks,
Thomas
