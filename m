From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 4 Aug 2019 16:05:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/assimp: needs wchar
In-Reply-To: <20190804154607.612edf27@windsurf.home>
References: <20190804115503.3316-1-fontaine.fabrice@gmail.com>
 <20190804154607.612edf27@windsurf.home>
Message-ID: <CAPi7W80qOn-56Ogaqgogtf3VEmNicVzkuSaW=u9Z1Lf1gREW7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le dim. 4 ao?t 2019 ? 15:46, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun,  4 Aug 2019 13:55:03 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/d989f895efe05dd5d1e2594d2dc38e9fc476e0d3
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/assimp/Config.in | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> The build failures come from the rapidjson headers, so I'm wondering if
> the BR2_USE_WCHAR dependency shouldn't be in rapidjson.
Our old version of rapidjson (1.1.0 was released 3 years ago) does not
depend on wchar. This dependency was added in rapidjson by
https://github.com/Tencent/rapidjson/commit/6e2e5c7dbe08474249ca18b50da120b2c45ccc36.
This dependency on wchar was added in assimp when they bump their
internal rapidjson's version two years ago by
https://github.com/assimp/assimp/commit/65547d57606d9c9345b00d38271f3e499cee4001.
>
> Could you check that ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
