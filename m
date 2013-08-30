From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Aug 2013 13:59:37 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
Message-ID: <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 30-aug.-2013 10:32 schreef "J?r?me Pouiller" <jezz@sysmic.org> het
volgende:
>
> Hello,
>
> I noticed a problem with reproducibility of build. If I list targets
> (using make show-targets) on Fedora and on Ubuntu, targets are on
> sorted on same orders. Indeed, result of $(wildcard *.mk) are not
> the same on these systems.
>
> It seems Make does not sort anymore result of wildcard since 3.82:
> http://comments.gmane.org/gmane.comp.gnu.make.bugs/4260.
>
> Following patch should fix problem.

In one of the previous buildroot developer days we discussed this. IIRC,
the conclusion was that this change in order shouldn't matter, because all
dependencies should be expressed in make. Hence, the end result should be
the same, even though build order was not.

Have you come across a scenario where there actually was a problem?

Best regards,
Thomas

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130830/1296e9e7/attachment.html>
