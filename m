From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 8 Oct 2014 11:18:55 +0100
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <54350DC0.3040802@zacarias.com.ar>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
 <20141007192331.0908bbcd@free-electrons.com> <5434FC83.3070303@imgtec.com>
 <20141008112001.2e0b8b9b@free-electrons.com> <543505F5.4080805@imgtec.com>
 <54350DC0.3040802@zacarias.com.ar>
Message-ID: <54350F8F.1020506@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 11:11 AM, Gustavo Zacarias wrote:
> On 10/08/2014 06:37 AM, Markos Chandras wrote:
> 
>>>>> Why having all those hashes?
>>>>
>>>> Why not? Those are all the hashes supported in Buildroot. The more we 
>>>> have the better.
>>>
>>> I disagree: more hashes means more work to do when bumping the package.
>>> Either one strong hash, or two weaker hashes should be sufficient IMO.
>>>
>>> Something to be discussed at the meeting maybe?
>>
>> I am curious, what's the point of supporting more than one hash types?
>> Why not support only the strongest one?
> 
> Normally you want to use upstream-provided hashes and they're not of the
> same class for security.
> You've got basically 3 kinds of security:
> 1) Upstream releases new version/software with hashes.
> 2) Upstream releases tarball signed (pgp).
> 3) Upstream just releases.
> 
> 1 and 2 can intersect which is great.
> Announcements ideally go into a mailing list hence the chance of
> compromising that is far lower than a hash file or note in the web page
> (which can be the same hosting site/server as the tarball).
> If you use a signed pgp that reduces the chance of website compromise
> since ideally the key is stored elsewhere as well.
> If the hash/signature is on a mailing list archive the same happens
> (another site, harder to get all the pieces together).
> If the release is using a weak hash (md5, sha1) for which there are
> possible collissions using two hashes makes it extremely difficult to
> collide in a useful way.
> (re)computing the hash for a bump/package requires that people check the
> signature and we trust that they did it right (did anyone recheck
> besides Baruch with openssh?) instead of just sha256sum(ing) the file
> and sticking that result.
> I think i've covered most of the cases here :)
> Regards.
> 

I understand that, but realistically speaking, supporting so many
different hashes is not very efficient. If an upstream uses weak hashes
for released tarballs, just verify the weak hash on your local pc and
then generate a strong hash yourself. Is there really a point having a
week md5 and a strong sha256 hash at the same time?

-- 
markos
