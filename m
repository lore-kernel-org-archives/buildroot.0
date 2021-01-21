From: Joachim Wiberg <troglobit@gmail.com>
Date: Thu, 21 Jan 2021 13:41:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sysklogd: bump to version
 2.1.2
In-Reply-To: <20210119222636.42b6121a@windsurf.home>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201229181125.704233-1-andreas.hilse@googlemail.com>
 <87turgy8vi.fsf@gmail.com> <20210119222636.42b6121a@windsurf.home>
Message-ID: <87lfcmwjgw.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi :)

On Tue, Jan 19, 2021 at 22:26, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Sat, 16 Jan 2021 20:33:37 +0100
> Joachim Wiberg <troglobit@gmail.com> wrote:
>> These two could also be relevant:
>> - RFC3164 style logging, fully RFC compliant not just BSD style
>> - RFC5424 style logging to file and remote log servers
> Right, but the commit log mainly documents the changes that have an
> impact on packaging, not necessarily all the additional (good) features
> of the the new upstream release.

Ah, of course, thank you for taking the time to explain!

>> I've tested it with a few Bootlin toolchains in our NetBox repo, so it
>> should be a much smoother ride.
> Will definitely be good to have a follow-up patch bumping to 2.2.0.

I'll get on it then :)

>> > +SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger  
>> The logger tool that comes with sysklogd is quite advanced, allowing the
>> user to leverage the RFC5424 `syslogp()` API to its fullest.  However,
>> it collides with its namesake in BusyBox, but so does the logger tool in
>> util-linux.  I'd very much like to see it in Buildroot, but I can submit
>> a patch later to add menuconfig support :)
> Patch welcome indeed!

Great!

> Regarding the collision with Busybox, we do have a mechanism in place
> to handle that, so it should be fine. Busybox already has the sysklogd
> package in its dependencies, which means that sysklogd if enabled will
> always be built before Busybox. And the Busybox installation is careful
> to not overwrite any file. So if /bin/foobar has been installed by
> sysklogd, even if Busybox has support for /bin/foobar, it will not
> overwrite /bin/foobar with its own symlink.

Wow, that's awesome, didn't know about that collision handling, clever!
Very cool :)

Best regards
 /Joachim
