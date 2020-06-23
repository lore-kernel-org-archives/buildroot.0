From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Jun 2020 14:24:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: new package
In-Reply-To: <CAJe0E3dU52qyQ_=eVN+1xtD8b1Kiwe=RZ7zvjpYfhZ8CDJinfQ@mail.gmail.com>
References: <20200622105359.31340-1-guillaume.bressaix@gmail.com>
 <20200622222743.4643d71d@windsurf.home>
 <CAJe0E3dU52qyQ_=eVN+1xtD8b1Kiwe=RZ7zvjpYfhZ8CDJinfQ@mail.gmail.com>
Message-ID: <20200623142424.5b6fc774@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Jun 2020 11:01:30 +0200
Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> Let's say I introduce a "BR2_PACKAGE_LIBNIDS_WITH_LIBNET" option,

As you discovered and replied later in the thread, don't add a
sub-option: simply check in the .mk file if BR2_PACKAGE_LIBDNET is
enabled.

> if I add a 0002-patch to also have libnet checked with pkg-config,
> Is it fine with you having a patch always applied, even though we are in
> the --disable-libnet context?

The patches should always all be applied. In theory, all patches are
supposed to be submitted to the upstream project, and the upstream
project will not conditionally apply the patch depending on whether
libnet support is enabled or not.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
