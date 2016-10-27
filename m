From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Oct 2016 01:11:57 +0200
Subject: [Buildroot] [PATCH] core/download: remove support for special
 git refs
In-Reply-To: <1879889648.3139938.1477565005989.JavaMail.zimbra@datacom.ind.br>
References: <1477512489-14710-1-git-send-email-yann.morin.1998@free.fr>
 <87d1imsq36.fsf@ketchup.i-did-not-set--mail-host-address--so-tickle-me>
 <20161027091027.6410d400@free-electrons.com>
 <1879889648.3139938.1477565005989.JavaMail.zimbra@datacom.ind.br>
Message-ID: <18d7ba07-74b0-d144-4f74-79fdbcdd5aba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-10-16 12:43, Carlos Santos wrote:
>> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
[snip]
>> And this is bogus, and precisely why we don't want to support such
>> thing. Github pull request and Gerrit change references are moving, so
>> a given Github pull request can one day contain a given version of the
>> code, and the next day a different version of the code. Hence you're
>> giving your customers something that is not reproducible. Not good.
> 
> I'm not sure about Github pull requests but Gerrit change-ids could not
> be used in <pkg>_VERSION because they are not valid Git commit-ids.
> 
> Each patchset in a Gerrit change has a unique commmit-id, which is not
> a moving reference. It be referred to ether by a SHA-1 or by an explicit
> path like "refs/changes/70/24070/1". The later is ugly but still unique
> and will be saved be saved as 
> 
>    $(DL_DIR)/<pkg>-refs_changes_70_24070_1.tar.gz

 But this doesn't require any special handling in the git download helper, it's
a ref like any other. The special handling is for sha1's that refer to something
that is not in a published branch or tag.

 Actually, ideally we would want to just handle sha1 and nothing else. But git
doesn't make that easy, unfortunately.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
