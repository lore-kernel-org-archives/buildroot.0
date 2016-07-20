From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 20 Jul 2016 15:28:40 +0000 (UTC)
Subject: [Buildroot] Workflow question - separating the distribution
 from embedded applications
References: <CAOsp8o8U3=xT4u6y33Om125WCk+wPzn_bYbzKEBYbiV=dUqzig@mail.gmail.com>
 <nmo2jj$mnc$1@ger.gmane.org>
 <CAOsp8o9hPMb0SJ6YLo4mFnWbR5wUQe6R8yPdebAAwdVsKEB2YQ@mail.gmail.com>
 <CAOsp8o8jNLdhNoyDQByuLF40Z1_jockTV5rYcXF_wyGwRZMLhw@mail.gmail.com>
 <nmo4t3$rs$1@ger.gmane.org>
Message-ID: <nmo5b7$8um$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-20, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> On 2016-07-20, Michael Habibi <mikehabibi@gmail.com> wrote:

> Yes, we use the same toolchain for both buildroot and application
> development (the toolchain is built outside of buildroot using ct-ng).
>
>> If so, how do you ensure you don't get leakage from the wrong host
>> tools if your applications are built separately outside of the
>> buildroot directories?
>
> I don't know what you mean by "leakage".

By "leakage" he apparently means accidentally linking in host
libraries instead of target libraries.

That doesn't happen because

 1) The toolchain doesn't search the host library directories.

 2) If it did, the libraries it would find are the wrong architecture.

-- 
Grant Edwards               grant.b.edwards        Yow! An Italian is COMBING
                                  at               his hair in suburban DES
                              gmail.com            MOINES!
