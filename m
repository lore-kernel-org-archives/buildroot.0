From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Oct 2014 08:35:02 -0300
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <54351F42.2090800@imgtec.com>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
 <20141007192331.0908bbcd@free-electrons.com> <5434FC83.3070303@imgtec.com>
 <20141008112001.2e0b8b9b@free-electrons.com> <543505F5.4080805@imgtec.com>
 <54350DC0.3040802@zacarias.com.ar> <54350F8F.1020506@imgtec.com>
 <5435155D.4020903@zacarias.com.ar> <54351F42.2090800@imgtec.com>
Message-ID: <54352166.5050500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 08:25 AM, Markos Chandras wrote:

> Sure. But this probably is not a strong argument because for all I know
> they may find sha256 broken tomorrow morning and you have to update all
> the buildroot packages using that hash to verify the tarball. If you
> think something is "not strong enough" then don't use it :)
> Perhaps it's best if buildroot supported the two strongest algorithms
> and request that information for every package? I really see no point
> supporting eg md5 since we know it's weak. Anyway, that's my personal
> opinion, I just feel there is no clear "rule" here so developers are
> free to use whatever they want which may not always be acceptable by the
> maintainers :)

Those last lines ^^^ :)
If upstream maintainers ship with md5 there's not much we can do about it.
In the end we do hashes for integrity above everything else and we don't
want to get in the way of new/bumped packages hence hashes aren't
mandatory for now (it would be good to have them all though).
Regards.

PS: and to detect sucky upstream that switches tarballs without bumping
versions to cover their lower heads.
