From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 22:59:21 +0100
Subject: [Buildroot] [PATCH 5/6] package/mrouted: for merged usr,
 install to /usr by default, not /
In-Reply-To: <20210123205738.GD926565@scaer>
References: <20210123103155.2599311-1-troglobit@gmail.com>
 <20210123103155.2599311-6-troglobit@gmail.com>
 <20210123205738.GD926565@scaer>
Message-ID: <878s8jwc06.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yann!

On Sat, Jan 23, 2021 at 21:57, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-23 11:31 +0100, Joachim Wiberg spake thusly:
>> -MROUTED_CONFIGURE_OPTS = --enable-rsrr
>> +MROUTED_CONF_OPTS = --prefix=/usr --sysconfdir=/etc --localstatedir=/var
> I don't understand why the above is needed, and how it is related to
> merged-usr as stated in the commit title...
> Indeed, the --prefix, --sysconfdir, and --localstatedir passed by the
> autotools infra are already the values you pass above:
>     ./configure \
>         --target=$$(GNU_TARGET_NAME) \
>         --host=$$(GNU_TARGET_NAME) \
>         --build=$$(GNU_HOST_NAME) \
>         --prefix=/usr \
>         --exec-prefix=/usr \
>         --sysconfdir=/etc \
>         --localstatedir=/var \
> So I am not sure why you need to pass those explicitly.

Yeah, I'm equally confused now.  Not sure what went wrong with my
setp, and I'll go back and check that out right away.  This affected
the sysklogd patch series as well, unfortunately :-/

> Furthermore, I don't see what a merged-usr setup would come into play
> in this situation...

Silly conclusion of mine drawn from the above messed up defaults.  I
think it all comes from the b0rked configure.ac files in my GitHub.

Sorry for the noise!

> In the meantime, I've marked this patch as rejected in patchwork. If you
> still believe it is needed, please respin with additional explanations:
> what is the problem that you encountered, and why explicitly passing
> those options solves it?

Nope, that's all good with me :)

Thank you so much for taking the time to clean up my patches! <3


Best regards
 /Joachim
