From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Feb 2021 10:34:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2020f
In-Reply-To: <87h7mdbsot.fsf@dell.be.48ers.dk>
References: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
 <20210110164711.1708062-2-bernd.kuhls@t-online.de>
 <87zh1ekq9r.fsf@dell.be.48ers.dk>
 <19dff490-6537-bc7d-7035-e4bd99f97452@gmail.com>
 <877dnad5ux.fsf@dell.be.48ers.dk>
 <602ba0f2-503c-7175-c4fb-7dcac246631c@gmail.com>
 <8735xyd2vs.fsf@dell.be.48ers.dk> <20210214182145.GH6798@piout.net>
 <8c8b3bb9-0179-b194-1ad3-98cdd55ff4b3@gmail.com>
 <20210214203543.GA2945341@scaer> <87h7mdbsot.fsf@dell.be.48ers.dk>
Message-ID: <CANLo3Jg36L0iySAh+UpDV=zg_qKgVdeDVAyrQSdeRKNXM7q0kA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le lun. 15 f?vr. 2021 ? 10:12, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  > So it looks like the duplicated header is causing issues everywhere...
>
>  >> I added back the previous default zic format "fat" instead of "slim"
> [1] to pass
>  >> the test. The default format has been changed in 2020b release.
>  >> I'm not sure if we should keep the "fat" format...
>  >> [1]
> https://github.com/eggert/tz/commit/6ba6f2117b95eab345a7ed9159cef939e30c4cd3
>
>
> https://github.com/eggert/tz/commit/7879a3fba1310da0ccc1c336515b5b4a409c3ccb
> (the commit adding the slim variant) gives more info.
>
>  > To be noted: the glibc version used in thoses tests is 2.18, released in
>  > August 2013...
>
>  > It seems the support for the slim format was only introduced with glibc
>  > 2.32. 2.31 has no mention of either slim or fat, while 2.32 mention
>  > both, as it synced with upstream tz 2020a; the previous sync was with
>  > 2018i...
>
> It is also not clear to me exactly when the slim format support was
> added to glibc, but as additional datapoints, I have it working with a
> 2.30 based toolchain built by 2020.02.x and a 2.31 based one built by
> 2020.11.x.
>


Actually we have the same issue with Bootlin
armv5-eabi--glibc--bleeding-edge-2018.02-1 that use glibc 2.27 (tzcode
2017b).
There is no problem with glibc-2.28 (tzcode 2018g)

https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/fragments/armv5-eabi--glibc--bleeding-edge-2018.02-1.frag

Romain
>

>
>
>  > So, what I suggest we do:
>
>  >   - for master (and next): revert to fat for external glibc, use slim
>  >     for internal glibc (check for c-sky)
>
>  >   - for maintenance branches: unconditionally revert to fat.
>
> Sounds sensible. Please do it in 2 patches, E.G. first use fat
> everywhere, and then as a followup patch change to slim for internal
> glibc.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210215/4dab82a2/attachment.html>
