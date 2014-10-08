From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 8 Oct 2014 10:25:36 +0100
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <20141008112001.2e0b8b9b@free-electrons.com>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>	<1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>	<20141007192331.0908bbcd@free-electrons.com>	<5434FC83.3070303@imgtec.com>
 <20141008112001.2e0b8b9b@free-electrons.com>
Message-ID: <54350310.8060802@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/08/2014 10:20 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Wed, 8 Oct 2014 09:57:39 +0100, Vicente Olivert Riera wrote:
>
>>> Why having all those hashes?
>>
>> Why not? Those are all the hashes supported in Buildroot. The more we
>> have the better.
>
> I disagree: more hashes means more work to do when bumping the package.
> Either one strong hash, or two weaker hashes should be sufficient IMO.

More work? I disagree. I created the hash file with a one-liner command:

for i in md5 sha1 sha224 sha256 sha384 sha512; do echo $i `${i}sum 
ser2net-2.10.0.tar.gz` >> ../package/ser2net/ser2net.hash; done

> Something to be discussed at the meeting maybe?
>
>>> And the comment indicating how they have
>>> been found is missing (locally computed? found on the upstream web
>>> site).
>>
>> I haven't added any comment because those hashes were locally computed.
>> Do I need to add a comment explain that?
>
> Yes, I believe so.

No problem, I can resend the patch adding that comment. Or maybe it's 
easier if you or Peter do it, since is a trivial change and you are the 
ones who will commit the patch at the end.

> Best regards,
>
> Thomas
>


-- 
Vincent
