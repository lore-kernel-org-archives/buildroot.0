From: Dimitrios Siganos <dimitris@siganos.org>
Date: Thu, 14 Feb 2013 02:15:11 +0000
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <511C1FE8.60103@mind.be>
References: <511BCBEE.5040704@siganos.org> <20130213212002.25c976ca@skate>
 <511C1A3F.2080804@mind.be> <20130214001404.199dbd64@skate>
 <511C1FE8.60103@mind.be>
Message-ID: <511C48AF.5060106@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 23:21, Arnout Vandecappelle wrote:
> On 14/02/13 00:14, Thomas Petazzoni wrote:
>> Dear Arnout Vandecappelle,
>>
>> On Wed, 13 Feb 2013 23:57:03 +0100, Arnout Vandecappelle wrote:
>>
>>>    I've had the same issue once: a patch to add some functionality to
>>> mkimage that I needed both on the host and on the target.
>>
>> Then easy enough; put your patch in package/uboot-tools/. It handles
>> the build and installation of both the host *and* target variant of the
>> U-Boot tools.
> 
>  In my particular use case (IIRC), the patched mkimage was used to
> process u-boot.bin into a ROM-bootable image. So the same patch had to
> be applied to uboot-tools and uboot. But it was not in fact the same
> patch, because the uboot version was different. What we did in the end
> is just change the uboot-tools site to the same git repository.

Hi Thomas, Arnout,

So if I understand this well, the consensus is that the preferred way to
solve this is to set both packages to point to the same site, method and
version and have two identical copies of the same uboot source code, one
in uboot package and one in uboot-tools package.

That certainly sounds the simplest way although I agree with Arnout that
it is also the strangest and less intuitive approach. Some people will
still raise an eyebrow at such an arrangement.

Regards,
Dimitris
