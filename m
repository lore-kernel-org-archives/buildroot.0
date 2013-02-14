From: Joe Halpin <jhalpin@luminatorusa.com>
Date: Thu, 14 Feb 2013 08:29:36 -0600
Subject: [Buildroot] [PATCH] add pre-build script. Patch v2
In-Reply-To: <511CF47A.7050004@mind.be>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
 <05255DE50A102443A25D42F2CCAC151FA58C27@LUMEXCH.luminatorusa.com>
 <511CF47A.7050004@mind.be>
Message-ID: <05255DE50A102443A25D42F2CCAC151FA58C28@LUMEXCH.luminatorusa.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No, just hit thee wrong button, sorry. I've copied the list here

thanks
Joe

-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: Thursday, February 14, 2013 8:28 AM
To: Joe Halpin
Subject: Re: [Buildroot] [PATCH] add pre-build script. Patch v2


  You didn't reply to the list, was that intentional?

  Regards,
  Arnout

On 14/02/13 15:24, Joe Halpin wrote:
> In our environment we have a standardized directory for downloaded
> source tarballs. The location of the build tree for each developer can
> vary on each of their machines. For example, one developer might put
his
> development tree under his home directory, another under /opt or some
> other base.
> So one use case would be to figure out the full path to the tarball
> directory before the build, and create a symlink in place of the dl
> directory which points to the central location.
> We have been using the menuconfig option to define the source download
> directory (Build options-> Download dir), but (since we can't predict
> the absolute path to the download directory) this requires us to keep
> all buildroot directories at the same level from the project base, and
> use a relative path. That becomes inconvenient when we tag release
> candidates, because we'd like to have a version directory added to the
> path to the tagged directory. For example, the path to trunk might be
>
> /opt/dev/<project>/trunk/module1 (module2 ...)
>
> But the path to a tag would have to be at the same level, so we wind
up
> with
>
> /opt/dev/<project>/tags/module1-v1
>                          module1-v2
>                          module2-v1
>                          module2-v2
>
> etc, when what we'd like to have is
>
> /opt/dev/<project>/tags/version-1.0/module1 (module 2 ...)
> /opt/dev/<project>/tags/version-1.1/module1 (module 2 ...)
>
> and so forth. This isn't at the same level as the trunk though, so the
> path to the source tarballs has to be absolute.
> I probably could have explained that better, if it's not clear I'll
try
> again.
> Sorry about the patch, this is my first time submitting one. I'll redo
> it with the changes you asked for.
> One question though about the TARGET_DIR. My script doesn't care about
> it so I missed that. What would you suggest I use instead? I was
> thinking about using the current directory (./), which at that point I
> believe would be the base buildroot directory.
>
> Also, sorry about top-posting, I'm condemned to use Outlook here,
which
> doesn't quote things properly.
> Thanks
> Joe
>
> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Wednesday, February 13, 2013 4:24 PM
> To: Joe Halpin
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] add pre-build script
>
> On 13/02/13 14:54, Joe Halpin wrote:
>> This is a patch to add a pre-build script, which runs before the
build
>> starts. This lets us setup symlinks and such before the build starts,
>> which makes things easier and cleaner for us. Maybe it will for other
>> people too. This was made from the 20.12.11 release.
>
>    Could you clarify a bit more what the use case is? Then we can
> consider
> if there are maybe better ways to achieve it.
>
>
>    Also, a properly formatted patch has a commit message which is
> formatted as follows: a single summary line of max. 80 characters, an
> empty line, one or more paragraphs explaining why the patch is
> necessary,
> your Signed-off-by line, a line containing three dashes, the patch
> changelog (if you resubmit it). Look at other patches on the list for
> examples. And you should send the patch with git send-email or
similar,
> so that whitespace is retained and we can comment in-line.
>
>
>    Regarding the patch itself: why do you pass $(TARGET_DIR) as an
> argument? Since the 'dirs' step comes after the 'prepare' step,
> $(TARGET_DIR) doesn't exist yet...
>
>
>    Regards,
>    Arnout
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
