From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:40:59 +0200
Subject: [Buildroot] [PATCH 4/4] package/python-pymupdf: bump to version
 1.18.14
In-Reply-To: <20210630234717.21742-4-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
 <20210630234717.21742-4-raphael.melotte@mind.be>
Message-ID: <20210720234059.4dac4c16@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  1 Jul 2021 01:47:16 +0200
Rapha?l M?lotte <raphael.melotte@mind.be> wrote:

> Recent tarballs from PyPI use setuptools instead of distutils, so
> change `PYTHON_PYMUPDF_SETUP_TYPE`.
> 
> They also include a license file, so include it and a hash for it.
> 
> This version also has a new dependency: freetype2.
> 
> PYTHON_PYMUPDF_REMOVE_PATHS is updated to take the new dependency into
> account, but also the sed command are changed to delete include lines
> instead of turning them into empty strings. Indeed, empty include
> strings lead to using multiple `-I` flags which were not followed by
> anything. Depending on the number of empty include strings (because
> two successive `-I` "cancel" each other out), it would have failed to
> compile.
> 
> Also, it turns out the patch version of python-pymupdf doesn't have to
> match mupdf's version (e.g. python-pymupdf 1.18.14 is compatible with
> mupdf 1.18.*) so while at it, remove the word "exactly" from the
> comment.
> 
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>
> ---
>  package/python-pymupdf/Config.in           |  1 +
>  package/python-pymupdf/python-pymupdf.hash |  6 ++++--
>  package/python-pymupdf/python-pymupdf.mk   | 19 +++++++++++--------
>  3 files changed, 16 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
