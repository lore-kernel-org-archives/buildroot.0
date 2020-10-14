From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 00:11:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: add introspection
 support
In-Reply-To: <20200924190614.1409319-1-fontaine.fabrice@gmail.com>
References: <20200924190614.1409319-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015001142.2b65a115@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Sep 2020 21:06:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add introspection support to harfbuzz otherwise activation of
> introspection in pango 1.46.1 will fail on:
> 
> Couldn't find include 'HarfBuzz-0.0.gir' (search path: '['/home/naourr/work/instance-2/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '/home/naourr/work/instance-2/output-1/host/share/gir-1.0', '/home/naourr/work/instance-2/output-1/host/share', '/home/naourr/.local/share/flatpak/exports/share/gir-1.0', '/var/lib/flatpak/exports/share/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/naourr/work/instance-2/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3357225ee2d8392bfd57af91cde04a1113e03493
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...allow-introspection-when-cross-compi.patch | 33 +++++++++++++++++++
>  package/harfbuzz/harfbuzz.mk                  | 13 ++++++--
>  2 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
