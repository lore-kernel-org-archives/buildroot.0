From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 7 Nov 2017 23:13:25 +0100
Subject: [Buildroot] [git commit] qt5base: add qmake.conf fixup for i.MX
 platforms
In-Reply-To: <20171107224151.3ab12019@windsurf>
References: <20171106173439.E5B41810DB@busybox.osuosl.org>
 <1510080818847-0.post@n4.nabble.com>
 <20171107224151.3ab12019@windsurf>
Message-ID: <CAAMH-yu4D14PbDxjvHsZRjKdZAppqM7Xrmk_zaRyH=sVbnW4rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Nov 7, 2017 at 10:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 7 Nov 2017 11:53:38 -0700 (MST), Giulio Benetti wrote:
>> Hi Peter,
>>
>> unfortunately it doesn't work.
>> The problem is that you can't put at the end of file
>> EGLFS_DEVICE_INTEGRATION = eglfs_viv
>> It must stay before:
>>
>> include(../common/linux_device_post.conf)
>> load(qt_config)
>>
>> I did the same for eglfs_mali and failed,
>> so I've retried putting it there, and it works.
>
> Adding Gary Bisson in Cc. Gary, what do you think about the above
> report?

I'm surprised to read that this patch doesn't work. It did for sure at
the time I posted it.

Moreover, Maxime Ripard tested it recently I presume since he added
his tested-by yesterday.

Then again, as my comment said, this isn't the cleanest patch ever and
yes the qmake.conf from Yocto I point to in the commit log has the
variable set before the include.

But, also as stated in my comment, the goal of this patch was to be as
small and less intrusive as possible.

Regards,
Gary
