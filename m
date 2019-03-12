From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 16:38:39 +0100
Subject: [Buildroot] [PATCH] package/python3: require util-linux'
 <uuid.h>
In-Reply-To: <86dde90f-6800-4fbb-a7f8-67032a460d77@cesnet.cz>
References: <e5b1510a81bda096dacc133276f1ff2643131dcc.1551975775.git.jan.kundrat@cesnet.cz>
 <20190307212437.22ce6f91@windsurf>
 <86dde90f-6800-4fbb-a7f8-67032a460d77@cesnet.cz>
Message-ID: <20190312163839.6987a4d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Tue, 12 Mar 2019 16:26:07 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> It was with the totally unsupported top-level parallel build with Buildroot 
> master. I thought that it was just a mere issue with dependencies, but 
> apparently it's a fragile upstream. I can confirm that the per-package 
> directory patch makes it stable.
> 
> As such, I think that there's little point in fixing this within buildroot. 
> I'm looking forward towards a merge of the per-package build dir. Sorry for 
> noise!

Top-level parallel build without per-package build directories is still
never going to work reliably, which is why top-level parallel build is
forcefully disabled in the main Buildroot Makefile today. We are not
going to merge fixes or quirks for top-level parallel build without
per-package directories.

Thanks for confirming!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
