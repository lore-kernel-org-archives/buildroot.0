From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 12 May 2015 09:56:10 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
	3.10.17-1.0.1
In-Reply-To: <1754040.vn4Oi7W8vI@sagittea>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <20150511132307.GA21085@kwain>
 <CAAMH-yvrDWD5Sgi1d=YTxqVMQfDNHHdoyx94izA8eX3mz4woeQ@mail.gmail.com>
 <1754040.vn4Oi7W8vI@sagittea>
Message-ID: <CAAMH-yu_i+bdN_+Tp8VLfbq5cE=nyOD5ULfNcx1fhg9rfbm0Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On Mon, May 11, 2015 at 7:48 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Hello Gary,
>
> On Monday 11 May 2015 18:32:35 Gary Bisson wrote:
>> Antoine, All,
>>
>> On Mon, May 11, 2015 at 3:23 PM, Antoine T?nart
>> <antoine.tenart@free-electrons.com> wrote:
>> > On Tue, May 05, 2015 at 11:07:59AM +0200, Gary Bisson wrote:
>> >> On Tue, May 5, 2015 at 10:10 AM, Thomas Petazzoni
>> >> <thomas.petazzoni@free-electrons.com> wrote:
>> >> > On Tue, 5 May 2015 10:06:11 +0200, Gary Bisson wrote:
>> >>
>> >> Antoine, do you have a patch ready for the GPU package? Because it
>> >> seems that it's not just a version bump:
>> >> https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9639f6f20991ab64ea75177a017f8749a
>> >
>> > Please find the patch I used to bump the Vivante version to 5.0.11.p4.1
>> > attached.
>> >
>> > I'll be happy to have some feedbacks and to update the patch
>> > accordingly.
>>
>> Thanks for the patch! Maybe we should start a new thread for this?
>>
>> Here are my remarks with the current version:
>> - The package has been renamed from gpu-viv-bin-mx6q to imx-gpu-viv in
>> Yocto, I guess it'd be nice to follow their lead as I'm sure it
>> announces that this package will be used on other iMX platforms. Then
>> I don't know if it's better to have a commit just for renaming the
>> package and another one for the version bump.
> Since this package seems to be incompatible with kernels < 3.10.54, maybe we
> should provide imx-gpu-viv AND gpu-viv-bin-mx6q, no?

Well the gpu-viv-bin-mx6q is only good for 3.10.17 whereas the new
imx-gpu-viv apparently works for both 3.10.53 and 3.14.28. Also most
of the kernels offered by manufacturers are now 3.10.53 or above. But
let's consider the option, wouldn't it be a headache for packages that
depend on it such as gst1-imx or xdriver_xf86-video-imx-viv? I guess
it'd need to check on the kernel headers versions to know which
package it depends on.

Thanks,
Gary
