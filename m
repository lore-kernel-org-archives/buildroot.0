From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 22:33:54 +0200
Subject: [Buildroot] [[PATCH v2 05/14] package/mender: symlink
 /var/lib/mender -> /data/mender
In-Reply-To: <20180820220429.1e67ba29@windsurf>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-6-mirza.krak@northern.tech>
 <CADHdJwC4ZJv7uAwX5OZfVr2xedHESE7en8TjSGrPKAt2qdsB3A@mail.gmail.com>
 <20180820220429.1e67ba29@windsurf>
Message-ID: <CADHdJwDd81-YntQ_s1Y4wR3VUX684+D_MFxqgSvbS+XtHwTdqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2018 at 10:04 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 20 Aug 2018 20:36:22 +0200, Mirza Krak wrote:
>> On Mon, Aug 20, 2018 at 3:09 PM, Mirza Krak <mirza.krak@northern.tech> wrote:
>> > The Mender client will use /var/lib/mender to access the persistent data
>> > partition and expect the link to be in place.
>> >
>> > By default it points to /data, but this can easily be overriden by
>> > overriding the link in overlay_fs
>> >
>> > Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>> > ---
>> >  package/mender/mender.mk | 2 ++
>> >  1 file changed, 2 insertions(+)
>>
>> Thanks Thomas for picking up my other patches.
>>
>> Wondering if this one was missed or some other reason not to apply it?
>
> This one also relies on the assumption that /data is the persistent
> partition, which is the part I'm still not sure how to handle. So I've
> so far merged the things that I agree with, and that are OK for master.

Sorry I probably mislead you regarding this.

The Mender client will use the /var/lib/mender path, that is pretty
much hard-coded. The fact that it was a link to /data is simply to
provide a "valid" path, because the mender.service will create the
directory structure on start-up. The reason it is a link is because
you can change it to point to where ever your persistent storage is.

So we either have to have a "mkdir -p /var/lib/mender" in mender.mk or
use the link that this patch provides.

Sorry once again for not making this clear.

>
> The rest is either stuff that needs more discussion (persistent
> partition related stuff) or that isn't material for master because it
> doesn't fix any problem.
>
> BTW, could you send a patch adding yourself as a developer for the
> mender package in the DEVELOPERS file ?

Will do.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
