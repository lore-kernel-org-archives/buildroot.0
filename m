From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 08:13:05 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <20140112183442.GB3374@free.fr>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
 <20140112183442.GB3374@free.fr>
Message-ID: <52D4E381.40905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/14 19:34, Yann E. MORIN wrote:
> Peter, All,
>
> On 2014-01-12 19:23 +0100, Peter Korsgaard spake thusly:
>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>   > I guess there's no point in adding such a check for git, svn and all
>>   > other VCSes. Only 'static' content wouls be elligible to being checked.
>>
>> Why not? I know git gives you strong integrity guarantees (if you use
>> the sha1 atleast), but E.G. svn doesn't.
>
> Because we can't guarantee the reproducibility of an archive generated
> by git archive, since at least the file's date may change, end up in the
> tarball, and thus generate a different hash, even if the 'content' of
> the archive is the same. Also, a different git version may re-order the
> files, or whatever.
>
> For a VCS, maybe the list of files and their respective contents are OK,
> but we can't say anything about the generated archive.

  FWIW, there exists a tool for SPDX that does exactly this: hash all 
files in an archive, ignoring their order and timestamp but making sure 
there are no more and no less files than required.

  But of course, that tool would have to be built as a host-tool because 
it isn't installed on any build machine. And I'm not even sure if the 
tool really exists or is just something that needs to be implemented for 
SPDX.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
