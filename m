From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 30 May 2013 09:35:53 +0200
Subject: [Buildroot] host-gutenprint
In-Reply-To: <20130529135624.75b9b699@skate>
References: <CALdGskKLCjz1Bo6R1eBWdwf5xKXgpQ12uHGvYaE74vZ2XpjhNw@mail.gmail.com>
 <20130529135624.75b9b699@skate>
Message-ID: <CAKAx1ch5Z8Cq15pM86cRGVc880+7=P9F04btmdtvJ1ouohuw=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas and Olivier,

On Wed, May 29, 2013 at 1:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Olivier Schonken,
>
> Please use the Buildroot mailing list for such discussion. I've added
> it in Cc.
>
> On Wed, 29 May 2013 10:47:43 +0200, Olivier Schonken wrote:
>
>> I tried to sort out the
>> http://autobuild.buildroot.org/results/8f1/8f1da2d88bbfc75ca67d704f6529377746f3f66e/build-end.log

I am sorry for having missed this discussion! But on the other hand it
helped me look at the issue from another point of view. I am
discussing it here:
http://lists.busybox.net/pipermail/buildroot/2013-May/073027.html

>>
>> problem a while ago.  The easiest solution is to patch the Makefile.am of
>> the host-gutenprint to make it not enter the cups directory and run the
>> cups makefile.
>>
>> The problem I encountered is that the host-gutenprint-001.patch also gets
>> applied to the gutenprint package, and thus the cups driver will not be
>> built for the target. I couldn't get buildroot to distinguish between a
>> host-build and a target-build patch.
>>
>> If you have any ideas on how to go about this, I'll be happy to implement.
>
> You should *not* distinguish between host patches and target patches.
> This is really bad as the source tree should be the same for the host
> and the target builds, and I've sent just two days ago a patch series
> that was precisely fixing the packages that are currently doing this.
>
> So, what you should is instead add an option like --disable-cups in the
> configure.ac, which defaults to enabled, and in the Makefile.am, only
> add the cups sub-directory to the SUBDIRS variable if CUPS is enabled.
> Preferably, it should be done in a form that allows the patch to be
> submitted upstream.
>
> You can look at
> http://lists.gnu.org/archive/html/bug-gettext/2013-05/msg00035.html for
> an example I've submitted upstream to gettext.
>
> Note that apparently, gutenprint already has a --without-cups option.
> So maybe your work is really to figure out why this option doesn't
> disable the CUPS build.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Best regards,
Lionel

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
