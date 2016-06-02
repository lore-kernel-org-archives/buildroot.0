From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jun 2016 09:49:27 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <CANCHnQpE9RGUXdVcRob_TjHX4pwfADdsrJ55ZiTs4NkL-UhQQA@mail.gmail.com>
References: <20160601232654.07800a9b@free-electrons.com>
 <CANCHnQpE9RGUXdVcRob_TjHX4pwfADdsrJ55ZiTs4NkL-UhQQA@mail.gmail.com>
Message-ID: <20160602094927.73566578@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Jun 2016 09:41:29 +0200, Jeroen Roovers wrote:

> It's useful to be able to globally use ld options like --as-needed,
> and I found only uboot breaking (as it's the only package that
> interprets LDFLAGS differently).
> 
> Alternatively, I could of course locally carry the patch indefinitely.

What bothers me a bit is that LDFLAGS are not supposed to be passed to
"ld" directly, but to "gcc". So essentially, we are working-around a
bug in U-Boot. Though I agree that the workaround is not too big or
horrible.

But have you tried reporting this problem to upstream U-Boot, and see
what they say?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
