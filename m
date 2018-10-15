From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Oct 2018 11:57:36 -0500
Subject: [Buildroot] Update the current date using ntp.
In-Reply-To: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
References: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
Message-ID: <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar,

On Mon, Oct 15, 2018 at 11:48 AM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:
>
> Hi everyone,
>
> I'm using ntp from buildroot 2018.02.5 in a Rapberry Pi 3B+ HW
> platform. These are the packages selected from: Target packages ->
> Networking applications
>
> ntp
> ntpd
> ntpdate
>
> The problem is that ntpd takes around 300 seconds to update the
> current date. Is there any way to speed up this process? I have to
> wait until the date is updated before doing my tasks and it is very
> annoying to wait around 300 seconds.
>

By default NTP is going to take a period of time to sync as the clock
will be way out of check > 1000 sec.  Most distros use ntpdate or the
new ntpd -q to get the initial time jammed in and then start ntpd to
maintain.

Matt
