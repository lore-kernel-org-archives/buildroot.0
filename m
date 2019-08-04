From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 15:46:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/assimp: needs wchar
In-Reply-To: <20190804115503.3316-1-fontaine.fabrice@gmail.com>
References: <20190804115503.3316-1-fontaine.fabrice@gmail.com>
Message-ID: <20190804154607.612edf27@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 13:55:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/d989f895efe05dd5d1e2594d2dc38e9fc476e0d3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/assimp/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

The build failures come from the rapidjson headers, so I'm wondering if
the BR2_USE_WCHAR dependency shouldn't be in rapidjson.

Could you check that ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
