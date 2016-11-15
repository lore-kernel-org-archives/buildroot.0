From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2016 22:39:32 +0100
Subject: [Buildroot] Buildroot error
In-Reply-To: <D3FA0BA2E2AD54469423D3A670F43027238ED2AB@mail.protoprod.local>
References: <D3FA0BA2E2AD54469423D3A670F43027238ED2AB@mail.protoprod.local>
Message-ID: <8dee00da-0ff9-66de-2baf-c0b1f39dc96e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-11-16 22:11, Michael Brainerd wrote:
> I have a build error that I am unable to find documentation to debug the issue. 
> See attached build error text, and .config file.
> 
[snip the notice that I shouldn't read your mail]

> >>>> linux-headers custom Syncing from source dir /home/mikeb/sandbox/buildroot-2016.08/uClinux-dist
> rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/mikeb/sandbox/buildroot-2016.08/uClinux-dist/ /home/mikeb/sandbox/buildroot-2016.08/output/build/linux-headers-custom

 Either the linux tree in uClinux-dist is so old that it doesn't have the
"headers_install" target yet (I think that's from 2.6.10-ish), or the tree
you're pointing to is not actually a linux tree. In the first case, you also
misconfigured your kernel headers, because you claim it's 4.7. But you probably
just took the first thing you saw :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
