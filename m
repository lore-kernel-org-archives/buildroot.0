From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 15:44:30 +0100
Subject: [Buildroot] freetype: fix for multilib toolchain
In-Reply-To: <AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
References: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>
	<20110114091129.13d810c8@surf>
	<AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
Message-ID: <20110114154430.4952dca7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jan 2011 13:47:54 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> AFAIK, ld does not have an "-march" option (just looked at the man page).
> So I'd say that it is the freetype (and sshd?) package that needs to be fixed
> (and not BR) because they are using LDFLAGS wrong.

I clearly overlooked this, and I think you're correct.

So, as I said in another e-mail, I think ld does allows to choose
between different ld variants. So the link should always be done with
gcc, which then drives ld, giving it the correct path to the
appropriate libraries and runtime.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
