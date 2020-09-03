From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:01:20 +0200
Subject: [Buildroot] [PATCH] package/alsa-utils: fix install if
 directories exist
In-Reply-To: <20200903133533.2505458-1-john@metanate.com>
References: <20200903133533.2505458-1-john@metanate.com>
Message-ID: <20200903210120.0f4642ba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Sep 2020 14:35:33 +0100
John Keeping <john@metanate.com> wrote:

> "mkdir" (without "-p") fails if the target directory exists, which means
> that if alsa-utils is being reinstalled or if other files have
> previously been installed in the alsa-state.d or alsa-restore.d
> directories the installation will fail.
> 
> Switch to "$(INSTALL) -d" which allows us to be explicit about the
> permissions and handles the case of a pre-existing directory correctly.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/alsa-utils/alsa-utils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
