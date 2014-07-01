From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 01 Jul 2014 16:08:43 -0300
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
 mainly affecting toolchain
In-Reply-To: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53B3073B.8090005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2014 03:02 PM, Thomas Petazzoni wrote:

> Hello,
> 
> This set of patches proposes a certain number of deprecation or
> removal. They are mostly independent from each other:

Hi, let's see each point.

>  - Deprecation of the AVR32 architecture.

+1 from me, it's a dead-end and i've been (not secretly) hoping for this.

>  - Removal of old binutils versions
>  - Removal of uClibc 0.9.32.1
>  - Removal of gcc 4.3.x and 4.6.x
>  - Removal of gdb 7.4 and 7.5
>  - Removal of busybox version selection

All of these should follow the deprecation guidelines i think?
Busybox in particular should keep at least a previous version around,
because there have been cases of .0 releases being quite broken.
Maybe patches show up soon but they don't follow a release schedule like
we do and there could be problems with that.
Also punching a hole in gcc version continuity even though logical
sounds dirty (and really they aren't stopping any features other than
missing atomics in old versions).
Regards.
