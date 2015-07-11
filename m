From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 16:38:22 +0200
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <1436622071664-105281.post@n4.nabble.com>
References: <bug-8206-163@https.bugs.busybox.net/>
 <20150707210059.917A78015E@busybox.osuosl.org>
 <1436622071664-105281.post@n4.nabble.com>
Message-ID: <55A12A5E.4010900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 15:41, glscantlen wrote:
> to:	bugzilla at busybox.net
> date:	Thu, Jul 9, 2015 at 9:46 PM
> subject:	Re: [Bug 8206] mplayer uses host xorg development files
> mailed-by:	gmail.com
> 
> 
> Bernd,
> 
> I applied your patch and "make mplayer-reinstall" without the host's
> xorg-dev installed.
> still same issue.
> 
> I was not sure of the proper way to apply the patch within the buildroot
> env.
> So I applied it manually. What is the proper way to patch a <package>.mk?
> I did not think it would go into the
> package/0007-Add-additional-X11-dependencies.patch.

 No, you have to apply it directly to the buildroot tree:

cd <buildroot-dir>
patch -p1 < <patchfile>

 Regards,
 Arnout

> 
> 
> 
> 
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-8206-New-mplayer-uses-host-xorg-development-files-tp104861p105281.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
