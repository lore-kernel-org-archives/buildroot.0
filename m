From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:16:44 +0100
Subject: [Buildroot] [PATCH] dbus: remove init script status op
In-Reply-To: <e13ba7be4cd326b90b0c71cc25b44718f18d8980.1485959689.git.baruch@tkos.co.il>
References: <e13ba7be4cd326b90b0c71cc25b44718f18d8980.1485959689.git.baruch@tkos.co.il>
Message-ID: <20170201211644.342aa3d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Feb 2017 16:34:49 +0200, Baruch Siach wrote:
> There is no status() shell routine in this script.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I think status() here was not necessarily meant to be a shell function.
Maybe it's supposed to be the status program, which is part of Upstart,
and allows to query the status of a service.

But since we don't use Upstart, it's indeed not going to work. Just
that your commit log is probably not 100% correct.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
