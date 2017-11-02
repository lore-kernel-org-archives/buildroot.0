From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 2 Nov 2017 11:26:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-11-01
In-Reply-To: <20171102070005.79F7021D67@mail.free-electrons.com>
References: <20171102070005.79F7021D67@mail.free-electrons.com>
Message-ID: <27b962f2-9a22-bef6-3c51-b8e5da34cb67@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 02/11/2017 08:00, Thomas Petazzoni wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-11-01, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          arc |                     gpm-1.20.7 | http://autobuild.buildroot.net/results/15e24f8c6a3ad2bfd198cc4fb094aeace7d1ee6a
>          arc |                     gpm-1.20.7 | http://autobuild.buildroot.net/results/7c24edc1af7dabd2b401e750add1eccaaab8961a
>

Build failures are due to undefined __sigemptyset(). After quick
investigation it seems that the include file defining this macro
(include/bits/sigset.h) is no more present in glibc-2.26.
From glibc Changelog, file seems deleted since 2017-05-20.

gpm builds fine with glibc-2.23 and uclibc-1.0.26.
No one else is impacted ?

Best regards,
Julien
