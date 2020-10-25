From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:55:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: security bump to
 version 2.3.4
In-Reply-To: <20201025143912.1273561-1-fontaine.fabrice@gmail.com>
References: <20201025143912.1273561-1-fontaine.fabrice@gmail.com>
Message-ID: <20201025155550.5f736c19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 15:39:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-14382: A vulnerability was found in upstream release
> cryptsetup-2.2.0 where, there's a bug in LUKS2 format validation code,
> that is effectively invoked on every device/image presenting itself as
> LUKS2 container. The bug is in segments validation code in file
> 'lib/luks2/luks2_json_metadata.c' in function
> hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
> where the code does not check for possible overflow on memory allocation
> used for intervals array (see statement "intervals = malloc(first_backup
> * sizeof(*intervals));"). Due to the bug, library can be *tricked* to
> expect such allocation was successful but for far less memory then
> originally expected. Later it may read data FROM image crafted by an
> attacker and actually write such data BEYOND allocated memory.
> 
> https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.4-ReleaseNotes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
