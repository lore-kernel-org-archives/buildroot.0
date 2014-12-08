From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 16:52:19 +0100
Subject: [Buildroot] [PATCH branch/next] pinentry: bump version to 0.9.0
In-Reply-To: <5485C831.4090205@imgtec.com>
References: <1417190979-53042-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141208102220.7a8242d2@free-electrons.com>
 <548577F0.5020700@imgtec.com> <5485C831.4090205@imgtec.com>
Message-ID: <20141208165219.313b9967@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Dec 2014 15:48:01 +0000, Vicente Olivert Riera wrote:

> it was a problem when building pinentry-qt4, which needs to have support
> for Qt accessibility. Qt accessibility is enabled by default on Qt, but
> we disable it in Buildroot by passing "-no-accessibility" to the
> configure script. I don't know why we do that. There is no comment in
> the .mk file.

Simply because many people probably don't need it, and therefore we
disabled it by default, waiting for someone who needs it to add an
option for it.

> When you fix that, you face another problem which is not related with us
> (Buildroot) but a mistake (that's my opinion) made by the person who
> released the pinentry tarball. I have reported the issue upstream and
> written a patch for Buildroot in the meantime.
> 
> While I was working on all of this, I noticed that the options we had
> for disablen pinentry-gtk1 and pinentry-qt3 where no longer needed since
> those options don't exist anymore in the configure script, and the
> directories gtk and qt don't exist either when you unpack the tarball.
> 
> Path sent:
>   http://patchwork.ozlabs.org/patch/418743/

The accessibility part should be made optional.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
