From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Jun 2018 23:26:31 +0200
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
In-Reply-To: <20180610083544.GC2471@scaer>
References: <20180609094647.21460-1-yann.morin.1998@free.fr>
 <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
 <20180610081217.GB2471@scaer> <20180610083544.GC2471@scaer>
Message-ID: <6ae94404-f520-e719-680d-686baf6f9659@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-06-18 10:35, Yann E. MORIN wrote:
> Carlos, Arnout, All,
> 
> On 2018-06-10 10:12 +0200, Yann E. MORIN spake thusly:
>> On 2018-06-09 19:20 -0300, Carlos Santos spake thusly:
> [--SNIP--]
>>> Packages are supposed to install, remove or modify files in the global
>>> $(TARGET_DIR) hierarchy.
> 
> I forgot to say that this will no longer be true when we (eventually)
> introduce the top-level parallel build, because, as Arnout already said,
> each package will install in its own, private copy of TARGET_DIR, not
> only that, but also its private STAGING_DIR and HOST_DIR as well.
> 
> One thing that Arnout suggested, is to (mostly) get rid of TARGET_DIR,
> in favour of a package-prefix FOO_TARGET_DIR (amd similarly for
> filesystems).
> 
> However I still don't think that is a good idea, because that would
> allow packages to easily find and write into another package's
> TARGET_DIR. Using a single TARGET_DIR, instead, will make it harder
> (but not impossible, agreed).

 How does the definition of TARGET_DIR have any influence on how fs/foo/foo.mk
uses ROOTFS_BAR_TARGET_DIR?


> Ditto filesystems.
> 
> So I believe we still want to keep a context-specific TARGET_DIR. It is
> easier to use,

 TARGET_DIR is only marginally easier to use than FOO_TARGET_DIR...


> it is more stable,

 ???

 You actually may have a point here, but I don't understand it.

> we can update it at will

 We can also update the definition of FOO_TARGET_DIR at will.


, and it makes it harder for packages and filesystems to do weird stuff.

 No it doesn't.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
