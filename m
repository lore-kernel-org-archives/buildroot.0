From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 May 2016 14:05:11 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <5738333D.8010707@gmail.com>
References: <5738116B.9050904@gmail.com> <20160515100303.003752e2@gmx.net>
 <5738333D.8010707@gmail.com>
Message-ID: <20160515140511.5973b7ce@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Sun, 15 May 2016 10:28:45 +0200, Marco Trapanese <marcotrapanese@gmail.com> wrote:

> Il 15/05/2016 10:03, Peter Seiderer ha scritto:
> > This means the header files etc. which are installed into the staging 
> > directory (and not into the target directory) which Qt needs to detect 
> > and compile with GStreamer support... 
> 
> Thus, those files are needed only during the build process, they don't 
> need to be copied to the target, do they?
> 

Yes...

> I found a config.log in my qt5multimedia-5.6.0 output/build/ directory. 
> It is attached to this email. It seems the gstreamer tests were 
> successfully. Furthermore in the plugins/mediaservice subdirectory I find:
> 
> libgstaudiodecoder.so
> libgstcamerabin.so
> libgstmediacapture.so
> libgstmediaplayer.so
> 
> which are installed on target under /usr/lib/qt/plugins/mediaservice/
> 
> By the way, on target their size is slightly smaller. This is because 
> they are stripped or perhaps this may lead to an hidden problem? (just 
> to be sure I tried to copy them to the target but the behavior is the same).
> I can rebuild all from scratch, but if it's correct it would be useless!

Yes the target files are stripped (to remove possible debug/linking information
size overhead, but should not change functionality)...

> 
> What else I should check?

Would suspect some missing library....maybe I find some time tonight to
do some local test to check/verify your problem...

Regards,
Peter

> Best regards
> Marco
> 
