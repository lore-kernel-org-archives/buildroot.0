From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:08:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/sdl_mixer: disable parallel
 build
In-Reply-To: <20191010185421.19153-1-fontaine.fabrice@gmail.com>
References: <20191010185421.19153-1-fontaine.fabrice@gmail.com>
Message-ID: <20191010220814.6b13379d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 20:54:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build sometimes fails on:
> Fatal error: can't create build/load_aiff.o: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c800ef60d8af0cd76f2f1de9aff573120ebd8ada
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sdl_mixer/sdl_mixer.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks. The issue could probably be fixed by adding
a dependency in $(objects) in the rules written by the configure.in
script. But oh well..

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
