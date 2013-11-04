From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 04 Nov 2013 20:06:21 +0100
Subject: [Buildroot] Speeding up builds
In-Reply-To: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
Message-ID: <5d58cf72-cd29-4f75-b348-4b59b4941a2f@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

Dallas Clement <dallas.a.clement@gmail.com> wrote:
>Hi All,
>
>I'm just looking for some tips on how to speed up my build times.  My
>rootfs contains many packages with lots of dependencies.  Even with 8 fast
>Xeon cores, 64GB of RAM, SSDs, and SAS drives, my builds are taking 1 hour
>and 50 minutes.
>
>When I observe CPU utilization with htop, I rarely see more than one CPU
>core getting worked hard.  Occasionally, I will see all 8 cores maxed at
>100%.
>
>make -j 16 seems to make little difference.
>
>What can I do to get all my CPU cores working all the time?

What is the value of BR2_JLEVEL in your .config?
And have you tried enabling ccache?

What takes a significant amount of time are the configure steps of all packages, which are not parallelized.

Best regards,
Thomas
