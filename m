From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 14:26:39 +0200
Subject: [Buildroot] [PATCH v2 0/5] Improve performances and feedback of
 different
In-Reply-To: <20190719143556.14907-1-victor.huesca@bootlin.com>
References: <20190719143556.14907-1-victor.huesca@bootlin.com>
Message-ID: <20190801142639.122bf534@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this work on making pkg-stats faster, very nice!

On Fri, 19 Jul 2019 16:35:51 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (5):
>   support/scripts/pkg-stats: Use the 'multiprocess' fork instead of
>     'multiprocessing'

As said during our live discussion, I am not a big fan of using
multiprocess instead of multiprocessing. multiprocessing is in the
Python standard library, while multiprocess is an external module that
isn't even packaged in Fedora. Considering that the main (only?) reason
for using multiprocess over multiprocessing is simply to improve the
script logging, I don't think it's worth it.

>   support/scripts/pkg-stats: retrieve packages latest version using
>     processes
>   support/scripts/pkg-stats: add current progress in 'check_url_status'
>   support/scripts/pkg-stats: improve 'package_init_make_info'

I've however applied this particular patch, that is independent.

The other 4 patches are marked as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
