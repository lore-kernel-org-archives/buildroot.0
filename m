From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 17:23:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/assimp: needs wchar
In-Reply-To: <CAPi7W80qOn-56Ogaqgogtf3VEmNicVzkuSaW=u9Z1Lf1gREW7g@mail.gmail.com>
References: <20190804115503.3316-1-fontaine.fabrice@gmail.com>
 <20190804154607.612edf27@windsurf.home>
 <CAPi7W80qOn-56Ogaqgogtf3VEmNicVzkuSaW=u9Z1Lf1gREW7g@mail.gmail.com>
Message-ID: <20190804172302.1f4210ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 4 Aug 2019 16:05:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > The build failures come from the rapidjson headers, so I'm wondering if
> > the BR2_USE_WCHAR dependency shouldn't be in rapidjson.  
> Our old version of rapidjson (1.1.0 was released 3 years ago) does not
> depend on wchar. This dependency was added in rapidjson by
> https://github.com/Tencent/rapidjson/commit/6e2e5c7dbe08474249ca18b50da120b2c45ccc36.
> This dependency on wchar was added in assimp when they bump their
> internal rapidjson's version two years ago by
> https://github.com/assimp/assimp/commit/65547d57606d9c9345b00d38271f3e499cee4001.

Ah, ok, we use an internal version of rapidjson. Makes sense then.
Thanks for the clarification!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
