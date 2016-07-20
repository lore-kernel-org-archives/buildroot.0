From: Michael Habibi <mikehabibi@gmail.com>
Date: Wed, 20 Jul 2016 10:16:41 -0500
Subject: [Buildroot] Workflow question - separating the distribution
 from embedded applications
In-Reply-To: <CAOsp8o9hPMb0SJ6YLo4mFnWbR5wUQe6R8yPdebAAwdVsKEB2YQ@mail.gmail.com>
References: <CAOsp8o8U3=xT4u6y33Om125WCk+wPzn_bYbzKEBYbiV=dUqzig@mail.gmail.com>
 <nmo2jj$mnc$1@ger.gmane.org>
 <CAOsp8o9hPMb0SJ6YLo4mFnWbR5wUQe6R8yPdebAAwdVsKEB2YQ@mail.gmail.com>
Message-ID: <CAOsp8o8jNLdhNoyDQByuLF40Z1_jockTV5rYcXF_wyGwRZMLhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot to ask - are you using the same cross-tools, host-tools and
toolchain for your applications as your distribution? For example,
your libraries, autotools, gcc, etc. If so, how do you ensure you
don't get leakage from the wrong host tools if your applications are
built separately outside of the buildroot directories? Thanks again.

On Wed, Jul 20, 2016 at 9:49 AM, Michael Habibi <mikehabibi@gmail.com> wrote:
> Great, thanks for this info. I'll look into this in more detai.
>
> On Wed, Jul 20, 2016 at 9:41 AM, Grant Edwards
> <grant.b.edwards@gmail.com> wrote:
>> On 2016-07-20, Michael Habibi <mikehabibi@gmail.com> wrote:
>>
>>> With buildroot, I imagine we can do the same thing since it also
>>> builds a root filesystem. However I am trying to understand a workflow
>>> where we could build the distribution's root filesystem of the
>>> distribution separate from our embedded applications.
>>
>> We use buildroot to build the root filesystem (including the ipkg
>> package manager).
>>
>> Application developers build applications separately and package them
>> as .ipk packages.
>>
>> We then install each set of .ipk packages into a JFFS2 filesystem
>> image.  [This is don't on a development host, not on the target.]
>>
>> We then distribute two images: the kermel+rootfs uImage, and the JFFS2
>> filesystem image containing all of the applications.  The former
>> rarely gets updated and is common across several products.  The latter
>> gets updated much more frequently and there are various different
>> flavors of it for different products.
>>
>> --
>> Grant Edwards               grant.b.edwards        Yow! I feel partially
>>                                   at               hydrogenated!
>>                               gmail.com
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
