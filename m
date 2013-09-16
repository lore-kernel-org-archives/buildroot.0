From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Sep 2013 07:40:36 -0300
Subject: [Buildroot] build error since a change in apply-patches.sh
In-Reply-To: <87y56xgkle.fsf@dell.be.48ers.dk>
References: <9F3B5AF9F17649E5A569DE606814A046@JohanW7>
 <87y56xgkle.fsf@dell.be.48ers.dk>
Message-ID: <5236E024.3030207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/16/2013 06:51 AM, Peter Korsgaard wrote:

> Yes, I already brough this up here:
> 
> http://lists.busybox.net/pipermail/buildroot/2013-September/078292.html
> 
> I guess the best option is just to go back to warn on non-patches.

Another headsup with apply-patches.sh:
There's an unintented side-effect of
5871b791995ebe295db7dca608afe3f293ce8953 too, it may apply patches that
are no longer necessary automatically via reverse (-R).
We may see unintended unfixing of things with this, i've seen it happen
to me with some yet unreleased fixes (the big automake bump).
Maybe adding a -N to patch would be in order?
Regards.
