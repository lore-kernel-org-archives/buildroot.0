From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 25 Sep 2018 18:41:53 -0400
Subject: [Buildroot] [PATCH 1/1] python3: Downgrade to 3.6.6
In-Reply-To: <CALFsTFXK+2NB0tAJEkkyGi_QgErj18fGPg5rFN0bmfvjRLtFzg@mail.gmail.com>
References: <20180925180319.24576-1-aduskett@gmail.com>
 <CALFsTFWZYhJtMqb+ksXtJ=1FPOOm-_ynP-vD_i71ttjBEdC=oA@mail.gmail.com>
 <20180925215643.6d5c08b6@windsurf>
 <CALFsTFXK+2NB0tAJEkkyGi_QgErj18fGPg5rFN0bmfvjRLtFzg@mail.gmail.com>
Message-ID: <CAFSsvmpPj0xusvmxjgVVvxv0rGwmXmJQJc5dmtiFSK7C9fpAYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 My main issue is this: The way buildroot is set up, each python
package bump will need to be manually updated, checked for dependency
changes, if any of those are changed, then add/update those, run the
built rootfs, and check the library, and if you miss any of those
steps, you have to do it all over again. With Django, I did run the
rootfs, imported Django, printed the Django version, and said "OK,
that should work," which is not enough. I am not a Django expert.

 Also, many people who do use the packages might not know how to
contact the BuildRoot maintainers if a package they use is broken.
Also, these packages that are causing the failure are the only ones we
can see. I am not sure if other packages (or dependencies of those
packages) will work. Each package upgrade requires manual testing.

What's to say Python3.8 doesn't break even more things? I think an
open discussion of how BuildRoot actually maintains and installs
Python packages needs to happen.
On Tue, Sep 25, 2018 at 4:13 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Yes, I will try to fix at least on of them (hopefully) tomorrow.
> Asaf.
>
> On Tue, Sep 25, 2018 at 10:56 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On Tue, 25 Sep 2018 22:28:11 +0300, Asaf Kahlon wrote:
>> > I disagree with downgrading... Are we really sure the downgrade is needed?
>> > Some patches I sent for python 3.7 packages have already applied (gunicorn,
>> > paramiko etc), I sent a series of patches for pysnmp (
>> > http://patchwork.ozlabs.org/project/buildroot/list/?series=67049), and I
>> > saw you sent a first patch for django (
>> > http://patchwork.ozlabs.org/patch/973261/). So I think we've made a nice
>> > progress until now.
>> > What would be left after that? I think the main packages are crossbar and
>> > twisted. Both have a newer version to upgrade and both seem to have active
>> > repository on github. Maybe it won't be so hard to fix those packages. I
>> > think you should give it a shot before downgrading, but i'm willing to hear
>> > other opinions too.
>>
>> For now, I also dislike the idea of downgrading, because it doesn't
>> seem that the number of affected packages is that important.
>>
>> Asaf, do you think you could help in that effort, perhaps by looking at
>> crossbar and twisted ?
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
