From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 20 Jul 2016 15:21:07 +0000 (UTC)
Subject: [Buildroot] Workflow question - separating the distribution
 from embedded applications
References: <CAOsp8o8U3=xT4u6y33Om125WCk+wPzn_bYbzKEBYbiV=dUqzig@mail.gmail.com>
 <nmo2jj$mnc$1@ger.gmane.org>
 <CAOsp8o9hPMb0SJ6YLo4mFnWbR5wUQe6R8yPdebAAwdVsKEB2YQ@mail.gmail.com>
 <CAOsp8o8jNLdhNoyDQByuLF40Z1_jockTV5rYcXF_wyGwRZMLhw@mail.gmail.com>
Message-ID: <nmo4t3$rs$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-20, Michael Habibi <mikehabibi@gmail.com> wrote:

> I forgot to ask - are you using the same cross-tools, host-tools and
> toolchain for your applications as your distribution?  For example,
> your libraries, autotools, gcc, etc.

Yes, we use the same toolchain for both buildroot and application
development (the toolchain is built outside of buildroot using ct-ng).

> If so, how do you ensure you don't get leakage from the wrong host
> tools if your applications are built separately outside of the
> buildroot directories?

I don't know what you mean by "leakage".

The autotools that are used for application development are those from
the development host.  We haven't had any problems due to that (yet),
but it is a weak point in the workflow, since they aren't
archived/controlled the way the toolchain is.

-- 
Grant Edwards               grant.b.edwards        Yow! Today, THREE WINOS
                                  at               from DETROIT sold me a
                              gmail.com            framed photo of TAB HUNTER
                                                   before his MAKEOVER!
