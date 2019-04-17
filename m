From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:56:53 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix loops relaxation in
 bare sections
In-Reply-To: <20190411205549.7259-1-jcmvbkbc@gmail.com>
References: <20190411205549.7259-1-jcmvbkbc@gmail.com>
Message-ID: <20190417085653.1b7cc5c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Apr 2019 13:55:49 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> The commit 197b5f9d1c23 ("package/binutils: fix loops relaxation in
> xtensa gas") changed the way loop opcodes are relaxed resulting in build
> failures in hand-made assembly code that has loops in sections without
> .literal_position pseudo op or equivalent construct. This e.g. breaks
> xtensa linux kernel build.
> 
> Fix that by adding literal position to the beginning of every section.
> 
> Fixes: 197b5f9d1c23 ("package/binutils: fix loops relaxation in xtensa
> gas")
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...as-put-.literal_position-at-section-start.patch | 96 ++++++++++++++++++++++
>  ...as-put-.literal_position-at-section-start.patch | 96 ++++++++++++++++++++++
>  2 files changed, 192 insertions(+)
>  create mode 100644 package/binutils/2.31.1/0017-xtensa-gas-put-.literal_position-at-section-start.patch
>  create mode 100644 package/binutils/2.32/0005-xtensa-gas-put-.literal_position-at-section-start.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
