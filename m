From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 18:06:55 +0100
Subject: [Buildroot] [PATCH v3] luarocks: add buildroot addon
In-Reply-To: <20181219081707.1983-2-francois.perrad@gadz.org>
References: <20181219081707.1983-1-francois.perrad@gadz.org>
 <20181219081707.1983-2-francois.perrad@gadz.org>
Message-ID: <20181231180655.1e49b950@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Dec 2018 09:17:03 +0100, Francois Perrad wrote:

> ++   if #licenses == 1 then
> ++      f:write(ucname .. '_LICENSE_FILES = $(' .. ucname .. '_SUBDIR)/' .. licenses[1] .. '\n')
> ++   elseif #licenses > 1 then
> ++      f:write(ucname .. '_LICENSE_FILES =')
> ++      for i = 1, #licenses do
> ++         local file = licenses[i]
> ++         f:write(' \\\n    $(' .. ucname .. '_SUBDIR)/' .. file)

This is not good: it indents each line with 4 spaces, while it should
indent with one tab. Due to this, the regenerated .mk files caused
check-package to complain. I fixed the issues manually in:

  https://git.busybox.net/buildroot/commit/?id=42fa5bcbfb48f188c2c180854c0bbdefd98c32c8

But of course the Luarocks addon must be fixed to not re-introduce
similar issues. Could you cook a patch to that effect ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
