From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 16:09:41 +0100
Subject: [Buildroot] [PATCH 1/1] xdotool: new package
In-Reply-To: <1451354367-26073-1-git-send-email-nunes.erico@gmail.com>
References: <1451354367-26073-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20151229160941.52b31100@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Erico Nunes,

On Mon, 28 Dec 2015 23:59:27 -0200, Erico Nunes wrote:
> xdotool is a command-line X11 automation tool.
> 
> http://www.semicomplete.com/projects/xdotool
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/xdotool/Config.in    | 11 +++++++++++
>  package/xdotool/xdotool.hash |  2 ++
>  package/xdotool/xdotool.mk   | 24 ++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/xdotool/Config.in
>  create mode 100644 package/xdotool/xdotool.hash
>  create mode 100644 package/xdotool/xdotool.mk

I've applied after doing a few changes:

    [Thomas:
     - fix <pkg>_LICENSE, as noticed by Baruch
     - use $(TARGET_MAKE_ENV).]

Also, I've submitted a pull request to the original project to allow
the LDCONFIG variable to be overridden so that ultimately we should be
able to use 'make install'. See
https://github.com/jordansissel/xdotool/pull/90.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
