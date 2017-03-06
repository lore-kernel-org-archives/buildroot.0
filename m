From: Martin Bark <martin@barkynet.com>
Date: Mon, 6 Mar 2017 10:08:16 +0000
Subject: [Buildroot] [PATCH 3/3] package/nodejs: remove 0.10.x support
In-Reply-To: <8fcfeb3e-38c3-3fa7-99fd-feca53e7160f@mind.be>
References: <1488671310-27378-1-git-send-email-martin@barkynet.com>
 <1488671310-27378-3-git-send-email-martin@barkynet.com>
 <8fcfeb3e-38c3-3fa7-99fd-feca53e7160f@mind.be>
Message-ID: <CAFGQKxeAv8j=vAO5TrcZT8r0a8kCneTR4qa9rhz=daHbwnavkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On 5 March 2017 at 22:40, Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 05-03-17 00:48, Martin Bark wrote:
> > nodejs 0.10.x is now end of life and is no longer maintained so remove
> it.
> > See https://github.com/nodejs/LTS
>
>  As mentioned in the Config.in:
>
> # Starting with 0.12.x, on ARM, V8 (the JS engine)
> # now requires an armv6+ and a VFPv2+.
>
>  Some people opposed the removal of 0.10 because it would make nodejs
> unavailable on ARM9, while it is really still useful there. So the idea is
> that
> we keep it around in frozen state.
>

We have discussed this a few times.  The last email exchange i had on this
subject was back on 27th September 2016 where Thomas said

"It is fine to support 0.10.x in Buildroot to support ARMv5 while 0.10.x
is still maintained upstream. But as Peter mentioned, the support for
0.10.x upstream will stop soon, so we should also remove it from
Buildroot."

I purposefully held off submitting these patches until after the 2017.02
release so that it included nodejs 0.10.x.  Personally i would like to see
0.10.x dropped from buildroot.

Thanks

Martin


>  Note that there is no version selection: you get the up-to-date nodejs if
> possible, you *only* get the 0.10 on ARMv5.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170306/4a93b1b2/attachment.html>
