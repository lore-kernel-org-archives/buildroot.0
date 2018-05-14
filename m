From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 13 May 2018 22:01:18 -0400
Subject: [Buildroot] [PATCH 1/2] gst1-plugins-bad: rework license type
 construction
In-Reply-To: <20180513232219.710f6cd1@windsurf.home>
References: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
 <20180513232219.710f6cd1@windsurf.home>
Message-ID: <CANxTyt74dazFq5QO+1mi8ebPnnZx4d2tqWCzdhxM-5YQOONAHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, May 13, 2018 at 5:22 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Sun,  6 May 2018 15:04:02 -0400, Danomi Manchego wrote:
>> Use "GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), xxxx" construct
>> so that the list of licenses is presented as a comma-separated list.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> I've applied to master, thanks! One comment below though.
>
>>  # Add GPL license if GPL licensed plugins enabled.
>>  ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
>> -GST1_PLUGINS_BAD_LICENSE += GPL
>> +GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL
>
> It would be nice to make this vague "GPL" statement a bit clearer. Are
> we talking about GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+ ? Or a
> combination of these ?

You mentioned this before.  I took action in the second patch in this
series, http://lists.busybox.net/pipermail/buildroot/2018-May/220939.html
.  In that patch, I updated which plugins were GPL, and changed "GPL"
to "GPL-2.0+".  As Yann mentioned, I have some proof-reading errors in
the commit log, so I'll submit a new rev of that second patch.

Danomi -


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
