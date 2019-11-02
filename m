From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:25:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/grantlee: fix build with Qt 5.x
In-Reply-To: <20191101105906.21219-1-fontaine.fabrice@gmail.com>
References: <20191101105906.21219-1-fontaine.fabrice@gmail.com>
Message-ID: <20191102222519.41d68653@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri,  1 Nov 2019 11:59:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/f0ec288fe47b6e8cf16179e3f281cf9caebb8fe9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/grantlee/grantlee.mk | 5 +++++
>  1 file changed, 5 insertions(+)

To be honest, I am not sure this is the most correct fix. Indeed,
Grantlee's build system should itself know that Qt5 needs C+11 support,
and therefore add the appropriate compiler flags.

However, for the sake of fixing the issue immediately, I've applied the
patch as-is, as well as your PATCH 2/2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
