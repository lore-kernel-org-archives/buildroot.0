From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2020 12:31:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: add netjson plugin
In-Reply-To: <20200112222754.3769908-1-fontaine.fabrice@gmail.com>
References: <20200112222754.3769908-1-fontaine.fabrice@gmail.com>
Message-ID: <20200113123112.28bdfa95@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jan 2020 23:27:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add netjson plugin, available since version 0.9.5 and
> https://github.com/OLSR/olsrd/commit/64c00288f8e87d314a723e20c2dd69f1165f1645
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/olsr/olsr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. While reviewing this patch, I noticed
olsr.mk uses shell "for" loops for the build/installation of plugins.
Unfortunately, it is done in a way that will ignore errors if one of
the plugins fails to build or install, which is not great. It would be
nice to change these loops to make "foreach" loops, which will
automatically abort if one iteration of the loop returns a non-zero
error code.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
