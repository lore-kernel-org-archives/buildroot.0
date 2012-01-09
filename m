From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Jan 2012 07:37:55 +0100
Subject: [Buildroot] [PATCH 2/3] Rework of the init system
In-Reply-To: <4F06BBC2.6050002@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <201201060813.26133.arnout@mind.be> <4F06BBC2.6050002@free-electrons.com>
Message-ID: <201201090737.55064.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 06 January 2012 10:15:46 Maxime Ripard wrote:
> >> From what I understood of it, if init scripts are presents, systemd will
> >> check the name to see if it has a unit for this, and will prefer the
> >> unit if it has one. But I'm not sure how it will behave with our way of
> >> naming the init scripts.
> > 
> >  That's something else: buildroot should install only one set of init 
> > scripts, either sysv or systemd.  If you really want both, you'll have
> > to put it in the skeleton.
> 
> I agree, but you seem to say otherwise in your other mail from today. To
> me, there is no need for us to add a fallback to sysv scripts. You will
> be in one of the three cases :
>   - You use sysvinit or busybox and the package has a sysv script: Great
>   - You use systemd and the package has no systemd unit file: Send a patch
>   - You use systemd and the package has a systemd unit file: Great
> 
> As simple as that.

 OK, fair enough.  No fallback sysv scripts needed, then.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120109/3eb8660a/attachment-0001.html>
