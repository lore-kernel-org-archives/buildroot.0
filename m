From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 25 Nov 2011 12:07:31 -0500
Subject: [Buildroot] [PATCH 2/2] ruby: fix host build breakage
In-Reply-To: <1322220912-20268-2-git-send-email-gustavo@zacarias.com.ar>
References: <1322220912-20268-1-git-send-email-gustavo@zacarias.com.ar>
 <1322220912-20268-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAHUNapSE2JNQ7siBttu2339S51TM-tS3JVsHAeV9oudv2k8B-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 25, 2011 at 6:35 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> When building host-ruby with ncurses enabled on an x86_64 host we get a
> "relocation R_X86_64_32 against `_nc_globals' can not be used when making
> a shared object; recompile with -fPIC" error when building.
> Just disable ncurses and readline support for the host version - we
> don't need it.

I get the same "_nc_globals" error you are seeing when I try to add
the ruby package to the build. I can confirm this patch allows the
build of ruby to succeed.

I'm not able to reproduce the problem you're fixing with your first
patch (--disable-rpath) so I can't confirm its effectiveness.

Tested-by: Trevor Woerner <twoerner@gmail.com>
