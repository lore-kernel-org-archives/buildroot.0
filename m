From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 17 Apr 2009 06:43:22 -0300
Subject: [Buildroot] Qt Embedded build problem for x86 target (was Re: A new
	QTOPIA error)
Message-ID: <d6cda7730904170243v9ff8a13jcd7e70fe0b486264@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 14, 2009 at 4:44 PM, Luciano Greiner
<luciano.greiner@gmail.com> wrote:
> Hi. I installed a new basic debian host system to QTOPIA4. I've got no
> more g++ not found errors, but compilation fails with:
>

I built i686_defconfig with Qtopia enabled and was able to reproduce
his first bug with the g++@ missing.
The workaround was to add -platform linux-g++ to configure. I guess
Nokia/QtSoftware's configure script has a bug somewhere that during
x86 to x86 crosscompiling it's unable to figure out the proper
platform for the host tools.

The problem is, if we just commit this work around, then build would
fail for other hosts, such as freebsd, macos, etc.

Any Ideas?

Kind Regards,
    Thiago A. Correa
