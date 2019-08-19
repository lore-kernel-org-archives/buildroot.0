From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 19:09:53 +0200
Subject: [Buildroot] [PATCH] dehydrated: critical bump to 0.6.5
In-Reply-To: <20190819163749.14021-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 19 Aug 2019 18:37:49 +0200")
References: <20190819163749.14021-1-arnout@mind.be>
Message-ID: <87blwlgjz2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > On July 3, 2019, Let's Encrypt deployed new ACME server software that no
 > longer returns the 'id' field in the account information JSON.
 > Dehydrated relied on this field, even though it is not specified by RFC
 > 8555. Because of this, dehydrated can no longer create a new account on
 > Let's Encrypt.

 > This was fixed by upstream commits be13dcd and 4f358e2. But the latter
 > broke ACMEv1 support so was fixed again in commit f60f2f8.

 > Cherry-picking this correctly is tricky, so instead just bump the
 > version. There are quite a few non-bugfix changes that are included this
 > way, but it's more risky to try to cherry-pick.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

> ---
 > Since this issue essentially breaks dehydrated for new accounts (i.e.
 > any new deployment), I think it's for master and it should be backported
 > to 2019.02.x

OK, I'll cherry pick it when I sync 2019.02.x with master later this
week.

-- 
Bye, Peter Korsgaard
