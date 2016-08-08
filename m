From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Aug 2016 19:42:13 +0200
Subject: [Buildroot] [RFC 0/2] script to find package licenses
In-Reply-To: <20160805095353.68bf1fd9@free-electrons.com>
References: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160804183335.0947f9a9@free-electrons.com>
 <57A44379.9010208@imgtec.com>
 <20160805095353.68bf1fd9@free-electrons.com>
Message-ID: <20160808174213.GD5876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-08-05 09:53 +0200, Thomas Petazzoni spake thusly:
> On Fri, 5 Aug 2016 13:12:49 +0530, Rahul Bedarkar wrote:
> > Intention of script is to help us to verify or correct legal info that 
> > we add in .mk file. This could be a handy tool that can be used by 
> > anyone when we do version bump or add new package. The complex tools 
> > that are available are generally used by upstream package providers for 
> > Open Source Compliance which provide lot more information than just file 
> > license. And integrating such tools in Buildroot might be difficult. But 
> > in Buildroot where we just need license of a package, script could be 
> > useful as a starting point.
> 
> I'm sorry, but I still don't see why we should merge a script that we
> would have to maintain, while there are some existing, actively
> developed and more powerful tools doing the same work.
> 
> Moreover, I believe that the cases that can be detected automatically
> by a script (such as a clear GPL, LGPL, BSD or MIT license) are clearly
> not the ones for which it is difficult to write the <pkg>_LICENSE
> string.
> 
> The ones for which it is difficult are the ones that a script will
> never handle as it can't recognize any pattern.

I concur with Thomas here. The obvious licenses we can find pretty
easily, so those ar enot the ones we must look for.

On the other hand, the ones for which we would need an automated
solution are not easy to find automatically.

Hence this is a catch-22 situation.

However, I think we could rely on an external siolution to find
licenses. For example, Fossology and SPDX have both been mentionned
already. It would be nice to see how we could interface to either to get
a list of potential licenses for a package.

AFAICS, SPDX does not provide a mean to extract free-form licensing in
source code; the licensing information has to be specially encoded with
specific headers. If that is the case, then we could use the SPDX
scripts to extract SPDX licensing information.

AS for Fossology, they have a publicly-available instance, but it is
only meant as a test-bed; it is neither supposed to be always available
nor supposed to be reliable. One can install Fossology locally, but I
haven't seen where one may download the database.

All in all, if we were to add support for automtically extract licensing
information from a pacakge source code, I firmly believe this should be
done with existing tools, not ones we invent ourselves.

I'll be marking those two patches are ejcted in out patchwork.

However, we would *really* welcome a similar addition that would make
use of existing infrastructures like SPDX or Fossology (or others).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
