From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:24:17 +1300
Subject: [Buildroot] [PATCH] ocrad: bump to version 0.25
In-Reply-To: <1483797971-30421-1-git-send-email-gilles.talis@gmail.com>
References: <1483797971-30421-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20170125232417.07a59e73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Jan 2017 15:06:10 +0100, Gilles Talis wrote:

> +define OCRAD_EXTRACT_CMDS
> +    $(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(OCRAD_SOURCE) | \
> +    tar --strip-components=1 -C $(@D) -xf -

I've fixed the indentation to use tabs, and replaced the hardcoded -xf
by $(TAR_OPTIONS).

Applied with those changes. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
