From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 7 Jan 2021 13:50:13 -0600
Subject: [Buildroot] [PATCH 04/10 v3] WIP: support/download: change
 format of archives generated from git
In-Reply-To: <40590de01b9e5f003d38c9728ad04439cb17a72c.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <40590de01b9e5f003d38c9728ad04439cb17a72c.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <01c2654d-896c-13ce-f247-ff6fa3aefd60@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/29/20 5:01 AM, Yann E. MORIN wrote:
> ** WIP: needs an update to all the hashes.
> 
> Switch to using the tarball helper, that can generate reproducible
> archives whatever the tar version >= 1.27.
> 
> However, those archives are not identical to the previous ones generated
> in the (now-broken) gnu format.
> 
> To avoid any clashing between old and new archives, and new and old
> Buildroot versions, we need to name the new generated archives
> differently from the existing ones.
> 
> So, we bump the git-specific format-version to _br1.
> 

I agree with Arnout's comment about changing this from "_br1" to ".br1" or something similar so that it doesn't look 
like an extension to the package version and is instead more clearly a Buildroot tarball version of a given package.

> The %ci date  has been supported by git back to 1.6.0, released August
> 2008); it is not strictly ISO8601, but is still accepted as a PAX date
> header. The strict ISO8601 placeholder, %cI, was only intriduced with
> 2.2.0, release in November 2014, so too recent to be widely available.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
