From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Mon, 25 Jan 2016 10:06:25 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160123090148.34d861bd@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <CA+-urNTGae35+MuvCzE3UE0POL0NJxfGRciXaZf8ohDdq_a-RQ@mail.gmail.com>
 <20160117122340.3b07b5ed@free-electrons.com>
 <CA+-urNSaEmBp=wsP_kjzk=63T3xt+9wBY-yLJzsXagi5QH2iQQ@mail.gmail.com>
 <CA+-urNRYkOOe4TCxiUeLYLqQS-1+8qCVP9qMiEthTsi22Q61NQ@mail.gmail.com>
 <20160123090148.34d861bd@free-electrons.com>
Message-ID: <CACt6We0Jcryw4jd8RcD66tgUhjE7+TgGwjm_8xG8-U=4VB7aTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello thomas,

I had another look at the rabbitmq-c build issue this morning, but with the
latest buildroot version of this morning it builds just fine. Any idea what
has changed?

regards,
Joris

On 23 January 2016 at 09:01, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Frank,
>
> On Fri, 22 Jan 2016 20:05:01 -0500, Frank Hunleth wrote:
>
> > I received further advice from the Erlang mailing list. The summary is:
> >
> >    1. Upgrade to Erlang 18 (BR is currently using 17.5)
> >    2. Prefer the use of Erlang 18's native atomics implementation over
> > libatomic_ops.
> >
> > I verified that upgrading to Erlang 18 and not using libatomic_ops
> > works for all qemu_*_defconfigs (with Erlang enabled), the aarch64
> > autobuilder failure, and a couple other configs. It does not work with
> > sparc_v8 as recently found with Erlang 17.5. I also tested whether
> > Erlang 18's configure scripts would choose libatomic_ops if it were
> > present, and they do not. This was tedious, so I am quite open to
> > others repeating the tests (or telling me to do so) if this does not
> > sound right. As a result of this testing, I disabled the use of
> > libatomic_ops for Erlang as you will see in a subsequent patch set.
> >
> > Unfortunately, the upgrade to Erlang 18 was nontrivial due to a couple
> > major changes to the language and APIs. I had to bump the versions of
> > ejabberd and nearly all Erlang packages to fix this. While Erlang is
> > very important to me, I have never used the rebar infrastructure or
> > ejabberd. I verified that the new version of ejabberd compiles across
> > all qemu_*_defconfigs except the sparc_v8 one. I do not know if it
> > runs correctly, though. Johan - I cc'd you since I saw that you are
> > using ejabberd. Hopefully you can review too.
> >
> > The patch set will follow shortly.
>
> Thanks a lot for working on this. Upgrading to Erlang 18 definitely
> looks like a good thing.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160125/baa12787/attachment.html>
