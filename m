From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Oct 2015 21:05:47 +0200
Subject: [Buildroot] [PATCH] iptables: add upstream patch fixing the
 message 'connlabel.conf not found'
In-Reply-To: <87vba27vhz.fsf@dell.be.48ers.dk>
References: <1445257360-31923-1-git-send-email-patrickdepinguin@gmail.com>
 <87vba27vhz.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWqmBZjvBu8Qd-N7JffxrU7V15xBMtYqMO3Fgj-XcPKmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 19, 2015 at 5:01 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>  > In iptables versions 1.4.20 and 1.4.21, any call to iptables
>  > would generate a message
>
>  >     cannot open connlabel.conf, not registering 'connlabel' match: No
>  >         such file or directory
>
> Committed, thanks.
>
> Do you see this with mainline buildroot? We do pass --disable-static for
> !BR2_STATIC_LIBS builds, so I'm not sure how it could trigger for your?
>
> But the fix does make sense for completely static builds.

We noticed this problem after upgrading to a newer buildroot version a
few releases back (but never sent that patch to buildroot until now).
We are not using a static build, nor did we make changes to
iptables.mk here.
I don't really know why the author of the patch mentioned static in
the commit message. Maybe he is not referring to 'static' in the sense
that Buildroot does.

Anyway, we were thus seeing this message with standard iptables calls
on a standard system.

/Thomas
