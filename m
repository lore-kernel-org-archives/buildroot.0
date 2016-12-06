From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 19:55:55 +0100
Subject: [Buildroot] [PATCH 1/1] ffmpeg: fix build for ffplay
In-Reply-To: <1481034757-24066-1-git-send-email-phil@zankapfel.net> (Phil
 Eichinger's message of "Tue, 6 Dec 2016 15:32:37 +0100")
References: <1481034757-24066-1-git-send-email-phil@zankapfel.net>
Message-ID: <878trskhtw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

 > Upstream has dropped SDL support for ffplay in favor of SDL2.
 > This results in silently not building ffplay even if it is selected
 > in Buildroot config.

 > Signed-off-by: Phil Eichinger <phil@zankapfel.net>
 > ---
 >  package/ffmpeg/Config.in | 2 +-
 >  package/ffmpeg/ffmpeg.mk | 4 ++--
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
 > index e813595..075ac12 100644
 > --- a/package/ffmpeg/Config.in
 > +++ b/package/ffmpeg/Config.in
 > @@ -41,7 +41,7 @@ config BR2_PACKAGE_FFMPEG_FFMPEG
 >  config BR2_PACKAGE_FFMPEG_FFPLAY
 >  	bool "Build ffplay"
 >  	select BR2_PACKAGE_FFMPEG_SWSCALE
 > -	select BR2_PACKAGE_SDL
 > +	select BR2_PACKAGE_SDL2

You forgot to propagate the !static dependency of sdl2. Committed after
fixing that, thanks.

-- 
Bye, Peter Korsgaard
