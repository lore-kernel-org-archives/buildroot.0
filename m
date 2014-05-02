From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 02 May 2014 10:21:34 -0300
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
 updated
In-Reply-To: <87ha58corn.fsf@steelpick.2x.cz>
References: <1396469147-21713-1-git-send-email-sojka@merica.cz>
 <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
 <20140501203103.GA3231@free.fr> <87ha58corn.fsf@steelpick.2x.cz>
Message-ID: <53639BDE.4050009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2014 10:07 AM, Michal Sojka wrote:

> I could definitely live with this conclusion, but on the other hand I
> don't think that adding one more dependency is being "too smart". What
> are the drawbacks of adding this functionality? If it is just adding the
> same to other packages, I'm willing to do that. Quick grep suggests that
> only the following packages have custom config files: at91bootstrap3.mk,
> barebox.mk, ubi.mk, linux.mk, busybox.mk, freetype.mk, luarocks.mk,
> qt.mk, uclibc.mk.

Hi.
I think i've already mentioned it in the past, but here it goes again.
Because you'd need a full rebuild of packages that depend on busybox as
well since we use DEPENDENCIES to make packages with superior
functionality to that provided by busybox build afterwards to override
it's functionality (logic = it's YES and better so do it).
If you rebuild busybox without doing so for the other packages then your
"reproducibly" goes down the drain since the "big and featured" binaries
get overwritten by busybox (with the way busybox is installed at the
moment) for a built project.
Regards.
