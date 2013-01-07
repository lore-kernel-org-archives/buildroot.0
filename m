From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 22:31:28 +0100
Subject: [Buildroot] [PATCH v2 2/6] polkit: new package
In-Reply-To: <1357591399-3566-3-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20130107223128.08122d67@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Mon,  7 Jan 2013 21:43:15 +0100, Marek Belisko wrote:

> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_EXPAT

You should have:

        depends on BR2_USE_WCHAR # gettext

here, because libglib2 has this dependency.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
