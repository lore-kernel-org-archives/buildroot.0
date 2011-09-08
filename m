From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Sep 2011 11:00:05 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <4E687A46.1000705@free-electrons.com>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <201109071822.51608.arnout@mind.be> <4E687A46.1000705@free-electrons.com>
Message-ID: <201109081100.05554.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [I really should stop replying to this thread ;-)]
On Thursday 08 September 2011 10:18:14, Maxime Ripard wrote:
> >  AFAICS it does three things:
> > - make device nodes (mknod)
> > - change permissions (chmod)
> > - set ownership (chown)
> >
> > 
> >  So skeleton is not really the right term, as it only refers to the
> >mknod 
> >
> > function again.  (Although not-yet-existing files and directories are
> > created,  that's not usually the main purpose for files and
> > directories.)
> 
> In device_table.txt, it also creates the whole basic filesystem
> hierarchy, with folders (such as /dev) and files (such as /etc/shadow).
> So you will have to add mkdir and touch to your list. That is why is was
> going for skeleton,

 Both /dev and /etc/shadow are (usually) copied from fs/skeleton, 
device_table.txt only updates the permissions.  I guess the /dev and /etc 
lines in device_table.txt are a bit redundant...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
