From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Feb 2013 19:08:10 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as soure of
	kernel code
In-Reply-To: <CAPRxd43q0nW6CBtzAx3QCo9Loyyvz7_78D3ZFYWH797_Z8yr+A@mail.gmail.com>
References: <1360310725-6463-1-git-send-email-rafal.fabich@gmail.com>
 <511A78BA.4010200@mind.be>
 <CAPRxd43q0nW6CBtzAx3QCo9Loyyvz7_78D3ZFYWH797_Z8yr+A@mail.gmail.com>
Message-ID: <201302131908.10869.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rafa?, All,

On Wednesday 13 February 2013 Rafa? Fabich wrote:
> On Tue, Feb 12, 2013 at 6:15 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >  One comment below, though.
> >
> >> +       default "local" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
> >
> >
> >  This is a bit confusing, because the 'local' site method will force
> > LINUX_VERSION to "custom". So I would call it custom here as well.
> >
> 
> I would like to send a new version of this patch, should I create a
> new thread or use this one?

Create a new thread. Also, specify in the subject that this is version 2
of your patch, eg.:

    [PATH v2] Add local directory as soure of kernel code

('git send-email' helps you do that easily.)

And add the changes to your patch commit, after a line starting with
three dashes (git interpret this as an end-of-commit-log' separator:

---8<---
    linux: add option to use local directory as kernel source
    
    Add the option to use a local directory as the source for
    building the Linux kernel, which can be usefull during
    kernel development.
    
    ---
    Changes v1 -> v2
      - fixed foo bar  (Reviewer)
      - added baz buz
---8<---

This way, it is easy for the reviewer what to look at, and for the
maintainer as it knws a previous patch with the same subject is not
to be applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
