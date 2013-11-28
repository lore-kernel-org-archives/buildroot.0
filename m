From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 17:23:57 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
Message-ID: <20131128172357.1417a881@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 28 Nov 2013 14:24:35 +0100, Samuel Martin wrote:

> In this new version of this patch set, the all target and host
> packages entries end up under the "Target packages" menu.
> In my use of this feature, I also have a couple of host tools to
> integrate. So, how about having adding the following source line in
> package/Config.in.host:
> ---
> source "$BR2_EXTERNAL/package/Config.in.host"
> ---
> Of course, this requires to add an
> empty support/dummy-external/package/Config.in.host file.

This means the user would always have to create both package/Config.in
and package/Config.in.host, which gets annoying. That's why in the v2 I
did include $(BR2_EXTERNAL)/Config.in, without enforcing a
$(BR2_EXTERNAL)/package/ subdirectory, and leave more freedom to the
user. However, several people at the ELCE meeting said that we should
enforce the package/ directory, and therefore only include
$(BR2_EXTERNAL)/package/Config.in.

Just curious, why can't you simply add your host packages also in
$(BR2_EXTERNAL)/package/Config.in ? It's not because the main Buildroot
doesn't do it this way that you can't do it in your BR2_EXTERNAL
directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
