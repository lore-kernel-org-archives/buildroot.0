From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:21:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/netopeer2: add patch to solve
 issue with empty group name
In-Reply-To: <20200824124147.23051-1-heiko.thiery@gmail.com>
References: <20200824124147.23051-1-heiko.thiery@gmail.com>
Message-ID: <20200824222109.4aa6b63d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 14:41:47 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> When building on a host that has no name specified for the used group in
> /etc/group the script in install step will fail due to missing group name.
> 
> CMake Error at CMakeLists.txt:80 (message):
>   Learning server module group failed: id: cannot find name for group ID 8000
> 
> The patch was taken from upstream and modified manually because of merge
> conflicts.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f197ca1def9dc1292e1e784757f2da9d95484431/
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...support-using-current-user-for-SR-mo.patch | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 package/netopeer2/0003-scripts-FEATURE-support-using-current-user-for-SR-mo.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
