From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2019 22:07:51 +0200
Subject: [Buildroot] [PATCH 16/19] autobuild-run: define source
 directory as part of Builder class
In-Reply-To: <20190621084730.16411-16-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-16-itsatharva@gmail.com>
Message-ID: <63d5112e-ba74-7b8a-5051-910e75bb9410@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2019 10:47, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> -        abssrcdir = os.path.abspath(srcdir)
> +        abssrcdir = os.path.abspath(self.srcdir)

 A further improvement could be to make srcdir an absolute path in __init__. Or
actually, even idir could be made an absolute path, so the rest automatically is
as well. Note that abspath simply prepends the current directory if the path is
not absolute, so it will work even if idir doesn't exist yet.

 But obviously, that's for a separate patch and not at all a priority.

 Regards,
 Arnout
