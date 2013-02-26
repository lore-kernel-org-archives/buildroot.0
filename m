From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Feb 2013 15:49:15 -0300
Subject: [Buildroot] Proposed util-linux split
In-Reply-To: <20130226194054.0ab6cb97@skate>
References: <512C941A.1070207@zacarias.com.ar> <20130226193330.04f77759@skate>
 <20130226194054.0ab6cb97@skate>
Message-ID: <512D03AB.3060508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/2013 03:40 PM, Thomas Petazzoni wrote:
> I just checked, and PAM is only needed when login-utils is enabled.
> 
> Also, 2.22 has apparently moved to a non-recursive usage of automake,
> which should make the build much, much faster.

Yes, we loose util-linux login for non-pam installations.
It's the upstream policy, everyone should have PAM.
On a personal level i don't care really, for the smallest login there's
busybox.
Yes, the build is faster too, however excluding components isn't good on
the non-recursive usage of automake, we'd just have to use good'ol rm in
a POST_BUILD hook unfortunately.
Regards.
