From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 7 Apr 2021 15:32:56 -0500
Subject: [Buildroot] [RFC] rename docker-containerd package to
 containerd?
In-Reply-To: <CA+h8R2qagx+X9TnRxqGWe=ozSoGjqQDNme290mc6bSym753+yA@mail.gmail.com>
References: <CA+h8R2pH1sffW6iJFZKdxB71ke1nhtSFdCr=x3MzsyVqiXNe1A@mail.gmail.com>
 <37926b27-8d30-fb0b-368f-eaab81311bed@mind.be>
 <CA+h8R2qagx+X9TnRxqGWe=ozSoGjqQDNme290mc6bSym753+yA@mail.gmail.com>
Message-ID: <CANQCQpYLgjqqbz49DOsAFYpUdUYYWKvNYmWS+2N-mg6SesoybA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,


On Wed, Apr 7, 2021 at 3:18 PM Christian Stewart <christian@paral.in> wrote:

> Arnout,
>
> On Wed, Apr 7, 2021, 11:39 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>>  Hi Christian,
>>
>>  Not much reaction to this RFC :-)
>>
>> On 12/03/2021 22:00, Christian Stewart wrote:
>> > Hi all,
>> >
>> > When introduced, the docker-containerd package was associated with
>> > Docker Engine.
>> >
>> > Now, the project is independent and called simply "containerd."
>> >
>> > https://github.com/containerd/containerd
>> >
>> > Is it worthwhile / standard practice to rename the Buildroot package
>> > to "containerd"? The package is already independent from Docker.
>>
>>  It's done occasionally, there's no real rule for it. Personally I don't
>> like
>> renames too much, because it makes upgrading buildroot harder (though the
>> legacy
>> handling usually covers it pretty well). It also makes backporting
>> patches more
>> difficult, and also consulting history.
>>
>>  If you look at Config.in.legacy ("git log -G '[Rr]enamed'
>> Config.in.legacy"),
>> you'll see that for most renames there was a reason. For example, cegui06
>> was
>> renamed because it was no longer version 6. The rename of rcw ->
>> qoriq-rcw was
>> contributed by someone from NXP (i.e., the chip vendor behind qoriq) so
>> that
>> also carries a bit more clout.
>>
>>  That said, feel free to do this rename if you think it improved things.
>> Since
>> there's only a single package that depends on it, it shouldn't be too
>> hard to do
>> the rename.
>>
>
> I'd rather do the rename now than wait until we have lots of dependencies
> for it. Containerd is increasingly being used in non docker contexts like
> Kubernetes and nerdctl, and should be similarly disassociated with docker
> in the Buildroot naming.
>

Ack renaming this sooner than later.  Containerd and other similar projects
are all working to be as Docker independent as possible and I could see
this naming raising questions / confusion amongst newcomers.

Regards,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210407/2d5fdf33/attachment.html>
