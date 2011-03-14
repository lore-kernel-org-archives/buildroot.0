From: Martin Hicks <mort@bork.org>
Date: Mon, 14 Mar 2011 10:14:26 -0400
Subject: [Buildroot] Samba build problem
In-Reply-To: <877hc5pat3.fsf@macbook.be.48ers.dk>
References: <AANLkTinF_No7g1_N7cVDbwiyc7D+uRtkgW5HkG3crnsT@mail.gmail.com>
	<877hc5pat3.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=j+_OcDVOdc2ssYcKqG0KgY4onTS_qZc5Q4o32@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 11, 2011 at 5:11 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:
>
> ?Martin> Hi,
>
> ?Martin> When I recently merged the 2011-02 changes into my tree samba
> ?Martin> started to fail to compile. ?Has anyone else seen this? ?I did
> ?Martin> look into the git logs and it seems like the LIBTOOL patch and
> ?Martin> a recent CVE are the only things that have touched
> ?Martin> package/samba lately.
>
> I guess you mean post-2011.02 changes, as the CVE 2011 fix was only
> added on the 4th - But yes, that's the reason why the build is breaking.
>
> The problem is the patch logic in AUTOTARGET doesn't apply the other
> patches when it sees a samba-$VERSION-*.patch file, so the fix is simply
> to remove the version number from the patch file name like I have done
> in git.

Great.  Latest git is fixed.

Thanks,
mh

-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
