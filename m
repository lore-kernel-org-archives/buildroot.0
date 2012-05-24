From: Will Newton <will.newton@gmail.com>
Date: Thu, 24 May 2012 15:18:33 +0100
Subject: [Buildroot] appreciate S49ntp advice
In-Reply-To: <CALo-6+ghsnURLrm8ALtkd-snN9WJT+G9=tRHiwzMQ2t8X2owUA@mail.gmail.com>
References: <CALo-6+ghsnURLrm8ALtkd-snN9WJT+G9=tRHiwzMQ2t8X2owUA@mail.gmail.com>
Message-ID: <CAFbHwiQGSZfMvxykSao=gh55TtADvbwgbdMMiw413QDx_5YaSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 24, 2012 at 3:11 PM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> I have an MPC8321 target and am having a little trouble with one file.
> We have a modified version of /etc/init.d/S49ntp in SVN and it is in
> fs/skeleton/etc/init.d no problem.
>
> But, ... when we do a make clean && make, it seems that the building
> of the ntp package itself copies the original S49ntp into
> output/target/etc/init.d/
>
> The question becomes how to deal with this issue properly.

If you add a post build script (BR2_ROOTFS_POST_BUILD_SCRIPT) then you
can copy over a replacement file or modify the existing one with e.g.
sed.
