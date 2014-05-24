From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 May 2014 18:45:41 +0200
Subject: [Buildroot] [PATCH] audiofile: does not build with static-only
In-Reply-To: <1400941494-29900-1-git-send-email-luca@lucaceresoli.net>
References: <1400941494-29900-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20140524184541.47d3f8f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat, 24 May 2014 16:24:54 +0200, Luca Ceresoli wrote:
> Also propagate to its reverse dependency (audiofile module for mpd).
> 
> Fixes:
>   http://autobuild.buildroot.net/results/327/327c18db4e5d0ddc2c72a4684e103c19a1405e50/
>   http://autobuild.buildroot.org/results/c8b/c8b64588eebf0bd8d879881b65e9d8efde00397d/
>   http://autobuild.buildroot.org/results/028/028a3b97d56674560b8aa90b6e44b2e91858a5cb/
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

No, I disagree. The real problem is the fact that we pass --static
instead of -static when building statically, so libtool turns -lstdc++
into a full path to libstdc++.so instead of libstdc++.a.

The real fix is to understand why we switched from -static to --static
a few years ago: there is a commit from Andy Kennedy making this
change, but the commit log is quite fuzzy about why this is actually
needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
