From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 7 Nov 2017 23:25:43 +0100
Subject: [Buildroot] [git commit] qt5base: add qmake.conf fixup for i.MX
 platforms
In-Reply-To: <CAAMH-yu4D14PbDxjvHsZRjKdZAppqM7Xrmk_zaRyH=sVbnW4rQ@mail.gmail.com>
References: <20171106173439.E5B41810DB@busybox.osuosl.org>
 <1510080818847-0.post@n4.nabble.com> <20171107224151.3ab12019@windsurf>
 <CAAMH-yu4D14PbDxjvHsZRjKdZAppqM7Xrmk_zaRyH=sVbnW4rQ@mail.gmail.com>
Message-ID: <99db5e0a-c259-96db-9ac7-4d9797543809@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I based my patch on yours for eglfs_mali,
tried to compile from scratch
and that doesn't work unfortunately.
I've already submitted my patch,
so I've updated that it was buggy.

Here you find the answer of Arnout Vandecapp:
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-1-add-qmake-conf-fixup-for-sunxi-mali-platforms-td179615.html

Adding Arnout in Cc

I'm planning to use sed as Arnout suggested.

Will you do the change as described or will I?
Because I'd like to add eglfs_mali as I've tried.

Regards

-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

Il 07/11/2017 23:13, Gary Bisson ha scritto:
> Hi,
> 
> On Tue, Nov 7, 2017 at 10:41 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Tue, 7 Nov 2017 11:53:38 -0700 (MST), Giulio Benetti wrote:
>>> Hi Peter,
>>>
>>> unfortunately it doesn't work.
>>> The problem is that you can't put at the end of file
>>> EGLFS_DEVICE_INTEGRATION = eglfs_viv
>>> It must stay before:
>>>
>>> include(../common/linux_device_post.conf)
>>> load(qt_config)
>>>
>>> I did the same for eglfs_mali and failed,
>>> so I've retried putting it there, and it works.
>>
>> Adding Gary Bisson in Cc. Gary, what do you think about the above
>> report?
> 
> I'm surprised to read that this patch doesn't work. It did for sure at
> the time I posted it.
> 
> Moreover, Maxime Ripard tested it recently I presume since he added
> his tested-by yesterday.
> 
> Then again, as my comment said, this isn't the cleanest patch ever and
> yes the qmake.conf from Yocto I point to in the commit log has the
> variable set before the include.
> 
> But, also as stated in my comment, the goal of this patch was to be as
> small and less intrusive as possible.
> 
> Regards,
> Gary
>
