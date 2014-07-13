From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Jul 2014 22:08:14 +0200
Subject: [Buildroot] [PATCH 10/10] busybox: support only one version
In-Reply-To: <20140710171848.75381ecb@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87oawxntvt.fsf@dell.be.48ers.dk>
 <20140710171848.75381ecb@free-electrons.com>
Message-ID: <53C2E72E.1090703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/14 17:18, Thomas Petazzoni wrote:
> On Thu, 10 Jul 2014 16:57:58 +0200, Peter Korsgaard wrote:
> 
>> > I wonder if time also hasn't come to get rid of
>> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?
> I don't know. We've been discussing multiple times the SHOW_OTHERS
> thing, and I believe each time our conclusion was that it's nice for
> beginners to have Buildroot hide the applications for which Busybox
> already provides a good alternative. I'm sure if we remove
> SHOW_OTHERS, we'll have gazillions of newcomers enabling bash,
> util-linux and millions of other things that aren't needed when you
> have Busybox. So I still believe that SHOW_OTHERS is a good thing to
> have.


 I disagree with this analysis. A newcomer who doesn't know about busybox will
most likely not know about coreutils, util-linux, etc. either. The only thing
that I can imagine that they would enable is bash. And to be honest, that's the
first thing I do when I build a system with more than 4MB of flash to spare...

 So, for me it would be enough to indicate that a package has an equivalent in
busybox. E.g.:

util-linux (also in busybox)
bash (busybox provides ash)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
