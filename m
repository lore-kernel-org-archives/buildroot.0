From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 10:45:10 +0100
Subject: [Buildroot] [RFC PATCH 4/6] apply-patches.sh: directories are
	considered as a collection of patches
In-Reply-To: <20120216084953.GB2943@ldesroches-Latitude-E6320>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <20120215165104.GI4723@ldesroches-Latitude-E6320>
 <20120216084953.GB2943@ldesroches-Latitude-E6320>
Message-ID: <201202161045.11127.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 09:49:53 Ludovic Desroches wrote:
> I mean I don't know which parameters will be passed to apply-patches but I
> worry about having package/foo/ (with some version directories into it) as
> parameter and then explore and apply all the patches contained into this tree.

 I don't think that's an issue, because apply-patches will be called with 
*.patch as a pattern - the version-specific directories will not be called
*.patch.


> I would like to keep it because I was thinking of debian-patches like: a
> structure with several directories where we may find some patches. From the
> top of my head I think it's not the case for debian-patches because patches
> are located at the root level but I presume that we could face this kind of
> patch.

 If you don't have a concrete use case, I would leave this feature out.
Otherwise you don't even know if it does work in practice.  We can always
add the feature again later if it turns out to be required.

 ThomasDS (in CC) has a use case of a tar file containing patches.  Maybe
he has a concrete use case.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
