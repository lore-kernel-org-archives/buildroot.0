From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 12:20:51 +0200
Subject: [Buildroot] [PATCH 1/8] libselinux: bump to 2.7
In-Reply-To: <20171010103540.44ee4777@windsurf.lan>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <8f8f5547-b7f4-8172-4989-36a5d8767c16@mind.be>
 <20171010103540.44ee4777@windsurf.lan>
Message-ID: <2953b871-102e-5fdf-4be5-80d9cbb85be0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 10:35, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 10 Oct 2017 02:47:59 +0200, Arnout Vandecappelle wrote:
> 
>>  You update all the individual packages in separate patches, which is excellent
>> for review. However, I wonder if it is really possible to update just one of
>> them without updating the rest. Does libselinux-2.7 work with libsepol-2.7?
>>
>>  If not, we should probably squash all patches into one single patch while
>> applying. Thomas, Peter, do you agree?
> 
> I don't really have a strong opinion. I think it's sometimes hard to
> achieve both full bisectability and fine-grained patches.
> 
> In the same vein, in your review of comment PATCH 5/8 on
> policycoreutils, you rightfully tell Adam that the patch adding the new
> restorecond should come *before* the bump of policycoreutils that drops
> the built-in restorecond functionality. This is obviously correct, but
> it means that there is a step where you have both the new restorecond
> package and the old policycoreutils package, possibly stepping on each
> other, or maybe even with restorecond not building (because it needs
> the newer version of policycoreutils or something).
> 
> So, it's probably hard to have something that is both easy to review
> (fine-grained patches) and bisectable (one big patch).

 For such situations, I would prefer if they were fine-grained patches but with
a cover letter explaining that they should be squashed. Perhaps also a subject
line that clarifies that, maybe even using the interactive autorebase format
("fixup: subject line of the first patch"). And of course the first patch should
have the full final commit log.

 I don't mind big patches in the history. Big patches on the list are not so
nice. They tend to never get reviewed.

 That said, I'm not such a sucker for bisectability anyway. Bisecting is rarely
useful in Buildroot, since you usually know pretty well which commits may have
broken things (and AFAIK git bisect has no option to specify "only consider
patches affecting these subdirs"). And when it's a series anyway, it's pretty
unlikely that the bisect gets stuck in the middle of the series.

 So possibly the least effort approach is: fine-grained patches, don't comment
on their bisectability, and committer may squash if they feel like it.

 So Adam, you can ignore my comments about the order of patches. You'll still
have to correct the legacy stuff however.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
