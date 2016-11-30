From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Nov 2016 07:34:08 +0200
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <43658324-6d70-5223-0d86-fb85c5a2d822@mind.be>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128220315.1924903c@free-electrons.com>
 <43658324-6d70-5223-0d86-fb85c5a2d822@mind.be>
Message-ID: <20161130053408.oihnna3ji5srul2u@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Nov 30, 2016 at 12:28:39AM +0100, Arnout Vandecappelle wrote:
> On 28-11-16 22:03, Thomas Petazzoni wrote:
> > On Mon, 28 Nov 2016 11:32:31 +0100, Damjan Marion wrote:
> >> -TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
> >> +TVHEADEND_VERSION = v4.1-2345-g04ff649
> > 
> > Please keep this as a full hash, like it used to be. It should still
> > work fine with the version reporting, if you write this version to
> > $(@D)/rpm/version, like you're doing below.
> 
>  I'd like to challenge this. We prefer hashes instead of tags because tags may
> still be changed while a hash is guaranteed stable. However, the same can be
> said of tarballs. For tarballs we have the hashes to detect such a situation,
> for VCS downloads we can do the same (if we check hashes).

I don't think we prefer hashes over tags. We do prefer full hashes over 
shortened ones. But tags are most preferable, and we have lots of git tags in 
<PKG>_VERSION.

>  In this particular case, however, it's a github-helper URL so it is a stable
> tarball with a hash, so there is no reason not to use a tag.
> 
>  Here, it's not actually a tag, but rather than a 'describe' on top of a tag.
> Still, it uniquely identifies a commit, and it's more descriptive than just the
> sha1. For example, with the describe, you can immediately see between two
> versions which one is the most recent one[1]. So I do think there is value in
> providing a 'describe' version rather than just a sha1.

I beg to deffer. In my opinion, v4.1-2345-g04ff649 is misleading because it 
gives the impression of a version close to v4.1, which is far from reality.

>  There's one issue, however. v4.1-2345-g04ff649 works now because 04ff649 is a
> unique abbreviation. But when later another commit is generated that starts with
> 04ff649, you need to use v4.1-2345-g04ff649a. So I guess it should be
> v4.1-2345-g04ff649a4c13229ebcaa9828fa04339a49842dd5.

That's better than v4.1-2345-g04ff649, but I think that leaving the 
'v4.1-2345-g' prefix out is better yet.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
