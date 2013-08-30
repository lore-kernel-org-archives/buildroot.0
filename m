From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 14:52:54 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <2d076e17ea7c855166044994876e2add@sysmic.org>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
Message-ID: <20130830145254.1e5a1f53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 30 Aug 2013 14:44:01 +0200, J?r?me Pouiller wrote:

> > In one of the previous buildroot developer days we discussed this.
> > IIRC, the conclusion was that this change in order shouldn't matter,
> > because all dependencies should be expressed in make. Hence, the end
> > result should be the same, even though build order was not.
> >
> > Have you come across a scenario where there actually was a problem?
> 
> Some packages may detect installed library during ./configure run. 
> Buildroot
> should be aware of this and fix dependencies with that library. 
> Although, it
> is not always the case and Buildroot should at guarantee 
> reproducibility of
> build.
> 
> Without that, we cannot guarantee to reproduce a build done by 
> Autobuilder.

I agree with this. Thomas, I'm not sure that what you say what a
conclusion of a developer day. I believe we always said that it is
hardly possible to guarantee that a package .mk file will contain *all*
the possible dependencies of the package. Whenever someone bumps a
package, we rarely look in detail at whether the software has gained
some optional dependencies, and make sure they are handled in the
corresponding package .mk file.

Having the packages always built in the same order guarantees that, in
the absence of expressed dependencies, the build result will be
reproducible.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
