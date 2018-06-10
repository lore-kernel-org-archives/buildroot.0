From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 15:01:15 +0200
Subject: [Buildroot] [PATCH 1/1] adding-packages-cargo.txt: remove
 host-cargo select
In-Reply-To: <20180607180327.12308-1-fontaine.fabrice@gmail.com>
References: <20180607180327.12308-1-fontaine.fabrice@gmail.com>
Message-ID: <20180610150115.07ed9688@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jun 2018 20:03:27 +0200, Fabrice Fontaine wrote:
> Remove select BR2_PACKAGE_HOST_CARGO from Config.in
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

In fact, I don't agree with this change. Cargo packages are going to
use host-cargo, so it makes sense for them to select.

Today, it is not mandatory for a host package to be selected at the
Config.in level to have it built, and we don't enforce this. But it is
actually more logical to do it, and in line with our long-term idea of
having Config.in options for all host packages.

So, in fact I prefer your original patch, and I disagree with Baruch
statement that we shouldn't do the select. Yes, it is not /needed/, but
it is more correct with the select.

Best regards,

Thoms
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
