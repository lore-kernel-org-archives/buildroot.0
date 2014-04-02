From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 2 Apr 2014 17:55:51 +0200
Subject: [Buildroot] init script installation policy
In-Reply-To: <533C16A1.3080508@westpond.com>
References: <533C16A1.3080508@westpond.com>
Message-ID: <CAAXf6LVtLKm17WOAJ2p+9-+R10vgDYXZFVOYuvXzA9LMOkF9Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nate,

On Wed, Apr 2, 2014 at 3:54 PM, Nathan Ford <nford@westpond.com> wrote:
> What is the policy for installing init scripts when there is already an
> init script in the target location? Currently there does not seem to be
> any consistency. I bring this up as I updated a project to a newer
> buildroot recently and a package I use went from not installing the init
> script if it was present, to always installing.
>
> For my projects I use a custom skeleton fs and like the fact that I can
> just store my custom init scripts for the packages I use in the skeleton.
>

In this case, the recommendation is to use a rootfs overlay rather
than a custom skeleton. Where the skeleton provides the _initial_
layout, and packages then add their stuff afterwards, a rootfs overlay
is copied _after_ all packages have done their job. This means that
your custom script in the overlay would take precedence over the
script provided with the package.

Have a look at http://buildroot.uclibc.org/downloads/manual/manual.html#rootfs-custom

Best regards,
Thomas
