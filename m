From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 May 2020 23:53:40 +0200
Subject: [Buildroot] [PATCH v1 4/4] exfatprogs: fix more 64-bit types
 printf compile failure
In-Reply-To: <20200509215059.05e5ba56@windsurf.home>
References: <20200509162117.8728-1-ps.report@gmx.net>
 <20200509162117.8728-4-ps.report@gmx.net>
 <20200509184246.1b9d9b5a@gmx.net>
 <20200509215059.05e5ba56@windsurf.home>
Message-ID: <20200509235340.583f2857@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 9 May 2020 21:50:59 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sat, 9 May 2020 18:42:46 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Ignore this one, breaks some other toolchains build....update follows ;-)
>
> Also, we probably want a patch to disable -Werror, as this is always
> going to cause build problems.

The next version of extfatprogs will already disable -Werror (see [1] and [2])...

Considered the same (specially after the printf fixing loop), but the
'node may be used uninitialized' seems a 'real' bug, so decided to
keep -Werror and to investigate/fix the errors/bugs ;-)

Regards,
Peter

[1] https://github.com/exfatprogs/exfatprogs/commit/1ed530e5e68eeaaeb0764c3831a59aacfdd7ced8
[2] https://github.com/exfatprogs/exfatprogs/commit/0fefa8a1eb92bb95be3756693b58f55af9b18bee

>
> Thomas
