From: Hammami Omar <omar18hammami@gmail.com>
Date: Mon, 24 Feb 2020 10:29:42 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <33327ed4301c921b1ded444b5b7c3b89@umbiko.net>
References: <mailman.11.1582286403.41897.buildroot@busybox.net>
 <33327ed4301c921b1ded444b5b7c3b89@umbiko.net>
Message-ID: <CAGSpp9=Ji6HASueKR3m_LbFAm6vR6Lb_2SvAsFHsGY9qmmDyZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

Thank you for your response.
In fact, I have tried to add extra randomnes by enabling "haveged". The
entropy has increased but the problem is the same.
Is it possible that the entropy value is always less than the wanted one ?

Kind regards,
Omar

Le ven. 21 f?vr. 2020 ? 13:51, Andreas Ziegler <br015@umbiko.net> a ?crit :

> Hi Omar,
>
> On 2020-02-21 13:00, Hammami Omar <omar18hammami@gmail.com> wrote
> > I am using the buildroot version "2019.11.1" and I have noticed that my
> > SSH
> > server starts too late.
> > I was using an old version "2017.08" and the SSH server was starting
> > normally.
>
> This issue is not related to Buildroot, but caused by changes in
> libopenssl (which in turn is used by OpenSSH), starting around the
> middle of last year. You will find a lot of background information when
> you search the www for 'boot-time entropy starvation'; the cause is,
> reading random data from /dev/urandom blocks until the kernel entropy
> pool has been initialized.
>
> Workarounds:
>
> (a) Patch libopenssl (not recommended for nodes directly connected to
> the WAN).
> (b) Use a more recent kernel; version 5.4.y introduced a temporary fix
> for this issue.
> (c) Use other sources of extra randomness, as proposed by Peter
> Seiderer.
>
> Kind regards,
> Andreas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200224/28027cac/attachment.html>
