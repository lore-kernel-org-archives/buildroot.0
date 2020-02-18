From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 03:50:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/gutenprint: add back the hook
 for creating the m4local directory
In-Reply-To: <20200217225202.1640973-1-fontaine.fabrice@gmail.com>
References: <20200217225202.1640973-1-fontaine.fabrice@gmail.com>
Message-ID: <20200218035039.331cfa0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 23:52:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 64c42c5e2c26261e26c3548c86b02f55d12f341b removed the hook for
> creating the m4local directory with the assumption that it would be
> created because the first include is treated in a special way if it
> doesn't exists
> 
> However, this assumption was wrong as m4local is the second include, the
> first one is m4 (which already exists in the archive). So put back the
> hook. The other solutions would be to patch:
>  - Makefile.{am,in} to remove m4local
>  - configure.ac and Makefile.{am,in} to add m4local before m4
> However, both solutions don't seem to be upstreamable
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e40313c6ec193d6156e26eff62303545fba09413
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gutenprint/gutenprint.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
