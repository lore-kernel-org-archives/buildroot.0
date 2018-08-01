From: David De Grave <david.degrave@mind.be>
Date: Wed, 1 Aug 2018 16:36:49 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <20180801124352.0dfa6670@windsurf>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
 <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
 <20180731205154.62967de8@windsurf>
 <ea2ac147-3c9f-a85d-83ea-84f33a0d52e4@mind.be>
 <20180801090548.0c92457b@windsurf>
 <CAD6XyYyJn23DXau0VfHOAL03ouY72Pt2GoFu8sQ3rU6xDugVgg@mail.gmail.com>
 <20180801124352.0dfa6670@windsurf>
Message-ID: <CAD6XyYyTuHtcPp0BQqRX68CdFcJVGm8SSra3YSKVHoyvOuN6Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 1, 2018 at 12:43 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Wed, 1 Aug 2018 12:36:16 +0200, David De Grave wrote:
>
> > In the other hand, using the host-dtc is working but lead to other
> problems:
>
> So, using the U-Boot provided DTC is better when available. So indeed,
> I think you should just fix U-Boot so that when it
> uses ./scripts/dtc/dtc, it builds it first :-)
>

Indeed it sounds a better approach and submitted a new patch. Not sure
however if
it's well done. At least everything is running fine now on my side.


> DEVICE_TREE ?= $(CONFIG_DEFAULT_DEVICE_TREE:"%"=%)
> ifeq ($(DEVICE_TREE),)
> DEVICE_TREE := unset
> endif
>
> This is where your unset.dts comes from.
>

Indeed. Thx! :-)

Regards,
David.

-- 

*David De Grave*
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind <https://www.mind.be/> - Gaston Geenslaan 9, B-3001 Leuven,
Belgium
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180801/3c434e2a/attachment.html>
