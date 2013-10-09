From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:02:28 +0200
Subject: [Buildroot] using a local package file : why copy it to the dl
 directory ?
In-Reply-To: <22B9374628844ED0809C78AC328E71C5@JohanW7>
References: <22B9374628844ED0809C78AC328E71C5@JohanW7>
Message-ID: <52557E14.3040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 00:19, Sagaert Johan wrote:
> Hi
>
>
> I noticed when using SITE_METHOD = file, the package is copied to the download directory.
> Is this needed, since the package is already on our local filesystem ?

  It seems the other two repliers missed your point :-)

  There is no fundamental need to copy it. However, it makes buildroot a 
lot simpler. In many places there are direct references to DL_DIR (just 
grep for that variable); in case of a file SITE_METHOD, you'd have to use 
$(PKG)_SITE instead of DL_DIR.

  It is possible to use hardlinking or symlinking instead of copying. 
Buildroot provides the BR2_LOCALFILES config option for that (in Build 
options -> Commands). Just set that to "ln" for hard linking or "ln -s" 
for symlinking.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
