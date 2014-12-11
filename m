From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 00:08:23 +0100
Subject: [Buildroot] [PATCH] triggerhappy: new package
In-Reply-To: <1418079328-15550-1-git-send-email-peter@korsgaard.com>
References: <1418079328-15550-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141212000823.72d27f28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon,  8 Dec 2014 23:55:28 +0100, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                    |  1 +
>  package/triggerhappy/Config.in       | 10 +++++++++
>  package/triggerhappy/S10triggerhappy | 40 ++++++++++++++++++++++++++++++++++++
>  package/triggerhappy/triggerhappy.mk | 37 +++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+)
>  create mode 100644 package/triggerhappy/Config.in
>  create mode 100755 package/triggerhappy/S10triggerhappy
>  create mode 100644 package/triggerhappy/triggerhappy.mk

Thanks, applied, with two small changes:

    [Thomas:
      - add BR2_USE_MMU dependency, since fork() is used
      - rename do_start() and do_stop() to just start() and stop(), as we
        do in most init scripts in Buildroot.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
