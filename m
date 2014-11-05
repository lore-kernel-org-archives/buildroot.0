From: Sid Bharij <sid.bharij@gmail.com>
Date: Wed, 5 Nov 2014 08:42:09 -0600
Subject: [Buildroot] Buildroot and apt-get
In-Reply-To: <20141105081824.01c2698a@free-electrons.com>
References: <CAEk40fyze1gZL_x52zfESUqLzTMsjAUdmEKPVYL7DZJ2=3D1vQ@mail.gmail.com>
 <20141105081824.01c2698a@free-electrons.com>
Message-ID: <CAEk40fwsed9DmOPs-Pcp0txYvaS2_tzaHHBuWD9QsxrtBXd-QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the reply.
I guess what I was asking was how to I install a package using build
root. But it seems that build root doesn't support installing
packages. I did read somewhere that you can use a post build script
and add the package using buildroot. I am not sure how though.

Regards,
Sid

On Wed, Nov 5, 2014 at 1:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sid Bharij,
>
> On Tue, 4 Nov 2014 15:34:54 -0600, Sid Bharij wrote:
>
>> I am trying to get a webcam installed on my pi.
>> I created the kernel image using buildroot. The pi came up and I was
>> able to ssh to it. But when I try to do a apt-get install motion it
>> says apt-get not found. I checked the rootfs and it does not have the
>> apt-get file in it.
>>
>> What do I need to do in order to get the apt-get to work, is there
>> some post build script that I need which will install motion on the
>> target ? or is there some setting in buildroot
>
> There is no package management system in Buildroot in the sense of
> apt-get or similar tools in other Linux distributions. Buildroot
> produces a root filesystem image, and if you want to add/remove things
> to the filesystem image, you need to use Buildroot again to rebuild the
> image.
>
> See also
> http://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages
> for details.
>
> So, basically, you need to go in 'make menuconfig', enable whatever
> package you need, hit 'make', and then use the resulting filesystem
> image on your RPi.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
