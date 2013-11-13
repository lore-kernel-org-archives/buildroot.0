From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 17:22:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-12
In-Reply-To: <20131113073025.D898952C60E@lolut.humanoidz.org>
References: <20131113073025.D898952C60E@lolut.humanoidz.org>
Message-ID: <CAAXf6LWgt30AW1tNK=uNgvY=7gJqgT3QVxkPtuP4YDSmiSDKZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 13, 2013 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-11-12
> ===============================
[..]
>        sh4 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/21b5a910e6a27fa1cb12d0002ffed7e6ed9d6c83/

The problem here is:
edit.c:(.text+0x1614): undefined reference to `libintl_gettext'

So seems gettext related.
I cannot yet reproduce this bug. I tried a limited build 'make
toolchain vim' and also 'make toolchain gettext vim', but both work
fine with that same defonfig.

Interestingly, the autobuild configure output says:
checking for NLS... gettext() works
while in my reproduction it says:
checking for NLS... gettext() works with -lintl

This is a difference I cannot explain. I'm currently trying a full
rebuild, but any input in the mean time is welcome...


>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/789c9d424ec8cf57e7a96aa567ffad0c089ffb8f/

This is the same problem as reported here:
https://bugs.webkit.org/show_bug.cgi?id=113638
but for now there is no full solution yet. It seems powerpc is not
properly supported in webkit at the moment.

Best regards,
Thomas
