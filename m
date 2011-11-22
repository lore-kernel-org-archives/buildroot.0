From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 22 Nov 2011 06:44:04 -0500
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <4ECB795E.90607@neotion.com>
References: <4ECA36CB.5010803@neotion.com> <1321879312.2085.18.camel@sven>
 <20111121134405.02151918@skate> <4ECA8C28.1020306@neotion.com>
 <20111121210817.5eddecc0@skate> <4ECB795E.90607@neotion.com>
Message-ID: <CAHUNapTp7eVF56h-waOmccwSz8nkWSJ-Ke7QVMQ7H8Z3i+kOwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 22, 2011 at 5:28 AM, Emmanuel BOUAZIZ <ebouaziz@neotion.com> wrote:
>>> The "irq 7: nobody cared" error is still there though. It was not
>>> related after all. Any idea about that ?

It means IRQ 7 was raised, the kernel asked all the drivers registered
for IRQ 7 to have a look, and none of them reported having handled it.
Therefore a buggy driver somewhere or misbehaving hardware.

You can pass "nodebugirq" as a kernel cmdline option if you want the
kernel to not care.
