From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 2 Mar 2015 12:13:04 -0500
Subject: [Buildroot] [PATCH 1/1] package/systemd: journald should use
 volatile storage
In-Reply-To: <87h9u4xxb1.fsf@dell.be.48ers.dk>
References: <1425201058-3946-1-git-send-email-nroach44@gmail.com>
 <87h9u4xxb1.fsf@dell.be.48ers.dk>
Message-ID: <CANPyyuN093C11GRiFUC+kTqq2T-XtSe4Adh3P+vSTBXJELGo6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 1, 2015 at 3:44 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:
>
>  > (By default)
>  > This fixes https://bugs.busybox.net/show_bug.cgi?id=7892
>
>  > Journald was attempting to write the logs to file before the
>  > underlying file system was up. A proposed solution was to bring
>  > /tmp up beforehand, but that did not always solve the issue.
>
>  > In addition, since the logging directory was a tmpfs to begin with
>  > (/var/log -> /tmp) this should save some cycles.
>
>  > Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
>
> Sorry, cannot reproduce this here. How do you see it exactly?
>
> See bugtracker for details about my tests with
> qemu_arm_versatile_defconfig.
>

I recently started having this issue on my SAMA5 system and this patch
fixed it. It seems to be some sort of race condition; before this
patch it would occur about 1 out of 3 boots. I've since booted a dozen
times without an issue.

Mike
