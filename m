From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 22:21:34 +0100
Subject: [Buildroot] [PATCH 2/2] fastd: add new package
In-Reply-To: <1446102782-4565-2-git-send-email-post@lespocky.de>
References: <1446102782-4565-1-git-send-email-post@lespocky.de>
 <1446102782-4565-2-git-send-email-post@lespocky.de>
Message-ID: <20151104222134.792979c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Dahl,

On Thu, 29 Oct 2015 08:13:02 +0100, Alexander Dahl wrote:
> This is a new package for the fastd "Fast and Secure Tunneling Daemon"
> which was developed for the Freifunk Gluon project in the first place.
> It's one of my first buildroot packages and I tried to follow the
> developer guide, if something can be improved I'm open for suggestions.
> I hope I covered the necessary build options and set reasonable
> defaults. Included is a patch to allow cross compiling with toolchains
> without LTO support which fails with the unpatched version due to some
> ugly cmake hacks in fastd v17, details in the patch.

This commit log again contained some "personal" messages, so I reworded
it.

I also did a few other changes:

    [Thomas:
     - Get rid of trailing spaces in Config.in
     - Remove the BR2_PACKAGE_FASTD_OPENSSL, and simply rely on
       BR2_PACKAGE_OPENSSL
     - Remove -DWITH_CAPABILITIES=TRUE, since libcap support is anyway
       mandatory.
     - Use ON/OFF instead of TRUE/FALSE.]

and then applied your patch.

Could you submit your LTO related patch to the upstream project and get it merged, so that next time we update the fastd package we can get rid of the patch?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
