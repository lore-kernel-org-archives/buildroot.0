From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 30 Aug 2013 14:44:01 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
Message-ID: <2d076e17ea7c855166044994876e2add@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-08-30 13:59, Thomas De Schampheleire wrote:
> Op 30-aug.-2013 10:32 schreef "J?r?me Pouiller" <jezz@sysmic.org> het 
> volgende:
>  >
>  > Hello,
>  >
>  > I noticed a problem with reproducibility of build. If I list 
> targets
>  > (using make show-targets) on Fedora and on Ubuntu, targets are on
>  > sorted on same orders. Indeed, result of $(wildcard *.mk) are not
>  > the same on these systems.
>  >
>  > It seems Make does not sort anymore result of wildcard since 3.82:
>  > http://comments.gmane.org/gmane.comp.gnu.make.bugs/4260 [1].
>  >
>  > Following patch should fix problem.
>
> In one of the previous buildroot developer days we discussed this.
> IIRC, the conclusion was that this change in order shouldn't matter,
> because all dependencies should be expressed in make. Hence, the end
> result should be the same, even though build order was not.
>
> Have you come across a scenario where there actually was a problem?

Some packages may detect installed library during ./configure run. 
Buildroot
should be aware of this and fix dependencies with that library. 
Although, it
is not always the case and Buildroot should at guarantee 
reproducibility of
build.

Without that, we cannot guarantee to reproduce a build done by 
Autobuilder.



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
